package com.untralvious.demo.security.web.rest;

import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.hasItem;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import com.untralvious.demo.security.IntegrationTest;
import com.untralvious.demo.security.domain.SysRole;
import com.untralvious.demo.security.repository.SysRoleRepository;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.UUID;
import javax.persistence.EntityManager;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

/**
 * Integration tests for the {@link SysRoleResource} REST controller.
 */
@IntegrationTest
@AutoConfigureMockMvc
@WithMockUser
class SysRoleResourceIT {

    private static final String DEFAULT_ROLE_NAME = "AAAAAAAAAA";
    private static final String UPDATED_ROLE_NAME = "BBBBBBBBBB";

    private static final String DEFAULT_ROLE_CODE = "AAAAAAAAAA";
    private static final String UPDATED_ROLE_CODE = "BBBBBBBBBB";

    private static final String DEFAULT_DESCRIPTION = "AAAAAAAAAA";
    private static final String UPDATED_DESCRIPTION = "BBBBBBBBBB";

    private static final String DEFAULT_CREATE_BY = "AAAAAAAAAA";
    private static final String UPDATED_CREATE_BY = "BBBBBBBBBB";

    private static final Instant DEFAULT_CREATE_TIME = Instant.ofEpochMilli(0L);
    private static final Instant UPDATED_CREATE_TIME = Instant.now().truncatedTo(ChronoUnit.MILLIS);

    private static final String DEFAULT_UPDATE_BY = "AAAAAAAAAA";
    private static final String UPDATED_UPDATE_BY = "BBBBBBBBBB";

    private static final Instant DEFAULT_UPDATE_TIME = Instant.ofEpochMilli(0L);
    private static final Instant UPDATED_UPDATE_TIME = Instant.now().truncatedTo(ChronoUnit.MILLIS);

    private static final String ENTITY_API_URL = "/api/sys-roles";
    private static final String ENTITY_API_URL_ID = ENTITY_API_URL + "/{id}";

    @Autowired
    private SysRoleRepository sysRoleRepository;

    @Autowired
    private EntityManager em;

    @Autowired
    private MockMvc restSysRoleMockMvc;

    private SysRole sysRole;

