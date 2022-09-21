package com.untralvious.demo.security.web.rest;

import com.untralvious.demo.security.domain.SysUser;
import com.untralvious.demo.security.repository.SysUserRepository;
import com.untralvious.demo.security.web.rest.errors.BadRequestAlertException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.UUID;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import tech.jhipster.web.util.HeaderUtil;
import tech.jhipster.web.util.ResponseUtil;

/**
 * REST controller for managing {@link com.untralvious.demo.security.domain.SysUser}.
 */
@RestController
@RequestMapping("/api")
@Transactional
public class SysUserResource {

    private final Logger log = LoggerFactory.getLogger(SysUserResource.class);

    private static final String ENTITY_NAME = "sysUser";

    @Value("${jhipster.clientApp.name}")
    private String applicationName;

    private final SysUserRepository sysUserRepository;

    public SysUserResource(SysUserRepository sysUserRepository) {
        this.sysUserRepository = sysUserRepository;
    }

    /**
     * {@code POST  /sys-users} : Create a new sysUser.
     *
     * @param sysUser the sysUser to create.
     * @return the {@link ResponseEntity} with status {@code 201 (Created)} and with body the new sysUser, or with status {@code 400 (Bad Request)} if the sysUser has already an ID.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PostMapping("/sys-users")
    public ResponseEntity<SysUser> createSysUser(@Valid @RequestBody SysUser sysUser) throws URISyntaxException {
        log.debug("REST request to save SysUser : {}", sysUser);
        if (sysUser.getId() != null) {
            throw new BadRequestAlertException("A new sysUser cannot already have an ID", ENTITY_NAME, "idexists");
        }
        SysUser result = sysUserRepository.save(sysUser);
        return ResponseEntity
            .created(new URI("/api/sys-users/" + result.getId()))
            .headers(HeaderUtil.createEntityCreationAlert(applicationName, false, ENTITY_NAME, result.getId().toString()))
            .body(result);
    }

    /**
     * {@code PUT  /sys-users/:id} : Updates an existing sysUser.
     *
     * @param id the id of the sysUser to save.
     * @param sysUser the sysUser to update.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the updated sysUser,
     * or with status {@code 400 (Bad Request)} if the sysUser is not valid,
     * or with status {@code 500 (Internal Server Error)} if the sysUser couldn't be updated.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PutMapping("/sys-users/{id}")
    public ResponseEntity<SysUser> updateSysUser(
        @PathVariable(value = "id", required = false) final UUID id,
        @Valid @RequestBody SysUser sysUser
    ) throws URISyntaxException {
        log.debug("REST request to update SysUser : {}, {}", id, sysUser);
        if (sysUser.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, sysUser.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!sysUserRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        SysUser result = sysUserRepository.save(sysUser);
        return ResponseEntity
            .ok()
            .headers(HeaderUtil.createEntityUpdateAlert(applicationName, false, ENTITY_NAME, sysUser.getId().toString()))
            .body(result);
    }

    /**
     * {@code PATCH  /sys-users/:id} : Partial updates given fields of an existing sysUser, field will ignore if it is null
     *
     * @param id the id of the sysUser to save.
     * @param sysUser the sysUser to update.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the updated sysUser,
     * or with status {@code 400 (Bad Request)} if the sysUser is not valid,
     * or with status {@code 404 (Not Found)} if the sysUser is not found,
     * or with status {@code 500 (Internal Server Error)} if the sysUser couldn't be updated.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PatchMapping(value = "/sys-users/{id}", consumes = { "application/json", "application/merge-patch+json" })
    public ResponseEntity<SysUser> partialUpdateSysUser(
        @PathVariable(value = "id", required = false) final UUID id,
        @NotNull @RequestBody SysUser sysUser
    ) throws URISyntaxException {
        log.debug("REST request to partial update SysUser partially : {}, {}", id, sysUser);
        if (sysUser.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, sysUser.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!sysUserRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        Optional<SysUser> result = sysUserRepository
            .findById(sysUser.getId())
            .map(existingSysUser -> {
                if (sysUser.getUsername() != null) {
                    existingSysUser.setUsername(sysUser.getUsername());
                }
                if (sysUser.getRealName() != null) {
                    existingSysUser.setRealName(sysUser.getRealName());
                }
                if (sysUser.getPassword() != null) {
                    existingSysUser.setPassword(sysUser.getPassword());
                }
                if (sysUser.getSalt() != null) {
                    existingSysUser.setSalt(sysUser.getSalt());
                }
                if (sysUser.getAvatar() != null) {
                    existingSysUser.setAvatar(sysUser.getAvatar());
                }
                if (sysUser.getBirthday() != null) {
                    existingSysUser.setBirthday(sysUser.getBirthday());
                }
                if (sysUser.getSex() != null) {
                    existingSysUser.setSex(sysUser.getSex());
                }
                if (sysUser.getEmail() != null) {
                    existingSysUser.setEmail(sysUser.getEmail());
                }
                if (sysUser.getPhone() != null) {
                    existingSysUser.setPhone(sysUser.getPhone());
                }
                if (sysUser.getOrgCode() != null) {
                    existingSysUser.setOrgCode(sysUser.getOrgCode());
                }
                if (sysUser.getStatus() != null) {
                    existingSysUser.setStatus(sysUser.getStatus());
                }
                if (sysUser.getDelFlag() != null) {
                    existingSysUser.setDelFlag(sysUser.getDelFlag());
                }
                if (sysUser.getThirdId() != null) {
                    existingSysUser.setThirdId(sysUser.getThirdId());
                }
                if (sysUser.getThirdType() != null) {
                    existingSysUser.setThirdType(sysUser.getThirdType());
                }
                if (sysUser.getActivitySync() != null) {
                    existingSysUser.setActivitySync(sysUser.getActivitySync());
                }
                if (sysUser.getWorkNo() != null) {
                    existingSysUser.setWorkNo(sysUser.getWorkNo());
                }
                if (sysUser.getPost() != null) {
                    existingSysUser.setPost(sysUser.getPost());
                }
                if (sysUser.getTelephone() != null) {
                    existingSysUser.setTelephone(sysUser.getTelephone());
                }
                if (sysUser.getCreateBy() != null) {
                    existingSysUser.setCreateBy(sysUser.getCreateBy());
                }
                if (sysUser.getCreateTime() != null) {
                    existingSysUser.setCreateTime(sysUser.getCreateTime());
                }
                if (sysUser.getUpdateBy() != null) {
                    existingSysUser.setUpdateBy(sysUser.getUpdateBy());
                }
                if (sysUser.getUpdateTime() != null) {
                    existingSysUser.setUpdateTime(sysUser.getUpdateTime());
                }
                if (sysUser.getUserIdentity() != null) {
                    existingSysUser.setUserIdentity(sysUser.getUserIdentity());
                }
                if (sysUser.getDepartIds() != null) {
                    existingSysUser.setDepartIds(sysUser.getDepartIds());
                }
                if (sysUser.getRelTenantIds() != null) {
                    existingSysUser.setRelTenantIds(sysUser.getRelTenantIds());
                }
                if (sysUser.getClientId() != null) {
                    existingSysUser.setClientId(sysUser.getClientId());
                }

                return existingSysUser;
            })
            .map(sysUserRepository::save);

        return ResponseUtil.wrapOrNotFound(
            result,
            HeaderUtil.createEntityUpdateAlert(applicationName, false, ENTITY_NAME, sysUser.getId().toString())
        );
    }

    /**
     * {@code GET  /sys-users} : get all the sysUsers.
     *
     * @param eagerload flag to eager load entities from relationships (This is applicable for many-to-many).
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and the list of sysUsers in body.
     */
    @GetMapping("/sys-users")
    public List<SysUser> getAllSysUsers(@RequestParam(required = false, defaultValue = "false") boolean eagerload) {
        log.debug("REST request to get all SysUsers");
        if (eagerload) {
            return sysUserRepository.findAllWithEagerRelationships();
        } else {
            return sysUserRepository.findAll();
        }
    }

    /**
     * {@code GET  /sys-users/:id} : get the "id" sysUser.
     *
     * @param id the id of the sysUser to retrieve.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the sysUser, or with status {@code 404 (Not Found)}.
     */
    @GetMapping("/sys-users/{id}")
    public ResponseEntity<SysUser> getSysUser(@PathVariable Long id) {
        log.debug("REST request to get SysUser : {}", id);
        Optional<SysUser> sysUser = sysUserRepository.findOneWithEagerRelationships(id);
        return ResponseUtil.wrapOrNotFound(sysUser);
    }

    /**
     * {@code DELETE  /sys-users/:id} : delete the "id" sysUser.
     *
     * @param id the id of the sysUser to delete.
     * @return the {@link ResponseEntity} with status {@code 204 (NO_CONTENT)}.
     */
    @DeleteMapping("/sys-users/{id}")
    public ResponseEntity<Void> deleteSysUser(@PathVariable UUID id) {
        log.debug("REST request to delete SysUser : {}", id);
        sysUserRepository.deleteById(id);
        return ResponseEntity
            .noContent()
            .headers(HeaderUtil.createEntityDeletionAlert(applicationName, false, ENTITY_NAME, id.toString()))
            .build();
    }
}
