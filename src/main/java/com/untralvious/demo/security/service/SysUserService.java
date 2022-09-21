package com.untralvious.demo.security.service;

import com.untralvious.demo.security.config.Constants;
import com.untralvious.demo.security.domain.Authority;
import com.untralvious.demo.security.domain.SysRole;
import com.untralvious.demo.security.domain.SysUser;
import com.untralvious.demo.security.domain.User;
import com.untralvious.demo.security.repository.AuthorityRepository;
import com.untralvious.demo.security.repository.SysRoleRepository;
import com.untralvious.demo.security.repository.SysUserRepository;
import com.untralvious.demo.security.repository.UserRepository;
import com.untralvious.demo.security.security.AuthoritiesConstants;
import com.untralvious.demo.security.security.SecurityUtils;
import com.untralvious.demo.security.service.dto.AdminUserDTO;
import com.untralvious.demo.security.service.dto.SysRoleDTO;
import com.untralvious.demo.security.service.dto.SysUserDTO;
import com.untralvious.demo.security.service.dto.UserDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cache.CacheManager;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tech.jhipster.security.RandomUtil;

import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.*;
import java.util.stream.Collectors;

/**
 * Service class for managing users.
 */
@Service
@Transactional
public class SysUserService {

    private final Logger log = LoggerFactory.getLogger(SysUserService.class);

    private final SysUserRepository sysUserRepository;

    private final PasswordEncoder passwordEncoder;

    private final SysRoleRepository sysRoleRepository;

    private final CacheManager cacheManager;

    public SysUserService(
        SysUserRepository sysUserRepository,
        PasswordEncoder passwordEncoder,
        SysRoleRepository sysRoleRepository,
        CacheManager cacheManager
    ) {
        this.sysUserRepository = sysUserRepository;
        this.passwordEncoder = passwordEncoder;
        this.sysRoleRepository = sysRoleRepository;
        this.cacheManager = cacheManager;
    }

    public Optional<SysUser> activateRegistration(String key) {
        log.debug("Activating user for activation key {}", key);
        return sysUserRepository
            .findOneByActivationKey(key)
            .map(user -> {
                // activate given user for the registration key.
                user.setStatus(1);
                user.setActivitySync(null);
                this.clearUserCaches(user);
                log.debug("Activated user: {}", user);
                return user;
            });
    }

    public Optional<SysUser> completePasswordReset(String newPassword, String key) {
        log.debug("Reset user password for reset key {}", key);
        return sysUserRepository
            .findOneByResetKey(key)
            .filter(user -> user.getUpdateTime().isAfter(Instant.now().minus(1, ChronoUnit.DAYS)))
            .map(user -> {
                user.setPassword(passwordEncoder.encode(newPassword));
                user.setOrgCode(null);
                user.setUpdateTime(null);
                this.clearUserCaches(user);
                return user;
            });
    }

    public Optional<SysUser> requestPasswordReset(String mail) {
        return sysUserRepository
            .findOneByEmailIgnoreCase(mail)
            .filter(p -> p.getStatus() == 1)
            .map(user -> {
                user.setOrgCode(RandomUtil.generateResetKey());
                user.setUpdateTime(Instant.now());
                this.clearUserCaches(user);
                return user;
            });
    }

