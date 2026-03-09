package com.javaweb.repository;

import com.javaweb.entity.UserEntity;
import com.javaweb.repository.custom.UserRepositoryCustom;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.EntityGraph;

import java.util.List;

public interface UserRepository extends JpaRepository<UserEntity, Long> , UserRepositoryCustom {
    @EntityGraph(attributePaths = "roles")
    UserEntity findOneByUserNameAndStatus(String name, int status);
    Page<UserEntity> findByUserNameContainingIgnoreCaseAndStatusNot(String userName, int status, Pageable pageable);
    List<UserEntity> findByStatusAndRoles_Code(Integer status, String roleCode);
    Page<UserEntity> findByStatusNot(int status, Pageable pageable);
    long countByUserNameContainingIgnoreCaseAndStatusNot(String userName, int status);
    long countByStatusNot(int status);
    @EntityGraph(attributePaths = "roles")
    UserEntity findOneByUserName(String userName);
    List<UserEntity> findByIdIn(List<Long> id);
}
