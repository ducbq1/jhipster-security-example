package com.untralvious.demo.security.repository;

import com.untralvious.demo.security.domain.SysUser;

import java.time.Instant;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import com.untralvious.demo.security.domain.User;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.*;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 * Spring Data JPA repository for the SysUser entity.
 *
 * When extending this class, extend SysUserRepositoryWithBagRelationships too.
 * For more information refer to https://github.com/jhipster/generator-jhipster/issues/17990.
 */
@Repository
public interface SysUserRepository extends SysUserRepositoryWithBagRelationships, JpaRepository<SysUser, UUID> {
    default Optional<SysUser> findOneWithEagerRelationships(UUID id) {
        return this.fetchBagRelationships(this.findById(id));
    }

    default List<SysUser> findAllWithEagerRelationships() {
        return this.fetchBagRelationships(this.findAll());
    }

    default Page<SysUser> findAllWithEagerRelationships(Pageable pageable) {
        return this.fetchBagRelationships(this.findAll(pageable));
    }

    Optional<SysUser> findOneByResetKey(String resetKey);

    String USERS_BY_LOGIN_CACHE = "usersByLogin";

    String USERS_BY_EMAIL_CACHE = "usersByEmail";

    Optional<SysUser> findOneByActivationKey(String activationKey);
    List<SysUser> findAllByActivatedIsFalseAndActivationKeyIsNotNullAndCreatedDateBefore(Instant dateTime);
    Optional<SysUser> findOneByEmailIgnoreCase(String email);
    Optional<SysUser> findOneByLogin(String login);

    @EntityGraph(attributePaths = "authorities")
    @Cacheable(cacheNames = USERS_BY_LOGIN_CACHE)
    Optional<SysUser> findOneWithAuthoritiesByLogin(String login);

    @EntityGraph(attributePaths = "authorities")
    @Cacheable(cacheNames = USERS_BY_EMAIL_CACHE)
    Optional<SysUser> findOneWithAuthoritiesByEmailIgnoreCase(String email);

    Page<SysUser> findAllByIdNotNullAndActivatedIsTrue(Pageable pageable);

}
