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
 * A SysRole.
 */
@Entity
@Table(name = "sys_role")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SuppressWarnings("common-java:DuplicatedBlocks")
public class SysRole implements Serializable {

    private static final long serialVersionUID = 1L;

    @NotNull
    @Id
    @GeneratedValue
    @Type(type = "uuid-char")
    @Column(name = "id", length = 36, nullable = false)
    private UUID id;

    @Size(max = 200)
    @Column(name = "role_name", length = 200)
    private String roleName;

    @Size(max = 100)
    @Column(name = "role_code", length = 100)
    private String roleCode;

    @Size(max = 255)
    @Column(name = "description", length = 255)
    private String description;

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

    @ManyToMany(mappedBy = "ids")
    @Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
    @JsonIgnoreProperties(value = { "ids" }, allowSetters = true)
    private Set<SysUser> ids = new HashSet<>();

    // jhipster-needle-entity-add-field - JHipster will add fields here

    public UUID getId() {
        return this.id;
    }

    public SysRole id(UUID id) {
        this.setId(id);
        return this;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public String getRoleName() {
        return this.roleName;
    }

    public SysRole roleName(String roleName) {
        this.setRoleName(roleName);
        return this;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleCode() {
        return this.roleCode;
    }

    public SysRole roleCode(String roleCode) {
        this.setRoleCode(roleCode);
        return this;
    }

    public void setRoleCode(String roleCode) {
        this.roleCode = roleCode;
    }

    public String getDescription() {
        return this.description;
    }

    public SysRole description(String description) {
        this.setDescription(description);
        return this;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCreateBy() {
        return this.createBy;
    }

    public SysRole createBy(String createBy) {
        this.setCreateBy(createBy);
        return this;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public Instant getCreateTime() {
        return this.createTime;
    }

    public SysRole createTime(Instant createTime) {
        this.setCreateTime(createTime);
        return this;
    }

    public void setCreateTime(Instant createTime) {
        this.createTime = createTime;
    }

    public String getUpdateBy() {
        return this.updateBy;
    }

    public SysRole updateBy(String updateBy) {
        this.setUpdateBy(updateBy);
        return this;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public Instant getUpdateTime() {
        return this.updateTime;
    }

    public SysRole updateTime(Instant updateTime) {
        this.setUpdateTime(updateTime);
        return this;
    }

    public void setUpdateTime(Instant updateTime) {
        this.updateTime = updateTime;
    }

    public Set<SysUser> getIds() {
        return this.ids;
    }

    public void setIds(Set<SysUser> sysUsers) {
        if (this.ids != null) {
            this.ids.forEach(i -> i.removeId(this));
        }
        if (sysUsers != null) {
            sysUsers.forEach(i -> i.addId(this));
        }
        this.ids = sysUsers;
    }

    public SysRole ids(Set<SysUser> sysUsers) {
        this.setIds(sysUsers);
        return this;
    }

    public SysRole addId(SysUser sysUser) {
        this.ids.add(sysUser);
        sysUser.getIds().add(this);
        return this;
    }

    public SysRole removeId(SysUser sysUser) {
        this.ids.remove(sysUser);
        sysUser.getIds().remove(this);
        return this;
    }

    // jhipster-needle-entity-add-getters-setters - JHipster will add getters and setters here

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof SysRole)) {
            return false;
        }
        return id != null && id.equals(((SysRole) o).id);
    }

    @Override
    public int hashCode() {
        // see https://vladmihalcea.com/how-to-implement-equals-and-hashcode-using-the-jpa-entity-identifier/
        return getClass().hashCode();
    }

    // prettier-ignore
    @Override
    public String toString() {
        return "SysRole{" +
            "id=" + getId() +
            ", roleName='" + getRoleName() + "'" +
            ", roleCode='" + getRoleCode() + "'" +
            ", description='" + getDescription() + "'" +
            ", createBy='" + getCreateBy() + "'" +
            ", createTime='" + getCreateTime() + "'" +
            ", updateBy='" + getUpdateBy() + "'" +
            ", updateTime='" + getUpdateTime() + "'" +
            "}";
    }
}
