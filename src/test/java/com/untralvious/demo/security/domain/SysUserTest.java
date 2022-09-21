package com.untralvious.demo.security.domain;

import static org.assertj.core.api.Assertions.assertThat;

import com.untralvious.demo.security.web.rest.TestUtil;
import java.util.UUID;
import org.junit.jupiter.api.Test;

class SysUserTest {

    @Test
    void equalsVerifier() throws Exception {
        TestUtil.equalsVerifier(SysUser.class);
        SysUser sysUser1 = new SysUser();
        sysUser1.setId(UUID.randomUUID());
        SysUser sysUser2 = new SysUser();
        sysUser2.setId(sysUser1.getId());
        assertThat(sysUser1).isEqualTo(sysUser2);
        sysUser2.setId(UUID.randomUUID());
        assertThat(sysUser1).isNotEqualTo(sysUser2);
        sysUser1.setId(null);
        assertThat(sysUser1).isNotEqualTo(sysUser2);
    }
}
