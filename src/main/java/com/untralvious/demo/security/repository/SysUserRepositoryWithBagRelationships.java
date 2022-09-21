package com.untralvious.demo.security.repository;

import com.untralvious.demo.security.domain.SysUser;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import org.springframework.data.domain.Page;

public interface SysUserRepositoryWithBagRelationships {
    Optional<SysUser> fetchBagRelationships(Optional<SysUser> sysUser);

    List<SysUser> fetchBagRelationships(List<SysUser> sysUsers);

    Page<SysUser> fetchBagRelationships(Page<SysUser> sysUsers);
}
