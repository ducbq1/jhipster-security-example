package com.untralvious.demo.security.web.rest;

import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.hasItem;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import com.untralvious.demo.security.IntegrationTest;
import com.untralvious.demo.security.domain.SysUser;
import com.untralvious.demo.security.repository.SysUserRepository;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.persistence.EntityManager;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

/**
 * Integration tests for the {@link SysUserResource} REST controller.
 */
@IntegrationTest
@ExtendWith(MockitoExtension.class)
@AutoConfigureMockMvc
@WithMockUser
class SysUserResourceIT {

    private static final String DEFAULT_USERNAME = "AAAAAAAAAA";
    private static final String UPDATED_USERNAME = "BBBBBBBBBB";

    private static final String DEFAULT_REAL_NAME = "AAAAAAAAAA";
    private static final String UPDATED_REAL_NAME = "BBBBBBBBBB";

    private static final String DEFAULT_PASSWORD = "AAAAAAAAAA";
    private static final String UPDATED_PASSWORD = "BBBBBBBBBB";

    private static final String DEFAULT_SALT = "AAAAAAAAAA";
    private static final String UPDATED_SALT = "BBBBBBBBBB";

    private static final String DEFAULT_AVATAR = "AAAAAAAAAA";
    private static final String UPDATED_AVATAR = "BBBBBBBBBB";

    private static final Instant DEFAULT_BIRTHDAY = Instant.ofEpochMilli(0L);
    private static final Instant UPDATED_BIRTHDAY = Instant.now().truncatedTo(ChronoUnit.MILLIS);

    private static final Boolean DEFAULT_SEX = false;
    private static final Boolean UPDATED_SEX = true;

    private static final String DEFAULT_EMAIL = "AAAAAAAAAA";
    private static final String UPDATED_EMAIL = "BBBBBBBBBB";

    private static final String DEFAULT_PHONE = "AAAAAAAAAA";
    private static final String UPDATED_PHONE = "BBBBBBBBBB";

    private static final String DEFAULT_ORG_CODE = "AAAAAAAAAA";
    private static final String UPDATED_ORG_CODE = "BBBBBBBBBB";

    private static final Integer DEFAULT_STATUS = 1;
    private static final Integer UPDATED_STATUS = 2;

    private static final Integer DEFAULT_DEL_FLAG = 1;
    private static final Integer UPDATED_DEL_FLAG = 2;

    private static final String DEFAULT_THIRD_ID = "AAAAAAAAAA";
    private static final String UPDATED_THIRD_ID = "BBBBBBBBBB";

    private static final String DEFAULT_THIRD_TYPE = "AAAAAAAAAA";
    private static final String UPDATED_THIRD_TYPE = "BBBBBBBBBB";

    private static final Integer DEFAULT_ACTIVITY_SYNC = 1;
    private static final Integer UPDATED_ACTIVITY_SYNC = 2;

    private static final String DEFAULT_WORK_NO = "AAAAAAAAAA";
    private static final String UPDATED_WORK_NO = "BBBBBBBBBB";

    private static final String DEFAULT_POST = "AAAAAAAAAA";
    private static final String UPDATED_POST = "BBBBBBBBBB";

    private static final String DEFAULT_TELEPHONE = "AAAAAAAAAA";
    private static final String UPDATED_TELEPHONE = "BBBBBBBBBB";

    private static final String DEFAULT_CREATE_BY = "AAAAAAAAAA";
    private static final String UPDATED_CREATE_BY = "BBBBBBBBBB";

    private static final Instant DEFAULT_CREATE_TIME = Instant.ofEpochMilli(0L);
    private static final Instant UPDATED_CREATE_TIME = Instant.now().truncatedTo(ChronoUnit.MILLIS);

    private static final String DEFAULT_UPDATE_BY = "AAAAAAAAAA";
    private static final String UPDATED_UPDATE_BY = "BBBBBBBBBB";

    private static final Instant DEFAULT_UPDATE_TIME = Instant.ofEpochMilli(0L);
    private static final Instant UPDATED_UPDATE_TIME = Instant.now().truncatedTo(ChronoUnit.MILLIS);

    private static final Integer DEFAULT_USER_IDENTITY = 1;
    private static final Integer UPDATED_USER_IDENTITY = 2;

    private static final String DEFAULT_DEPART_IDS = "AAAAAAAAAA";
    private static final String UPDATED_DEPART_IDS = "BBBBBBBBBB";

    private static final String DEFAULT_REL_TENANT_IDS = "AAAAAAAAAA";
    private static final String UPDATED_REL_TENANT_IDS = "BBBBBBBBBB";

    private static final String DEFAULT_CLIENT_ID = "AAAAAAAAAA";
    private static final String UPDATED_CLIENT_ID = "BBBBBBBBBB";