    public SysUser registerUser(AdminUserDTO userDTO, String password) {
        sysUserRepository
            .findOneByLogin(userDTO.getLogin().toLowerCase())
            .ifPresent(existingUser -> {
                boolean removed = removeNonActivatedUser(existingUser);
                if (!removed) {
                    throw new UsernameAlreadyUsedException();
                }
            });
        sysUserRepository
            .findOneByEmailIgnoreCase(userDTO.getEmail())
            .ifPresent(existingUser -> {
                boolean removed = removeNonActivatedUser(existingUser);
                if (!removed) {
                    throw new EmailAlreadyUsedException();
                }
            });
        SysUser newUser = new SysUser();
        String encryptedPassword = passwordEncoder.encode(password);
        newUser.setUsername(userDTO.getLogin().toLowerCase());
        // new user gets initially a generated password
        newUser.setPassword(encryptedPassword);
        newUser.setRealName(userDTO.getFirstName() + userDTO.getLastName());
        if (userDTO.getEmail() != null) {
            newUser.setEmail(userDTO.getEmail().toLowerCase());
        }
        newUser.setAvatar(userDTO.getImageUrl());
        newUser.setOrgCode(userDTO.getLangKey());
        // new user is not active
        newUser.setStatus(0);
        // new user gets registration key
        newUser.setOrgCode(RandomUtil.generateActivationKey());
        Set<SysRole> authorities = new HashSet<>();
//        sysRoleRepository.findById(AuthoritiesConstants.USER).ifPresent(authorities::add);
        sysRoleRepository.findById(userDTO.getId()).ifPresent(authorities::add);
        newUser.setIds(authorities);
        sysUserRepository.save(newUser);
        this.clearUserCaches(newUser);
        log.debug("Created Information for User: {}", newUser);
        return newUser;
    }

    private boolean removeNonActivatedUser(SysUser existingUser) {
        if (existingUser.getStatus() == 1) {
            return false;
        }
        sysUserRepository.delete(existingUser);
        sysUserRepository.flush();
        this.clearUserCaches(existingUser);
        return true;
    }

    public SysUser createUser(AdminUserDTO userDTO) {
        SysUser user = new SysUser();
        user.setLogin(userDTO.getLogin().toLowerCase());
        user.setFirstName(userDTO.getFirstName());
        user.setLastName(userDTO.getLastName());
        if (userDTO.getEmail() != null) {
            user.setEmail(userDTO.getEmail().toLowerCase());
        }
        user.setImageUrl(userDTO.getImageUrl());
        if (userDTO.getLangKey() == null) {
            user.setLangKey(Constants.DEFAULT_LANGUAGE); // default language
        } else {
            user.setLangKey(userDTO.getLangKey());
        }
        String encryptedPassword = passwordEncoder.encode(RandomUtil.generatePassword());
        user.setPassword(encryptedPassword);
        user.setResetKey(RandomUtil.generateResetKey());
        user.setResetDate(Instant.now());
        user.setActivated(true);
        if (userDTO.getAuthorities() != null) {
            Set<SysRole> authorities = userDTO
                .getAuthorities()
                .stream()
                .map(sysRoleRepository::findById)
                .filter(Optional::isPresent)
                .map(Optional::get)
                .collect(Collectors.toSet());
            user.setIds(authorities);
        }
        sysUserRepository.save(user);
        this.clearUserCaches(user);
        log.debug("Created Information for User: {}", user);
        return user;
    }

    /**
     * Update all information for a specific user, and return the modified user.
     *
     * @param userDTO user to update.
     * @return updated user.
     */
    public Optional<AdminUserDTO> updateUser(AdminUserDTO userDTO) {
        return Optional
            .of(sysUserRepository.findById(userDTO.getId()))
            .filter(Optional::isPresent)
            .map(Optional::get)
            .map(user -> {
                this.clearUserCaches(user);
                user.setUsername(userDTO.getLogin().toLowerCase());
                user.setRealName(userDTO.getFirstName() + userDTO.getLastName());
                if (userDTO.getEmail() != null) {
                    user.setEmail(userDTO.getEmail().toLowerCase());
                }
                user.setAvatar(userDTO.getImageUrl());
                user.setStatus(userDTO.isActivated() ? 1 : 0);
                user.setOrgCode(userDTO.getLangKey());
                Set<SysRole> managedAuthorities = user.getIds();
                managedAuthorities.clear();
                userDTO
                    .getAuthorities()
                    .stream()
                    .map(sysRoleRepository::findById)
                    .filter(Optional::isPresent)
                    .map(Optional::get)
                    .forEach(managedAuthorities::add);
                this.clearUserCaches(user);
                log.debug("Changed Information for User: {}", user);
                return user;
            })
            .map(AdminUserDTO::new);
    }

