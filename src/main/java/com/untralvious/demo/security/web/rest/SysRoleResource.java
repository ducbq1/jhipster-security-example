package com.untralvious.demo.security.web.rest;

import com.untralvious.demo.security.domain.SysRole;
import com.untralvious.demo.security.repository.SysRoleRepository;
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
 * REST controller for managing {@link com.untralvious.demo.security.domain.SysRole}.
 */
@RestController
@RequestMapping("/api")
@Transactional
public class SysRoleResource {

    private final Logger log = LoggerFactory.getLogger(SysRoleResource.class);

    private static final String ENTITY_NAME = "sysRole";

    @Value("${jhipster.clientApp.name}")
    private String applicationName;

    private final SysRoleRepository sysRoleRepository;

    public SysRoleResource(SysRoleRepository sysRoleRepository) {
        this.sysRoleRepository = sysRoleRepository;
    }

    /**
     * {@code POST  /sys-roles} : Create a new sysRole.
     *
     * @param sysRole the sysRole to create.
     * @return the {@link ResponseEntity} with status {@code 201 (Created)} and with body the new sysRole, or with status {@code 400 (Bad Request)} if the sysRole has already an ID.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PostMapping("/sys-roles")
    public ResponseEntity<SysRole> createSysRole(@Valid @RequestBody SysRole sysRole) throws URISyntaxException {
        log.debug("REST request to save SysRole : {}", sysRole);
        if (sysRole.getId() != null) {
            throw new BadRequestAlertException("A new sysRole cannot already have an ID", ENTITY_NAME, "idexists");
        }
        SysRole result = sysRoleRepository.save(sysRole);
        return ResponseEntity
            .created(new URI("/api/sys-roles/" + result.getId()))
            .headers(HeaderUtil.createEntityCreationAlert(applicationName, false, ENTITY_NAME, result.getId().toString()))
            .body(result);
    }

    /**
     * {@code PUT  /sys-roles/:id} : Updates an existing sysRole.
     *
     * @param id the id of the sysRole to save.
     * @param sysRole the sysRole to update.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the updated sysRole,
     * or with status {@code 400 (Bad Request)} if the sysRole is not valid,
     * or with status {@code 500 (Internal Server Error)} if the sysRole couldn't be updated.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PutMapping("/sys-roles/{id}")
    public ResponseEntity<SysRole> updateSysRole(
        @PathVariable(value = "id", required = false) final UUID id,
        @Valid @RequestBody SysRole sysRole
    ) throws URISyntaxException {
        log.debug("REST request to update SysRole : {}, {}", id, sysRole);
        if (sysRole.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, sysRole.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!sysRoleRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        SysRole result = sysRoleRepository.save(sysRole);
        return ResponseEntity
            .ok()
            .headers(HeaderUtil.createEntityUpdateAlert(applicationName, false, ENTITY_NAME, sysRole.getId().toString()))
            .body(result);
    }

    /**
     * {@code PATCH  /sys-roles/:id} : Partial updates given fields of an existing sysRole, field will ignore if it is null
     *
     * @param id the id of the sysRole to save.
     * @param sysRole the sysRole to update.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the updated sysRole,
     * or with status {@code 400 (Bad Request)} if the sysRole is not valid,
     * or with status {@code 404 (Not Found)} if the sysRole is not found,
     * or with status {@code 500 (Internal Server Error)} if the sysRole couldn't be updated.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PatchMapping(value = "/sys-roles/{id}", consumes = { "application/json", "application/merge-patch+json" })
    public ResponseEntity<SysRole> partialUpdateSysRole(
        @PathVariable(value = "id", required = false) final UUID id,
        @NotNull @RequestBody SysRole sysRole
    ) throws URISyntaxException {
        log.debug("REST request to partial update SysRole partially : {}, {}", id, sysRole);
        if (sysRole.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, sysRole.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!sysRoleRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        Optional<SysRole> result = sysRoleRepository
            .findById(sysRole.getId())
            .map(existingSysRole -> {
                if (sysRole.getRoleName() != null) {
                    existingSysRole.setRoleName(sysRole.getRoleName());
                }
                if (sysRole.getRoleCode() != null) {
                    existingSysRole.setRoleCode(sysRole.getRoleCode());
                }
                if (sysRole.getDescription() != null) {
                    existingSysRole.setDescription(sysRole.getDescription());
                }
                if (sysRole.getCreateBy() != null) {
                    existingSysRole.setCreateBy(sysRole.getCreateBy());
                }
                if (sysRole.getCreateTime() != null) {
                    existingSysRole.setCreateTime(sysRole.getCreateTime());
                }
                if (sysRole.getUpdateBy() != null) {
                    existingSysRole.setUpdateBy(sysRole.getUpdateBy());
                }
                if (sysRole.getUpdateTime() != null) {
                    existingSysRole.setUpdateTime(sysRole.getUpdateTime());
                }

                return existingSysRole;
            })
            .map(sysRoleRepository::save);

        return ResponseUtil.wrapOrNotFound(
            result,
            HeaderUtil.createEntityUpdateAlert(applicationName, false, ENTITY_NAME, sysRole.getId().toString())
        );
    }

    /**
     * {@code GET  /sys-roles} : get all the sysRoles.
     *
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and the list of sysRoles in body.
     */
    @GetMapping("/sys-roles")
    public List<SysRole> getAllSysRoles() {
        log.debug("REST request to get all SysRoles");
        return sysRoleRepository.findAll();
    }

    /**
     * {@code GET  /sys-roles/:id} : get the "id" sysRole.
     *
     * @param id the id of the sysRole to retrieve.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the sysRole, or with status {@code 404 (Not Found)}.
     */
    @GetMapping("/sys-roles/{id}")
    public ResponseEntity<SysRole> getSysRole(@PathVariable UUID id) {
        log.debug("REST request to get SysRole : {}", id);
        Optional<SysRole> sysRole = sysRoleRepository.findById(id);
        return ResponseUtil.wrapOrNotFound(sysRole);
    }

    /**
     * {@code DELETE  /sys-roles/:id} : delete the "id" sysRole.
     *
     * @param id the id of the sysRole to delete.
     * @return the {@link ResponseEntity} with status {@code 204 (NO_CONTENT)}.
     */
    @DeleteMapping("/sys-roles/{id}")
    public ResponseEntity<Void> deleteSysRole(@PathVariable UUID id) {
        log.debug("REST request to delete SysRole : {}", id);
        sysRoleRepository.deleteById(id);
        return ResponseEntity
            .noContent()
            .headers(HeaderUtil.createEntityDeletionAlert(applicationName, false, ENTITY_NAME, id.toString()))
            .build();
    }
}