    private static final String ENTITY_API_URL = "/api/sys-users";
    private static final String ENTITY_API_URL_ID = ENTITY_API_URL + "/{id}";

    @Autowired
    private SysUserRepository sysUserRepository;

    @Mock
    private SysUserRepository sysUserRepositoryMock;

    @Autowired
    private EntityManager em;

    @Autowired
    private MockMvc restSysUserMockMvc;

    private SysUser sysUser;

    /**
     * Create an entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static SysUser createEntity(EntityManager em) {
        SysUser sysUser = new SysUser()
            .username(DEFAULT_USERNAME)
            .realName(DEFAULT_REAL_NAME)
            .password(DEFAULT_PASSWORD)
            .salt(DEFAULT_SALT)
            .avatar(DEFAULT_AVATAR)
            .birthday(DEFAULT_BIRTHDAY)
            .sex(DEFAULT_SEX)
            .email(DEFAULT_EMAIL)
            .phone(DEFAULT_PHONE)
            .orgCode(DEFAULT_ORG_CODE)
            .status(DEFAULT_STATUS)
            .delFlag(DEFAULT_DEL_FLAG)
            .thirdId(DEFAULT_THIRD_ID)
            .thirdType(DEFAULT_THIRD_TYPE)
            .activitySync(DEFAULT_ACTIVITY_SYNC)
            .workNo(DEFAULT_WORK_NO)
            .post(DEFAULT_POST)
            .telephone(DEFAULT_TELEPHONE)
            .createBy(DEFAULT_CREATE_BY)
            .createTime(DEFAULT_CREATE_TIME)
            .updateBy(DEFAULT_UPDATE_BY)
            .updateTime(DEFAULT_UPDATE_TIME)
            .userIdentity(DEFAULT_USER_IDENTITY)
            .departIds(DEFAULT_DEPART_IDS)
            .relTenantIds(DEFAULT_REL_TENANT_IDS)
            .clientId(DEFAULT_CLIENT_ID);
        return sysUser;
    }

    /**
     * Create an updated entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static SysUser createUpdatedEntity(EntityManager em) {
        SysUser sysUser = new SysUser()
            .username(UPDATED_USERNAME)
            .realName(UPDATED_REAL_NAME)
            .password(UPDATED_PASSWORD)
            .salt(UPDATED_SALT)
            .avatar(UPDATED_AVATAR)
            .birthday(UPDATED_BIRTHDAY)
            .sex(UPDATED_SEX)
            .email(UPDATED_EMAIL)
            .phone(UPDATED_PHONE)
            .orgCode(UPDATED_ORG_CODE)
            .status(UPDATED_STATUS)
            .delFlag(UPDATED_DEL_FLAG)
            .thirdId(UPDATED_THIRD_ID)
            .thirdType(UPDATED_THIRD_TYPE)
            .activitySync(UPDATED_ACTIVITY_SYNC)
            .workNo(UPDATED_WORK_NO)
            .post(UPDATED_POST)
            .telephone(UPDATED_TELEPHONE)
            .createBy(UPDATED_CREATE_BY)
            .createTime(UPDATED_CREATE_TIME)
            .updateBy(UPDATED_UPDATE_BY)
            .updateTime(UPDATED_UPDATE_TIME)
            .userIdentity(UPDATED_USER_IDENTITY)
            .departIds(UPDATED_DEPART_IDS)
            .relTenantIds(UPDATED_REL_TENANT_IDS)
            .clientId(UPDATED_CLIENT_ID);
        return sysUser;
    }

    @BeforeEach
    public void initTest() {
        sysUser = createEntity(em);
    }

    @Test
    @Transactional
    void createSysUser() throws Exception {
        int databaseSizeBeforeCreate = sysUserRepository.findAll().size();
        // Create the SysUser
        restSysUserMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(TestUtil.convertObjectToJsonBytes(sysUser)))
            .andExpect(status().isCreated());

        // Validate the SysUser in the database
        List<SysUser> sysUserList = sysUserRepository.findAll();
        assertThat(sysUserList).hasSize(databaseSizeBeforeCreate + 1);
        SysUser testSysUser = sysUserList.get(sysUserList.size() - 1);
        assertThat(testSysUser.getUsername()).isEqualTo(DEFAULT_USERNAME);
        assertThat(testSysUser.getRealName()).isEqualTo(DEFAULT_REAL_NAME);
        assertThat(testSysUser.getPassword()).isEqualTo(DEFAULT_PASSWORD);
        assertThat(testSysUser.getSalt()).isEqualTo(DEFAULT_SALT);
        assertThat(testSysUser.getAvatar()).isEqualTo(DEFAULT_AVATAR);
        assertThat(testSysUser.getBirthday()).isEqualTo(DEFAULT_BIRTHDAY);
        assertThat(testSysUser.getSex()).isEqualTo(DEFAULT_SEX);
        assertThat(testSysUser.getEmail()).isEqualTo(DEFAULT_EMAIL);
        assertThat(testSysUser.getPhone()).isEqualTo(DEFAULT_PHONE);
        assertThat(testSysUser.getOrgCode()).isEqualTo(DEFAULT_ORG_CODE);
        assertThat(testSysUser.getStatus()).isEqualTo(DEFAULT_STATUS);
        assertThat(testSysUser.getDelFlag()).isEqualTo(DEFAULT_DEL_FLAG);
        assertThat(testSysUser.getThirdId()).isEqualTo(DEFAULT_THIRD_ID);
        assertThat(testSysUser.getThirdType()).isEqualTo(DEFAULT_THIRD_TYPE);
        assertThat(testSysUser.getActivitySync()).isEqualTo(DEFAULT_ACTIVITY_SYNC);
        assertThat(testSysUser.getWorkNo()).isEqualTo(DEFAULT_WORK_NO);
        assertThat(testSysUser.getPost()).isEqualTo(DEFAULT_POST);
        assertThat(testSysUser.getTelephone()).isEqualTo(DEFAULT_TELEPHONE);
        assertThat(testSysUser.getCreateBy()).isEqualTo(DEFAULT_CREATE_BY);
        assertThat(testSysUser.getCreateTime()).isEqualTo(DEFAULT_CREATE_TIME);
        assertThat(testSysUser.getUpdateBy()).isEqualTo(DEFAULT_UPDATE_BY);
        assertThat(testSysUser.getUpdateTime()).isEqualTo(DEFAULT_UPDATE_TIME);
        assertThat(testSysUser.getUserIdentity()).isEqualTo(DEFAULT_USER_IDENTITY);
        assertThat(testSysUser.getDepartIds()).isEqualTo(DEFAULT_DEPART_IDS);
        assertThat(testSysUser.getRelTenantIds()).isEqualTo(DEFAULT_REL_TENANT_IDS);
        assertThat(testSysUser.getClientId()).isEqualTo(DEFAULT_CLIENT_ID);
    }

    @Test
    @Transactional
    void createSysUserWithExistingId() throws Exception {
        // Create the SysUser with an existing ID
        sysUserRepository.saveAndFlush(sysUser);

        int databaseSizeBeforeCreate = sysUserRepository.findAll().size();

        // An entity with an existing ID cannot be created, so this API call must fail
        restSysUserMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(TestUtil.convertObjectToJsonBytes(sysUser)))
            .andExpect(status().isBadRequest());

        // Validate the SysUser in the database
        List<SysUser> sysUserList = sysUserRepository.findAll();
        assertThat(sysUserList).hasSize(databaseSizeBeforeCreate);
    }

    @Test
    @Transactional
    void getAllSysUsers() throws Exception {
        // Initialize the database
        sysUserRepository.saveAndFlush(sysUser);

        // Get all the sysUserList
        restSysUserMockMvc
            .perform(get(ENTITY_API_URL + "?sort=id,desc"))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].id").value(hasItem(sysUser.getId().toString())))
            .andExpect(jsonPath("$.[*].username").value(hasItem(DEFAULT_USERNAME)))
            .andExpect(jsonPath("$.[*].realName").value(hasItem(DEFAULT_REAL_NAME)))
            .andExpect(jsonPath("$.[*].password").value(hasItem(DEFAULT_PASSWORD)))
            .andExpect(jsonPath("$.[*].salt").value(hasItem(DEFAULT_SALT)))
            .andExpect(jsonPath("$.[*].avatar").value(hasItem(DEFAULT_AVATAR)))
            .andExpect(jsonPath("$.[*].birthday").value(hasItem(DEFAULT_BIRTHDAY.toString())))
            .andExpect(jsonPath("$.[*].sex").value(hasItem(DEFAULT_SEX.booleanValue())))
            .andExpect(jsonPath("$.[*].email").value(hasItem(DEFAULT_EMAIL)))
            .andExpect(jsonPath("$.[*].phone").value(hasItem(DEFAULT_PHONE)))
            .andExpect(jsonPath("$.[*].orgCode").value(hasItem(DEFAULT_ORG_CODE)))
            .andExpect(jsonPath("$.[*].status").value(hasItem(DEFAULT_STATUS)))
            .andExpect(jsonPath("$.[*].delFlag").value(hasItem(DEFAULT_DEL_FLAG)))
            .andExpect(jsonPath("$.[*].thirdId").value(hasItem(DEFAULT_THIRD_ID)))
            .andExpect(jsonPath("$.[*].thirdType").value(hasItem(DEFAULT_THIRD_TYPE)))
            .andExpect(jsonPath("$.[*].activitySync").value(hasItem(DEFAULT_ACTIVITY_SYNC)))
            .andExpect(jsonPath("$.[*].workNo").value(hasItem(DEFAULT_WORK_NO)))
            .andExpect(jsonPath("$.[*].post").value(hasItem(DEFAULT_POST)))
            .andExpect(jsonPath("$.[*].telephone").value(hasItem(DEFAULT_TELEPHONE)))
            .andExpect(jsonPath("$.[*].createBy").value(hasItem(DEFAULT_CREATE_BY)))
            .andExpect(jsonPath("$.[*].createTime").value(hasItem(DEFAULT_CREATE_TIME.toString())))
            .andExpect(jsonPath("$.[*].updateBy").value(hasItem(DEFAULT_UPDATE_BY)))
            .andExpect(jsonPath("$.[*].updateTime").value(hasItem(DEFAULT_UPDATE_TIME.toString())))
            .andExpect(jsonPath("$.[*].userIdentity").value(hasItem(DEFAULT_USER_IDENTITY)))
            .andExpect(jsonPath("$.[*].departIds").value(hasItem(DEFAULT_DEPART_IDS)))
            .andExpect(jsonPath("$.[*].relTenantIds").value(hasItem(DEFAULT_REL_TENANT_IDS)))
            .andExpect(jsonPath("$.[*].clientId").value(hasItem(DEFAULT_CLIENT_ID)));
    }

    @SuppressWarnings({ "unchecked" })
    void getAllSysUsersWithEagerRelationshipsIsEnabled() throws Exception {
        when(sysUserRepositoryMock.findAllWithEagerRelationships(any())).thenReturn(new PageImpl(new ArrayList<>()));

        restSysUserMockMvc.perform(get(ENTITY_API_URL + "?eagerload=true")).andExpect(status().isOk());

        verify(sysUserRepositoryMock, times(1)).findAllWithEagerRelationships(any());
    }

    @SuppressWarnings({ "unchecked" })
    void getAllSysUsersWithEagerRelationshipsIsNotEnabled() throws Exception {
        when(sysUserRepositoryMock.findAllWithEagerRelationships(any())).thenReturn(new PageImpl(new ArrayList<>()));

        restSysUserMockMvc.perform(get(ENTITY_API_URL + "?eagerload=false")).andExpect(status().isOk());
        verify(sysUserRepositoryMock, times(1)).findAll(any(Pageable.class));
    }

    @Test
    @Transactional
    void getSysUser() throws Exception {
        // Initialize the database
        sysUserRepository.saveAndFlush(sysUser);

        // Get the sysUser
        restSysUserMockMvc
            .perform(get(ENTITY_API_URL_ID, sysUser.getId()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.id").value(sysUser.getId().toString()))
            .andExpect(jsonPath("$.username").value(DEFAULT_USERNAME))
            .andExpect(jsonPath("$.realName").value(DEFAULT_REAL_NAME))
            .andExpect(jsonPath("$.password").value(DEFAULT_PASSWORD))
            .andExpect(jsonPath("$.salt").value(DEFAULT_SALT))
            .andExpect(jsonPath("$.avatar").value(DEFAULT_AVATAR))
            .andExpect(jsonPath("$.birthday").value(DEFAULT_BIRTHDAY.toString()))
            .andExpect(jsonPath("$.sex").value(DEFAULT_SEX.booleanValue()))
            .andExpect(jsonPath("$.email").value(DEFAULT_EMAIL))
            .andExpect(jsonPath("$.phone").value(DEFAULT_PHONE))
            .andExpect(jsonPath("$.orgCode").value(DEFAULT_ORG_CODE))
            .andExpect(jsonPath("$.status").value(DEFAULT_STATUS))
            .andExpect(jsonPath("$.delFlag").value(DEFAULT_DEL_FLAG))
            .andExpect(jsonPath("$.thirdId").value(DEFAULT_THIRD_ID))
            .andExpect(jsonPath("$.thirdType").value(DEFAULT_THIRD_TYPE))
            .andExpect(jsonPath("$.activitySync").value(DEFAULT_ACTIVITY_SYNC))
            .andExpect(jsonPath("$.workNo").value(DEFAULT_WORK_NO))
            .andExpect(jsonPath("$.post").value(DEFAULT_POST))
            .andExpect(jsonPath("$.telephone").value(DEFAULT_TELEPHONE))
            .andExpect(jsonPath("$.createBy").value(DEFAULT_CREATE_BY))
            .andExpect(jsonPath("$.createTime").value(DEFAULT_CREATE_TIME.toString()))
            .andExpect(jsonPath("$.updateBy").value(DEFAULT_UPDATE_BY))
            .andExpect(jsonPath("$.updateTime").value(DEFAULT_UPDATE_TIME.toString()))
            .andExpect(jsonPath("$.userIdentity").value(DEFAULT_USER_IDENTITY))
            .andExpect(jsonPath("$.departIds").value(DEFAULT_DEPART_IDS))
            .andExpect(jsonPath("$.relTenantIds").value(DEFAULT_REL_TENANT_IDS))
            .andExpect(jsonPath("$.clientId").value(DEFAULT_CLIENT_ID));
    }

    @Test
    @Transactional
    void getNonExistingSysUser() throws Exception {
        // Get the sysUser
        restSysUserMockMvc.perform(get(ENTITY_API_URL_ID, UUID.randomUUID().toString())).andExpect(status().isNotFound());
    }

    @Test
    @Transactional
    void putExistingSysUser() throws Exception {
        // Initialize the database
        sysUserRepository.saveAndFlush(sysUser);

        int databaseSizeBeforeUpdate = sysUserRepository.findAll().size();

        // Update the sysUser
        SysUser updatedSysUser = sysUserRepository.findById(sysUser.getId()).get();
        // Disconnect from session so that the updates on updatedSysUser are not directly saved in db
        em.detach(updatedSysUser);
        updatedSysUser
            .username(UPDATED_USERNAME)
            .realName(UPDATED_REAL_NAME)
            .password(UPDATED_PASSWORD)
            .salt(UPDATED_SALT)
            .avatar(UPDATED_AVATAR)
            .birthday(UPDATED_BIRTHDAY)
            .sex(UPDATED_SEX)
            .email(UPDATED_EMAIL)
            .phone(UPDATED_PHONE)
            .orgCode(UPDATED_ORG_CODE)
            .status(UPDATED_STATUS)
            .delFlag(UPDATED_DEL_FLAG)
            .thirdId(UPDATED_THIRD_ID)
            .thirdType(UPDATED_THIRD_TYPE)
            .activitySync(UPDATED_ACTIVITY_SYNC)
            .workNo(UPDATED_WORK_NO)
            .post(UPDATED_POST)
            .telephone(UPDATED_TELEPHONE)
            .createBy(UPDATED_CREATE_BY)
            .createTime(UPDATED_CREATE_TIME)
            .updateBy(UPDATED_UPDATE_BY)
            .updateTime(UPDATED_UPDATE_TIME)
            .userIdentity(UPDATED_USER_IDENTITY)
            .departIds(UPDATED_DEPART_IDS)
            .relTenantIds(UPDATED_REL_TENANT_IDS)
            .clientId(UPDATED_CLIENT_ID);

        restSysUserMockMvc
            .perform(
                put(ENTITY_API_URL_ID, updatedSysUser.getId())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(TestUtil.convertObjectToJsonBytes(updatedSysUser))
            )
            .andExpect(status().isOk());

        // Validate the SysUser in the database
        List<SysUser> sysUserList = sysUserRepository.findAll();
        assertThat(sysUserList).hasSize(databaseSizeBeforeUpdate);
        SysUser testSysUser = sysUserList.get(sysUserList.size() - 1);
        assertThat(testSysUser.getUsername()).isEqualTo(UPDATED_USERNAME);
        assertThat(testSysUser.getRealName()).isEqualTo(UPDATED_REAL_NAME);
        assertThat(testSysUser.getPassword()).isEqualTo(UPDATED_PASSWORD);
        assertThat(testSysUser.getSalt()).isEqualTo(UPDATED_SALT);
        assertThat(testSysUser.getAvatar()).isEqualTo(UPDATED_AVATAR);
        assertThat(testSysUser.getBirthday()).isEqualTo(UPDATED_BIRTHDAY);
        assertThat(testSysUser.getSex()).isEqualTo(UPDATED_SEX);
        assertThat(testSysUser.getEmail()).isEqualTo(UPDATED_EMAIL);
        assertThat(testSysUser.getPhone()).isEqualTo(UPDATED_PHONE);
        assertThat(testSysUser.getOrgCode()).isEqualTo(UPDATED_ORG_CODE);
        assertThat(testSysUser.getStatus()).isEqualTo(UPDATED_STATUS);
        assertThat(testSysUser.getDelFlag()).isEqualTo(UPDATED_DEL_FLAG);
        assertThat(testSysUser.getThirdId()).isEqualTo(UPDATED_THIRD_ID);
        assertThat(testSysUser.getThirdType()).isEqualTo(UPDATED_THIRD_TYPE);
        assertThat(testSysUser.getActivitySync()).isEqualTo(UPDATED_ACTIVITY_SYNC);
        assertThat(testSysUser.getWorkNo()).isEqualTo(UPDATED_WORK_NO);
        assertThat(testSysUser.getPost()).isEqualTo(UPDATED_POST);
        assertThat(testSysUser.getTelephone()).isEqualTo(UPDATED_TELEPHONE);
        assertThat(testSysUser.getCreateBy()).isEqualTo(UPDATED_CREATE_BY);
        assertThat(testSysUser.getCreateTime()).isEqualTo(UPDATED_CREATE_TIME);
        assertThat(testSysUser.getUpdateBy()).isEqualTo(UPDATED_UPDATE_BY);
        assertThat(testSysUser.getUpdateTime()).isEqualTo(UPDATED_UPDATE_TIME);
        assertThat(testSysUser.getUserIdentity()).isEqualTo(UPDATED_USER_IDENTITY);
        assertThat(testSysUser.getDepartIds()).isEqualTo(UPDATED_DEPART_IDS);
        assertThat(testSysUser.getRelTenantIds()).isEqualTo(UPDATED_REL_TENANT_IDS);
        assertThat(testSysUser.getClientId()).isEqualTo(UPDATED_CLIENT_ID);
    }

    @Test
    @Transactional
    void putNonExistingSysUser() throws Exception {
        int databaseSizeBeforeUpdate = sysUserRepository.findAll().size();
        sysUser.setId(UUID.randomUUID());

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        restSysUserMockMvc
            .perform(
                put(ENTITY_API_URL_ID, sysUser.getId())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(TestUtil.convertObjectToJsonBytes(sysUser))
            )
            .andExpect(status().isBadRequest());

        // Validate the SysUser in the database
        List<SysUser> sysUserList = sysUserRepository.findAll();
        assertThat(sysUserList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void putWithIdMismatchSysUser() throws Exception {
        int databaseSizeBeforeUpdate = sysUserRepository.findAll().size();
        sysUser.setId(UUID.randomUUID());

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restSysUserMockMvc
            .perform(
                put(ENTITY_API_URL_ID, UUID.randomUUID())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(TestUtil.convertObjectToJsonBytes(sysUser))
            )
            .andExpect(status().isBadRequest());

        // Validate the SysUser in the database
        List<SysUser> sysUserList = sysUserRepository.findAll();
        assertThat(sysUserList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void putWithMissingIdPathParamSysUser() throws Exception {
        int databaseSizeBeforeUpdate = sysUserRepository.findAll().size();
        sysUser.setId(UUID.randomUUID());

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restSysUserMockMvc
            .perform(put(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(TestUtil.convertObjectToJsonBytes(sysUser)))
            .andExpect(status().isMethodNotAllowed());

        // Validate the SysUser in the database
        List<SysUser> sysUserList = sysUserRepository.findAll();
        assertThat(sysUserList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void partialUpdateSysUserWithPatch() throws Exception {
        // Initialize the database
        sysUserRepository.saveAndFlush(sysUser);

        int databaseSizeBeforeUpdate = sysUserRepository.findAll().size();

        // Update the sysUser using partial update
        SysUser partialUpdatedSysUser = new SysUser();
        partialUpdatedSysUser.setId(sysUser.getId());

        partialUpdatedSysUser
            .username(UPDATED_USERNAME)
            .realName(UPDATED_REAL_NAME)
            .password(UPDATED_PASSWORD)
            .salt(UPDATED_SALT)
            .birthday(UPDATED_BIRTHDAY)
            .orgCode(UPDATED_ORG_CODE)
            .status(UPDATED_STATUS)
            .delFlag(UPDATED_DEL_FLAG)
            .thirdId(UPDATED_THIRD_ID)
            .thirdType(UPDATED_THIRD_TYPE)
            .workNo(UPDATED_WORK_NO)
            .post(UPDATED_POST)
            .userIdentity(UPDATED_USER_IDENTITY)
            .departIds(UPDATED_DEPART_IDS)
            .relTenantIds(UPDATED_REL_TENANT_IDS);

        restSysUserMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, partialUpdatedSysUser.getId())
                    .contentType("application/merge-patch+json")
                    .content(TestUtil.convertObjectToJsonBytes(partialUpdatedSysUser))
            )
            .andExpect(status().isOk());

        // Validate the SysUser in the database
        List<SysUser> sysUserList = sysUserRepository.findAll();
        assertThat(sysUserList).hasSize(databaseSizeBeforeUpdate);
        SysUser testSysUser = sysUserList.get(sysUserList.size() - 1);
        assertThat(testSysUser.getUsername()).isEqualTo(UPDATED_USERNAME);
        assertThat(testSysUser.getRealName()).isEqualTo(UPDATED_REAL_NAME);
        assertThat(testSysUser.getPassword()).isEqualTo(UPDATED_PASSWORD);
        assertThat(testSysUser.getSalt()).isEqualTo(UPDATED_SALT);
        assertThat(testSysUser.getAvatar()).isEqualTo(DEFAULT_AVATAR);
        assertThat(testSysUser.getBirthday()).isEqualTo(UPDATED_BIRTHDAY);
        assertThat(testSysUser.getSex()).isEqualTo(DEFAULT_SEX);
        assertThat(testSysUser.getEmail()).isEqualTo(DEFAULT_EMAIL);
        assertThat(testSysUser.getPhone()).isEqualTo(DEFAULT_PHONE);
        assertThat(testSysUser.getOrgCode()).isEqualTo(UPDATED_ORG_CODE);
        assertThat(testSysUser.getStatus()).isEqualTo(UPDATED_STATUS);
        assertThat(testSysUser.getDelFlag()).isEqualTo(UPDATED_DEL_FLAG);
        assertThat(testSysUser.getThirdId()).isEqualTo(UPDATED_THIRD_ID);
        assertThat(testSysUser.getThirdType()).isEqualTo(UPDATED_THIRD_TYPE);
        assertThat(testSysUser.getActivitySync()).isEqualTo(DEFAULT_ACTIVITY_SYNC);
        assertThat(testSysUser.getWorkNo()).isEqualTo(UPDATED_WORK_NO);
        assertThat(testSysUser.getPost()).isEqualTo(UPDATED_POST);
        assertThat(testSysUser.getTelephone()).isEqualTo(DEFAULT_TELEPHONE);
        assertThat(testSysUser.getCreateBy()).isEqualTo(DEFAULT_CREATE_BY);
        assertThat(testSysUser.getCreateTime()).isEqualTo(DEFAULT_CREATE_TIME);
        assertThat(testSysUser.getUpdateBy()).isEqualTo(DEFAULT_UPDATE_BY);
        assertThat(testSysUser.getUpdateTime()).isEqualTo(DEFAULT_UPDATE_TIME);
        assertThat(testSysUser.getUserIdentity()).isEqualTo(UPDATED_USER_IDENTITY);
        assertThat(testSysUser.getDepartIds()).isEqualTo(UPDATED_DEPART_IDS);
        assertThat(testSysUser.getRelTenantIds()).isEqualTo(UPDATED_REL_TENANT_IDS);
        assertThat(testSysUser.getClientId()).isEqualTo(DEFAULT_CLIENT_ID);
    }

    @Test
    @Transactional
    void fullUpdateSysUserWithPatch() throws Exception {
        // Initialize the database
        sysUserRepository.saveAndFlush(sysUser);

        int databaseSizeBeforeUpdate = sysUserRepository.findAll().size();

        // Update the sysUser using partial update
        SysUser partialUpdatedSysUser = new SysUser();
        partialUpdatedSysUser.setId(sysUser.getId());

        partialUpdatedSysUser
            .username(UPDATED_USERNAME)
            .realName(UPDATED_REAL_NAME)
            .password(UPDATED_PASSWORD)
            .salt(UPDATED_SALT)
            .avatar(UPDATED_AVATAR)
            .birthday(UPDATED_BIRTHDAY)
            .sex(UPDATED_SEX)
            .email(UPDATED_EMAIL)
            .phone(UPDATED_PHONE)
            .orgCode(UPDATED_ORG_CODE)
            .status(UPDATED_STATUS)
            .delFlag(UPDATED_DEL_FLAG)
            .thirdId(UPDATED_THIRD_ID)
            .thirdType(UPDATED_THIRD_TYPE)
            .activitySync(UPDATED_ACTIVITY_SYNC)
            .workNo(UPDATED_WORK_NO)
            .post(UPDATED_POST)
            .telephone(UPDATED_TELEPHONE)
            .createBy(UPDATED_CREATE_BY)
            .createTime(UPDATED_CREATE_TIME)
            .updateBy(UPDATED_UPDATE_BY)
            .updateTime(UPDATED_UPDATE_TIME)
            .userIdentity(UPDATED_USER_IDENTITY)
            .departIds(UPDATED_DEPART_IDS)
            .relTenantIds(UPDATED_REL_TENANT_IDS)
            .clientId(UPDATED_CLIENT_ID);

        restSysUserMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, partialUpdatedSysUser.getId())
                    .contentType("application/merge-patch+json")
                    .content(TestUtil.convertObjectToJsonBytes(partialUpdatedSysUser))
            )
            .andExpect(status().isOk());

        // Validate the SysUser in the database
        List<SysUser> sysUserList = sysUserRepository.findAll();
        assertThat(sysUserList).hasSize(databaseSizeBeforeUpdate);
        SysUser testSysUser = sysUserList.get(sysUserList.size() - 1);
        assertThat(testSysUser.getUsername()).isEqualTo(UPDATED_USERNAME);
        assertThat(testSysUser.getRealName()).isEqualTo(UPDATED_REAL_NAME);
        assertThat(testSysUser.getPassword()).isEqualTo(UPDATED_PASSWORD);
        assertThat(testSysUser.getSalt()).isEqualTo(UPDATED_SALT);
        assertThat(testSysUser.getAvatar()).isEqualTo(UPDATED_AVATAR);
        assertThat(testSysUser.getBirthday()).isEqualTo(UPDATED_BIRTHDAY);
        assertThat(testSysUser.getSex()).isEqualTo(UPDATED_SEX);
        assertThat(testSysUser.getEmail()).isEqualTo(UPDATED_EMAIL);
        assertThat(testSysUser.getPhone()).isEqualTo(UPDATED_PHONE);
        assertThat(testSysUser.getOrgCode()).isEqualTo(UPDATED_ORG_CODE);
        assertThat(testSysUser.getStatus()).isEqualTo(UPDATED_STATUS);
        assertThat(testSysUser.getDelFlag()).isEqualTo(UPDATED_DEL_FLAG);
        assertThat(testSysUser.getThirdId()).isEqualTo(UPDATED_THIRD_ID);
        assertThat(testSysUser.getThirdType()).isEqualTo(UPDATED_THIRD_TYPE);
        assertThat(testSysUser.getActivitySync()).isEqualTo(UPDATED_ACTIVITY_SYNC);
        assertThat(testSysUser.getWorkNo()).isEqualTo(UPDATED_WORK_NO);
        assertThat(testSysUser.getPost()).isEqualTo(UPDATED_POST);
        assertThat(testSysUser.getTelephone()).isEqualTo(UPDATED_TELEPHONE);
        assertThat(testSysUser.getCreateBy()).isEqualTo(UPDATED_CREATE_BY);
        assertThat(testSysUser.getCreateTime()).isEqualTo(UPDATED_CREATE_TIME);
        assertThat(testSysUser.getUpdateBy()).isEqualTo(UPDATED_UPDATE_BY);
        assertThat(testSysUser.getUpdateTime()).isEqualTo(UPDATED_UPDATE_TIME);
        assertThat(testSysUser.getUserIdentity()).isEqualTo(UPDATED_USER_IDENTITY);
        assertThat(testSysUser.getDepartIds()).isEqualTo(UPDATED_DEPART_IDS);
        assertThat(testSysUser.getRelTenantIds()).isEqualTo(UPDATED_REL_TENANT_IDS);
        assertThat(testSysUser.getClientId()).isEqualTo(UPDATED_CLIENT_ID);
    }

    @Test
    @Transactional
    void patchNonExistingSysUser() throws Exception {
        int databaseSizeBeforeUpdate = sysUserRepository.findAll().size();
        sysUser.setId(UUID.randomUUID());

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        restSysUserMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, sysUser.getId())
                    .contentType("application/merge-patch+json")
                    .content(TestUtil.convertObjectToJsonBytes(sysUser))
            )
            .andExpect(status().isBadRequest());

        // Validate the SysUser in the database
        List<SysUser> sysUserList = sysUserRepository.findAll();
        assertThat(sysUserList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void patchWithIdMismatchSysUser() throws Exception {
        int databaseSizeBeforeUpdate = sysUserRepository.findAll().size();
        sysUser.setId(UUID.randomUUID());

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restSysUserMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, UUID.randomUUID())
                    .contentType("application/merge-patch+json")
                    .content(TestUtil.convertObjectToJsonBytes(sysUser))
            )
            .andExpect(status().isBadRequest());

        // Validate the SysUser in the database
        List<SysUser> sysUserList = sysUserRepository.findAll();
        assertThat(sysUserList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void patchWithMissingIdPathParamSysUser() throws Exception {
        int databaseSizeBeforeUpdate = sysUserRepository.findAll().size();
        sysUser.setId(UUID.randomUUID());

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restSysUserMockMvc
            .perform(patch(ENTITY_API_URL).contentType("application/merge-patch+json").content(TestUtil.convertObjectToJsonBytes(sysUser)))
            .andExpect(status().isMethodNotAllowed());

        // Validate the SysUser in the database
        List<SysUser> sysUserList = sysUserRepository.findAll();
        assertThat(sysUserList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void deleteSysUser() throws Exception {
        // Initialize the database
        sysUserRepository.saveAndFlush(sysUser);

        int databaseSizeBeforeDelete = sysUserRepository.findAll().size();

        // Delete the sysUser
        restSysUserMockMvc
            .perform(delete(ENTITY_API_URL_ID, sysUser.getId().toString()).accept(MediaType.APPLICATION_JSON))
            .andExpect(status().isNoContent());

        // Validate the database contains one less item
        List<SysUser> sysUserList = sysUserRepository.findAll();
        assertThat(sysUserList).hasSize(databaseSizeBeforeDelete - 1);
    }
}
