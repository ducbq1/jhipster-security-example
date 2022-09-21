package com.untralvious.demo.security.service.dto;

import com.untralvious.demo.security.domain.SysRole;
import com.untralvious.demo.security.domain.SysUser;
import com.untralvious.demo.security.domain.User;

import java.io.Serializable;

/**
 * A DTO representing a user, with only the public attributes.
 */
public class SysRoleDTO implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long id;

    private String roleName;

    public SysRoleDTO() {
        // Empty constructor needed for Jackson.
    }

    public SysRoleDTO(SysRole role) {
        this.id = role.getId();
        // Customize it here if you need, or not, firstName/lastName/etc
        this.roleName = role.getRoleName();
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    // prettier-ignore
    @Override
    public String toString() {
        return "UserDTO{" +
            "id='" + id + '\'' +
            ", login='" + roleName + '\'' +
            "}";
    }
}