    /**
     * Create an entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static SysRole createEntity(EntityManager em) {
        SysRole sysRole = new SysRole()
            .roleName(DEFAULT_ROLE_NAME)
            .roleCode(DEFAULT_ROLE_CODE)
            .description(DEFAULT_DESCRIPTION)
            .createBy(DEFAULT_CREATE_BY)
            .createTime(DEFAULT_CREATE_TIME)
            .updateBy(DEFAULT_UPDATE_BY)
            .updateTime(DEFAULT_UPDATE_TIME);
        return sysRole;
    }

    /**
     * Create an updated entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static SysRole createUpdatedEntity(EntityManager em) {
        SysRole sysRole = new SysRole()
            .roleName(UPDATED_ROLE_NAME)
            .roleCode(UPDATED_ROLE_CODE)
            .description(UPDATED_DESCRIPTION)
            .createBy(UPDATED_CREATE_BY)
            .createTime(UPDATED_CREATE_TIME)
            .updateBy(UPDATED_UPDATE_BY)
            .updateTime(UPDATED_UPDATE_TIME);
        return sysRole;
    }

    @BeforeEach
    public void initTest() {
        sysRole = createEntity(em);
    }

    @Test
    @Transactional
    void createSysRole() throws Exception {
        int databaseSizeBeforeCreate = sysRoleRepository.findAll().size();
        // Create the SysRole
        restSysRoleMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(TestUtil.convertObjectToJsonBytes(sysRole)))
            .andExpect(status().isCreated());

        // Validate the SysRole in the database
        List<SysRole> sysRoleList = sysRoleRepository.findAll();
        assertThat(sysRoleList).hasSize(databaseSizeBeforeCreate + 1);
        SysRole testSysRole = sysRoleList.get(sysRoleList.size() - 1);
        assertThat(testSysRole.getRoleName()).isEqualTo(DEFAULT_ROLE_NAME);
        assertThat(testSysRole.getRoleCode()).isEqualTo(DEFAULT_ROLE_CODE);
        assertThat(testSysRole.getDescription()).isEqualTo(DEFAULT_DESCRIPTION);
        assertThat(testSysRole.getCreateBy()).isEqualTo(DEFAULT_CREATE_BY);
        assertThat(testSysRole.getCreateTime()).isEqualTo(DEFAULT_CREATE_TIME);
        assertThat(testSysRole.getUpdateBy()).isEqualTo(DEFAULT_UPDATE_BY);
        assertThat(testSysRole.getUpdateTime()).isEqualTo(DEFAULT_UPDATE_TIME);
    }

    @Test
    @Transactional
    void createSysRoleWithExistingId() throws Exception {
        // Create the SysRole with an existing ID
        sysRoleRepository.saveAndFlush(sysRole);

        int databaseSizeBeforeCreate = sysRoleRepository.findAll().size();

        // An entity with an existing ID cannot be created, so this API call must fail
        restSysRoleMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(TestUtil.convertObjectToJsonBytes(sysRole)))
            .andExpect(status().isBadRequest());

        // Validate the SysRole in the database
        List<SysRole> sysRoleList = sysRoleRepository.findAll();
        assertThat(sysRoleList).hasSize(databaseSizeBeforeCreate);
    }

    @Test
    @Transactional
    void getAllSysRoles() throws Exception {
        // Initialize the database
        sysRoleRepository.saveAndFlush(sysRole);

        // Get all the sysRoleList
        restSysRoleMockMvc
            .perform(get(ENTITY_API_URL + "?sort=id,desc"))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].id").value(hasItem(sysRole.getId().toString())))
            .andExpect(jsonPath("$.[*].roleName").value(hasItem(DEFAULT_ROLE_NAME)))
            .andExpect(jsonPath("$.[*].roleCode").value(hasItem(DEFAULT_ROLE_CODE)))
            .andExpect(jsonPath("$.[*].description").value(hasItem(DEFAULT_DESCRIPTION)))
            .andExpect(jsonPath("$.[*].createBy").value(hasItem(DEFAULT_CREATE_BY)))
            .andExpect(jsonPath("$.[*].createTime").value(hasItem(DEFAULT_CREATE_TIME.toString())))
            .andExpect(jsonPath("$.[*].updateBy").value(hasItem(DEFAULT_UPDATE_BY)))
            .andExpect(jsonPath("$.[*].updateTime").value(hasItem(DEFAULT_UPDATE_TIME.toString())));
    }

    @Test
    @Transactional
    void getSysRole() throws Exception {
        // Initialize the database
        sysRoleRepository.saveAndFlush(sysRole);

        // Get the sysRole
        restSysRoleMockMvc
            .perform(get(ENTITY_API_URL_ID, sysRole.getId()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.id").value(sysRole.getId().toString()))
            .andExpect(jsonPath("$.roleName").value(DEFAULT_ROLE_NAME))
            .andExpect(jsonPath("$.roleCode").value(DEFAULT_ROLE_CODE))
            .andExpect(jsonPath("$.description").value(DEFAULT_DESCRIPTION))
            .andExpect(jsonPath("$.createBy").value(DEFAULT_CREATE_BY))
            .andExpect(jsonPath("$.createTime").value(DEFAULT_CREATE_TIME.toString()))
            .andExpect(jsonPath("$.updateBy").value(DEFAULT_UPDATE_BY))
            .andExpect(jsonPath("$.updateTime").value(DEFAULT_UPDATE_TIME.toString()));
    }

    @Test
    @Transactional
    void getNonExistingSysRole() throws Exception {
        // Get the sysRole
        restSysRoleMockMvc.perform(get(ENTITY_API_URL_ID, UUID.randomUUID().toString())).andExpect(status().isNotFound());
    }

    @Test
    @Transactional
    void putExistingSysRole() throws Exception {
        // Initialize the database
        sysRoleRepository.saveAndFlush(sysRole);

        int databaseSizeBeforeUpdate = sysRoleRepository.findAll().size();

        // Update the sysRole
        SysRole updatedSysRole = sysRoleRepository.findById(sysRole.getId()).get();
        // Disconnect from session so that the updates on updatedSysRole are not directly saved in db
        em.detach(updatedSysRole);
        updatedSysRole
            .roleName(UPDATED_ROLE_NAME)
            .roleCode(UPDATED_ROLE_CODE)
            .description(UPDATED_DESCRIPTION)
            .createBy(UPDATED_CREATE_BY)
            .createTime(UPDATED_CREATE_TIME)
            .updateBy(UPDATED_UPDATE_BY)
            .updateTime(UPDATED_UPDATE_TIME);

        restSysRoleMockMvc
            .perform(
                put(ENTITY_API_URL_ID, updatedSysRole.getId())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(TestUtil.convertObjectToJsonBytes(updatedSysRole))
            )
            .andExpect(status().isOk());

        // Validate the SysRole in the database
        List<SysRole> sysRoleList = sysRoleRepository.findAll();
        assertThat(sysRoleList).hasSize(databaseSizeBeforeUpdate);
        SysRole testSysRole = sysRoleList.get(sysRoleList.size() - 1);
        assertThat(testSysRole.getRoleName()).isEqualTo(UPDATED_ROLE_NAME);
        assertThat(testSysRole.getRoleCode()).isEqualTo(UPDATED_ROLE_CODE);
        assertThat(testSysRole.getDescription()).isEqualTo(UPDATED_DESCRIPTION);
        assertThat(testSysRole.getCreateBy()).isEqualTo(UPDATED_CREATE_BY);
        assertThat(testSysRole.getCreateTime()).isEqualTo(UPDATED_CREATE_TIME);
        assertThat(testSysRole.getUpdateBy()).isEqualTo(UPDATED_UPDATE_BY);
        assertThat(testSysRole.getUpdateTime()).isEqualTo(UPDATED_UPDATE_TIME);
    }

    @Test
    @Transactional
    void putNonExistingSysRole() throws Exception {
        int databaseSizeBeforeUpdate = sysRoleRepository.findAll().size();
        sysRole.setId(UUID.randomUUID());

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        restSysRoleMockMvc
            .perform(
                put(ENTITY_API_URL_ID, sysRole.getId())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(TestUtil.convertObjectToJsonBytes(sysRole))
            )
            .andExpect(status().isBadRequest());

        // Validate the SysRole in the database
        List<SysRole> sysRoleList = sysRoleRepository.findAll();
        assertThat(sysRoleList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void putWithIdMismatchSysRole() throws Exception {
        int databaseSizeBeforeUpdate = sysRoleRepository.findAll().size();
        sysRole.setId(UUID.randomUUID());

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restSysRoleMockMvc
            .perform(
                put(ENTITY_API_URL_ID, UUID.randomUUID())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(TestUtil.convertObjectToJsonBytes(sysRole))
            )
            .andExpect(status().isBadRequest());

        // Validate the SysRole in the database
        List<SysRole> sysRoleList = sysRoleRepository.findAll();
        assertThat(sysRoleList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void putWithMissingIdPathParamSysRole() throws Exception {
        int databaseSizeBeforeUpdate = sysRoleRepository.findAll().size();
        sysRole.setId(UUID.randomUUID());

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restSysRoleMockMvc
            .perform(put(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(TestUtil.convertObjectToJsonBytes(sysRole)))
            .andExpect(status().isMethodNotAllowed());

        // Validate the SysRole in the database
        List<SysRole> sysRoleList = sysRoleRepository.findAll();
        assertThat(sysRoleList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void partialUpdateSysRoleWithPatch() throws Exception {
        // Initialize the database
        sysRoleRepository.saveAndFlush(sysRole);

        int databaseSizeBeforeUpdate = sysRoleRepository.findAll().size();

        // Update the sysRole using partial update
        SysRole partialUpdatedSysRole = new SysRole();
        partialUpdatedSysRole.setId(sysRole.getId());

        partialUpdatedSysRole.roleName(UPDATED_ROLE_NAME).roleCode(UPDATED_ROLE_CODE).updateTime(UPDATED_UPDATE_TIME);

        restSysRoleMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, partialUpdatedSysRole.getId())
                    .contentType("application/merge-patch+json")
                    .content(TestUtil.convertObjectToJsonBytes(partialUpdatedSysRole))
            )
            .andExpect(status().isOk());

        // Validate the SysRole in the database
        List<SysRole> sysRoleList = sysRoleRepository.findAll();
        assertThat(sysRoleList).hasSize(databaseSizeBeforeUpdate);
        SysRole testSysRole = sysRoleList.get(sysRoleList.size() - 1);
        assertThat(testSysRole.getRoleName()).isEqualTo(UPDATED_ROLE_NAME);
        assertThat(testSysRole.getRoleCode()).isEqualTo(UPDATED_ROLE_CODE);
        assertThat(testSysRole.getDescription()).isEqualTo(DEFAULT_DESCRIPTION);
        assertThat(testSysRole.getCreateBy()).isEqualTo(DEFAULT_CREATE_BY);
        assertThat(testSysRole.getCreateTime()).isEqualTo(DEFAULT_CREATE_TIME);
        assertThat(testSysRole.getUpdateBy()).isEqualTo(DEFAULT_UPDATE_BY);
        assertThat(testSysRole.getUpdateTime()).isEqualTo(UPDATED_UPDATE_TIME);
    }

    @Test
    @Transactional
    void fullUpdateSysRoleWithPatch() throws Exception {
        // Initialize the database
        sysRoleRepository.saveAndFlush(sysRole);

        int databaseSizeBeforeUpdate = sysRoleRepository.findAll().size();

        // Update the sysRole using partial update
        SysRole partialUpdatedSysRole = new SysRole();
        partialUpdatedSysRole.setId(sysRole.getId());

        partialUpdatedSysRole
            .roleName(UPDATED_ROLE_NAME)
            .roleCode(UPDATED_ROLE_CODE)
            .description(UPDATED_DESCRIPTION)
            .createBy(UPDATED_CREATE_BY)
            .createTime(UPDATED_CREATE_TIME)
            .updateBy(UPDATED_UPDATE_BY)
            .updateTime(UPDATED_UPDATE_TIME);

        restSysRoleMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, partialUpdatedSysRole.getId())
                    .contentType("application/merge-patch+json")
                    .content(TestUtil.convertObjectToJsonBytes(partialUpdatedSysRole))
            )
            .andExpect(status().isOk());

        // Validate the SysRole in the database
        List<SysRole> sysRoleList = sysRoleRepository.findAll();
        assertThat(sysRoleList).hasSize(databaseSizeBeforeUpdate);
        SysRole testSysRole = sysRoleList.get(sysRoleList.size() - 1);
        assertThat(testSysRole.getRoleName()).isEqualTo(UPDATED_ROLE_NAME);
        assertThat(testSysRole.getRoleCode()).isEqualTo(UPDATED_ROLE_CODE);
        assertThat(testSysRole.getDescription()).isEqualTo(UPDATED_DESCRIPTION);
        assertThat(testSysRole.getCreateBy()).isEqualTo(UPDATED_CREATE_BY);
        assertThat(testSysRole.getCreateTime()).isEqualTo(UPDATED_CREATE_TIME);
        assertThat(testSysRole.getUpdateBy()).isEqualTo(UPDATED_UPDATE_BY);
        assertThat(testSysRole.getUpdateTime()).isEqualTo(UPDATED_UPDATE_TIME);
    }

    @Test
    @Transactional
    void patchNonExistingSysRole() throws Exception {
        int databaseSizeBeforeUpdate = sysRoleRepository.findAll().size();
        sysRole.setId(UUID.randomUUID());

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        restSysRoleMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, sysRole.getId())
                    .contentType("application/merge-patch+json")
                    .content(TestUtil.convertObjectToJsonBytes(sysRole))
            )
            .andExpect(status().isBadRequest());

        // Validate the SysRole in the database
        List<SysRole> sysRoleList = sysRoleRepository.findAll();
        assertThat(sysRoleList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void patchWithIdMismatchSysRole() throws Exception {
        int databaseSizeBeforeUpdate = sysRoleRepository.findAll().size();
        sysRole.setId(UUID.randomUUID());

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restSysRoleMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, UUID.randomUUID())
                    .contentType("application/merge-patch+json")
                    .content(TestUtil.convertObjectToJsonBytes(sysRole))
            )
            .andExpect(status().isBadRequest());

        // Validate the SysRole in the database
        List<SysRole> sysRoleList = sysRoleRepository.findAll();
        assertThat(sysRoleList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void patchWithMissingIdPathParamSysRole() throws Exception {
        int databaseSizeBeforeUpdate = sysRoleRepository.findAll().size();
        sysRole.setId(UUID.randomUUID());

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restSysRoleMockMvc
            .perform(patch(ENTITY_API_URL).contentType("application/merge-patch+json").content(TestUtil.convertObjectToJsonBytes(sysRole)))
            .andExpect(status().isMethodNotAllowed());

        // Validate the SysRole in the database
        List<SysRole> sysRoleList = sysRoleRepository.findAll();
        assertThat(sysRoleList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void deleteSysRole() throws Exception {
        // Initialize the database
        sysRoleRepository.saveAndFlush(sysRole);

        int databaseSizeBeforeDelete = sysRoleRepository.findAll().size();

        // Delete the sysRole
        restSysRoleMockMvc
            .perform(delete(ENTITY_API_URL_ID, sysRole.getId().toString()).accept(MediaType.APPLICATION_JSON))
            .andExpect(status().isNoContent());

        // Validate the database contains one less item
        List<SysRole> sysRoleList = sysRoleRepository.findAll();
        assertThat(sysRoleList).hasSize(databaseSizeBeforeDelete - 1);
    }
}
