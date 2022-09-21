package com.untralvious.demo.security.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.io.Serializable;
import java.time.Instant;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;
import javax.persistence.*;
import javax.validation.constraints.*;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Type;

/**
 * A SysUser.
 */
@Entity
@Table(name = "sys_user")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SuppressWarnings("common-java:DuplicatedBlocks")
public class SysUser implements Serializable {

    private static final long serialVersionUID = 1L;

    @NotNull
    @Id
    @GeneratedValue
    @Type(type = "uuid-char")
    @Column(name = "id", length = 36, nullable = false)
    private Long id;

    @Size(max = 100)
    @Column(name = "username", length = 100, unique = true)
    private String username;

    @Size(max = 100)
    @Column(name = "real_name", length = 100)
    private String realName;

    @Size(max = 255)
    @Column(name = "password", length = 255)
    private String password;

    @Size(max = 45)
    @Column(name = "salt", length = 45)
    private String salt;

    @Size(max = 255)
    @Column(name = "avatar", length = 255)
    private String avatar;

    @Column(name = "birthday")
    private Instant birthday;

    @Column(name = "sex")
    private Boolean sex;

    @Size(max = 45)
    @Column(name = "email", length = 45, unique = true)
    private String email;

    @Size(max = 45)
    @Column(name = "phone", length = 45, unique = true)
    private String phone;

    @Size(max = 64)
    @Column(name = "org_code", length = 64)
    private String orgCode;

    @Column(name = "status")
    private Integer status;

    @Column(name = "del_flag")
    private Integer delFlag;

    @Size(max = 100)
    @Column(name = "third_id", length = 100)
    private String thirdId;

    @Size(max = 100)
    @Column(name = "third_type", length = 100)
    private String thirdType;

    @Column(name = "activity_sync")
    private Integer activitySync;

    @Size(max = 100)
    @Column(name = "work_no", length = 100, unique = true)
    private String workNo;

    @Size(max = 100)
    @Column(name = "post", length = 100)
    private String post;

    @Size(max = 45)
    @Column(name = "telephone", length = 45)
    private String telephone;

    @Size(max = 32)
    @Column(name = "create_by", length = 32)
    private String createBy;

    @Column(name = "create_time")
    private Instant createTime;

    @Size(max = 32)
    @Column(name = "update_by", length = 32)
    private String updateBy;

    @Column(name = "update_time")
    private Instant updateTime;

    @Column(name = "user_identity")
    private Integer userIdentity;

    @Column(name = "depart_ids")
    private String departIds;

    @Size(max = 100)
    @Column(name = "rel_tenant_ids", length = 100)
    private String relTenantIds;

    @Size(max = 64)
    @Column(name = "client_id", length = 64)
    private String clientId;

    @ManyToMany
    @JoinTable(name = "rel_sys_user__id", joinColumns = @JoinColumn(name = "sys_user_id"), inverseJoinColumns = @JoinColumn(name = "id_id"))
    @Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
    @JsonIgnoreProperties(value = { "ids" }, allowSetters = true)
    private Set<SysRole> ids = new HashSet<>();

    // jhipster-needle-entity-add-field - JHipster will add fields here

    public Long getId() {
        return this.id;
    }

    public SysUser id(Long id) {
        this.setId(id);
        return this;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return this.username;
    }

