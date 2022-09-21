package com.untralvious.demo.security.service.dto;

import com.untralvious.demo.security.domain.SysUser;
import com.untralvious.demo.security.domain.User;

import java.io.Serializable;

/**
 * A DTO representing a user, with only the public attributes.
 */
public class SysUserDTO implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long id;

    private String username;

    public SysUserDTO() {
        // Empty constructor needed for Jackson.
    }

    public SysUserDTO(SysUser user) {
        this.id = user.getId();
        // Customize it here if you need, or not, firstName/lastName/etc
        this.username = user.getUsername();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String login) {
        this.username = username;
    }

    // prettier-ignore
    @Override
    public String toString() {
        return "UserDTO{" +
            "id='" + id + '\'' +
            ", login='" + username + '\'' +
            "}";
    }
}
