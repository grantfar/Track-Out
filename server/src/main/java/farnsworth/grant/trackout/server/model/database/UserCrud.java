package farnsworth.grant.trackout.server.model.database;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import farnsworth.grant.trackout.server.model.UserEntity;

@Repository
public interface UserCrud extends CrudRepository<UserEntity,Long> {
    public UserEntity findByUserName(String username);
}