    public void deleteUser(String login) {
        sysUserRepository
            .findOneByLogin(login)
            .ifPresent(user -> {
                sysUserRepository.delete(user);
                this.clearUserCaches(user);
                log.debug("Deleted User: {}", user);
            });
    }

    /**
     * Update basic information (first name, last name, email, language) for the current user.
     *
     * @param firstName first name of user.
     * @param lastName  last name of user.
     * @param email     email id of user.
     * @param langKey   language key.
     * @param imageUrl  image URL of user.
     */
    public void updateUser(String firstName, String lastName, String email, String langKey, String imageUrl) {
        SecurityUtils
            .getCurrentUserLogin()
            .flatMap(sysUserRepository::findOneByLogin)
            .ifPresent(user -> {
                user.setRealName(firstName + lastName);
                if (email != null) {
                    user.setEmail(email.toLowerCase());
                }
                user.setOrgCode(langKey);
                user.setAvatar(imageUrl);
                this.clearUserCaches(user);
                log.debug("Changed Information for User: {}", user);
            });
    }

    @Transactional
    public void changePassword(String currentClearTextPassword, String newPassword) {
        SecurityUtils
            .getCurrentUserLogin()
            .flatMap(sysUserRepository::findOneByLogin)
            .ifPresent(user -> {
                String currentEncryptedPassword = user.getPassword();
                if (!passwordEncoder.matches(currentClearTextPassword, currentEncryptedPassword)) {
                    throw new InvalidPasswordException();
                }
                String encryptedPassword = passwordEncoder.encode(newPassword);
                user.setPassword(encryptedPassword);
                this.clearUserCaches(user);
                log.debug("Changed password for User: {}", user);
            });
    }

    @Transactional(readOnly = true)
    public Page<SysUserDTO> getAllManagedUsers(Pageable pageable) {
        return sysUserRepository.findAll(pageable).map(SysUserDTO::new);
    }

    @Transactional(readOnly = true)
    public Page<SysUserDTO> getAllPublicUsers(Pageable pageable) {
        return sysUserRepository.findAllByIdNotNullAndActivatedIsTrue(pageable).map(SysUserDTO::new);
    }

    @Transactional(readOnly = true)
    public Optional<SysUser> getUserWithAuthoritiesByLogin(String login) {
        return sysUserRepository.findOneWithAuthoritiesByLogin(login);
    }

    @Transactional(readOnly = true)
    public Optional<SysUser> getUserWithAuthorities() {
        return SecurityUtils.getCurrentUserLogin().flatMap(sysUserRepository::findOneWithAuthoritiesByLogin);
    }

    /**
     * Not activated users should be automatically deleted after 3 days.
     * <p>
     * This is scheduled to get fired everyday, at 01:00 (am).
     */
    @Scheduled(cron = "0 0 1 * * ?")
    public void removeNotActivatedUsers() {
        sysUserRepository
            .findAllByActivatedIsFalseAndActivationKeyIsNotNullAndCreatedDateBefore(Instant.now().minus(3, ChronoUnit.DAYS))
            .forEach(user -> {
                log.debug("Deleting not activated user {}", user.getUsername());
                sysUserRepository.delete(user);
                this.clearUserCaches(user);
            });
    }

    /**
     * Gets a list of all the authorities.
     * @return a list of all the authorities.
     */
    @Transactional(readOnly = true)
    public List<String> getAuthorities() {
        return sysRoleRepository.findAll().stream().map(SysRole::getRoleName).collect(Collectors.toList());
    }

    private void clearUserCaches(SysUser user) {
        Objects.requireNonNull(cacheManager.getCache(sysUserRepository.USERS_BY_LOGIN_CACHE)).evict(user.getUsername());
        if (user.getEmail() != null) {
            Objects.requireNonNull(cacheManager.getCache(UserRepository.USERS_BY_EMAIL_CACHE)).evict(user.getEmail());
        }
    }
}