    public SysUser username(String username) {
        this.setUsername(username);
        return this;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRealName() {
        return this.realName;
    }

    public SysUser realName(String realName) {
        this.setRealName(realName);
        return this;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getPassword() {
        return this.password;
    }

    public SysUser password(String password) {
        this.setPassword(password);
        return this;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSalt() {
        return this.salt;
    }

    public SysUser salt(String salt) {
        this.setSalt(salt);
        return this;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getAvatar() {
        return this.avatar;
    }

    public SysUser avatar(String avatar) {
        this.setAvatar(avatar);
        return this;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Instant getBirthday() {
        return this.birthday;
    }

    public SysUser birthday(Instant birthday) {
        this.setBirthday(birthday);
        return this;
    }

    public void setBirthday(Instant birthday) {
        this.birthday = birthday;
    }

    public Boolean getSex() {
        return this.sex;
    }

    public SysUser sex(Boolean sex) {
        this.setSex(sex);
        return this;
    }

    public void setSex(Boolean sex) {
        this.sex = sex;
    }

    public String getEmail() {
        return this.email;
    }

    public SysUser email(String email) {
        this.setEmail(email);
        return this;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return this.phone;
    }

    public SysUser phone(String phone) {
        this.setPhone(phone);
        return this;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getOrgCode() {
        return this.orgCode;
    }

    public SysUser orgCode(String orgCode) {
        this.setOrgCode(orgCode);
        return this;
    }

    public void setOrgCode(String orgCode) {
        this.orgCode = orgCode;
    }

    public Integer getStatus() {
        return this.status;
    }

    public SysUser status(Integer status) {
        this.setStatus(status);
        return this;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getDelFlag() {
        return this.delFlag;
    }

    public SysUser delFlag(Integer delFlag) {
        this.setDelFlag(delFlag);
        return this;
    }

    public void setDelFlag(Integer delFlag) {
        this.delFlag = delFlag;
    }

    public String getThirdId() {
        return this.thirdId;
    }

    public SysUser thirdId(String thirdId) {
        this.setThirdId(thirdId);
        return this;
    }

    public void setThirdId(String thirdId) {
        this.thirdId = thirdId;
    }

    public String getThirdType() {
        return this.thirdType;
    }

    public SysUser thirdType(String thirdType) {
        this.setThirdType(thirdType);
        return this;
    }

    public void setThirdType(String thirdType) {
        this.thirdType = thirdType;
    }

    public Integer getActivitySync() {
        return this.activitySync;
    }

    public SysUser activitySync(Integer activitySync) {
        this.setActivitySync(activitySync);
        return this;
    }

    public void setActivitySync(Integer activitySync) {
        this.activitySync = activitySync;
    }

    public String getWorkNo() {
        return this.workNo;
    }

    public SysUser workNo(String workNo) {
        this.setWorkNo(workNo);
        return this;
    }

    public void setWorkNo(String workNo) {
        this.workNo = workNo;
    }

    public String getPost() {
        return this.post;
    }

    public SysUser post(String post) {
        this.setPost(post);
        return this;
    }

    public void setPost(String post) {
        this.post = post;
    }

    public String getTelephone() {
        return this.telephone;
    }

    public SysUser telephone(String telephone) {
        this.setTelephone(telephone);
        return this;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getCreateBy() {
        return this.createBy;
    }

    public SysUser createBy(String createBy) {
        this.setCreateBy(createBy);
        return this;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public Instant getCreateTime() {
        return this.createTime;
    }

    public SysUser createTime(Instant createTime) {
        this.setCreateTime(createTime);
        return this;
    }

    public void setCreateTime(Instant createTime) {
        this.createTime = createTime;
    }

    public String getUpdateBy() {
        return this.updateBy;
    }

    public SysUser updateBy(String updateBy) {
        this.setUpdateBy(updateBy);
        return this;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public Instant getUpdateTime() {
        return this.updateTime;
    }

    public SysUser updateTime(Instant updateTime) {
        this.setUpdateTime(updateTime);
        return this;
    }

    public void setUpdateTime(Instant updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getUserIdentity() {
        return this.userIdentity;
    }

    public SysUser userIdentity(Integer userIdentity) {
        this.setUserIdentity(userIdentity);
        return this;
    }

    public void setUserIdentity(Integer userIdentity) {
        this.userIdentity = userIdentity;
    }

    public String getDepartIds() {
        return this.departIds;
    }

    public SysUser departIds(String departIds) {
        this.setDepartIds(departIds);
        return this;
    }

    public void setDepartIds(String departIds) {
        this.departIds = departIds;
    }

    public String getRelTenantIds() {
        return this.relTenantIds;
    }

    public SysUser relTenantIds(String relTenantIds) {
        this.setRelTenantIds(relTenantIds);
        return this;
    }

    public void setRelTenantIds(String relTenantIds) {
        this.relTenantIds = relTenantIds;
    }

    public String getClientId() {
        return this.clientId;
    }

    public SysUser clientId(String clientId) {
        this.setClientId(clientId);
        return this;
    }

    public void setClientId(String clientId) {
        this.clientId = clientId;
    }

    public Set<SysRole> getIds() {
        return this.ids;
    }

    public void setIds(Set<SysRole> sysRoles) {
        this.ids = sysRoles;
    }

    public SysUser ids(Set<SysRole> sysRoles) {
        this.setIds(sysRoles);
        return this;
    }

    public SysUser addId(SysRole sysRole) {
        this.ids.add(sysRole);
        sysRole.getIds().add(this);
        return this;
    }

    public SysUser removeId(SysRole sysRole) {
        this.ids.remove(sysRole);
        sysRole.getIds().remove(this);
        return this;
    }

    // jhipster-needle-entity-add-getters-setters - JHipster will add getters and setters here

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof SysUser)) {
            return false;
        }
        return id != null && id.equals(((SysUser) o).id);
    }

    @Override
    public int hashCode() {
        // see https://vladmihalcea.com/how-to-implement-equals-and-hashcode-using-the-jpa-entity-identifier/
        return getClass().hashCode();
    }

    // prettier-ignore
    @Override
    public String toString() {
        return "SysUser{" +
            "id=" + getId() +
            ", username='" + getUsername() + "'" +
            ", realName='" + getRealName() + "'" +
            ", password='" + getPassword() + "'" +
            ", salt='" + getSalt() + "'" +
            ", avatar='" + getAvatar() + "'" +
            ", birthday='" + getBirthday() + "'" +
            ", sex='" + getSex() + "'" +
            ", email='" + getEmail() + "'" +
            ", phone='" + getPhone() + "'" +
            ", orgCode='" + getOrgCode() + "'" +
            ", status=" + getStatus() +
            ", delFlag=" + getDelFlag() +
            ", thirdId='" + getThirdId() + "'" +
            ", thirdType='" + getThirdType() + "'" +
            ", activitySync=" + getActivitySync() +
            ", workNo='" + getWorkNo() + "'" +
            ", post='" + getPost() + "'" +
            ", telephone='" + getTelephone() + "'" +
            ", createBy='" + getCreateBy() + "'" +
            ", createTime='" + getCreateTime() + "'" +
            ", updateBy='" + getUpdateBy() + "'" +
            ", updateTime='" + getUpdateTime() + "'" +
            ", userIdentity=" + getUserIdentity() +
            ", departIds='" + getDepartIds() + "'" +
            ", relTenantIds='" + getRelTenantIds() + "'" +
            ", clientId='" + getClientId() + "'" +
            "}";
    }
}
