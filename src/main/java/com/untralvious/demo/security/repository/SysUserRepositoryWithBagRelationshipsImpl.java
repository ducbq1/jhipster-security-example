package com.untralvious.demo.security.repository;

import com.untralvious.demo.security.domain.SysUser;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.IntStream;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.hibernate.annotations.QueryHints;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;

/**
 * Utility repository to load bag relationships based on https://vladmihalcea.com/hibernate-multiplebagfetchexception/
 */
public class SysUserRepositoryWithBagRelationshipsImpl implements SysUserRepositoryWithBagRelationships {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Optional<SysUser> fetchBagRelationships(Optional<SysUser> sysUser) {
        return sysUser.map(this::fetchIds);
    }

    @Override
    public Page<SysUser> fetchBagRelationships(Page<SysUser> sysUsers) {
        return new PageImpl<>(fetchBagRelationships(sysUsers.getContent()), sysUsers.getPageable(), sysUsers.getTotalElements());
    }

    @Override
    public List<SysUser> fetchBagRelationships(List<SysUser> sysUsers) {
        return Optional.of(sysUsers).map(this::fetchIds).orElse(Collections.emptyList());
    }

    SysUser fetchIds(SysUser result) {
        return entityManager
            .createQuery("select sysUser from SysUser sysUser left join fetch sysUser.ids where sysUser is :sysUser", SysUser.class)
            .setParameter("sysUser", result)
            .setHint(QueryHints.PASS_DISTINCT_THROUGH, false)
            .getSingleResult();
    }

    List<SysUser> fetchIds(List<SysUser> sysUsers) {
        HashMap<Object, Integer> order = new HashMap<>();
        IntStream.range(0, sysUsers.size()).forEach(index -> order.put(sysUsers.get(index).getId(), index));
        List<SysUser> result = entityManager
            .createQuery(
                "select distinct sysUser from SysUser sysUser left join fetch sysUser.ids where sysUser in :sysUsers",
                SysUser.class
            )
            .setParameter("sysUsers", sysUsers)
            .setHint(QueryHints.PASS_DISTINCT_THROUGH, false)
            .getResultList();
        Collections.sort(result, (o1, o2) -> Integer.compare(order.get(o1.getId()), order.get(o2.getId())));
        return result;
    }
}
