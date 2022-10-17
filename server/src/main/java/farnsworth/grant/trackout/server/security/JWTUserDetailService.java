package farnsworth.grant.trackout.server.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserCache;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;

import farnsworth.grant.trackout.server.model.UserEntity;
import farnsworth.grant.trackout.server.model.database.UserCrud;

public class JWTUserDetailService implements UserDetailsService{

    @Autowired
    private UserCrud userCrud;

    @Autowired
    private PasswordEncoder bEncoder;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserEntity user = userCrud.findByUserName(username);
        if(user == null){
            throw new UsernameNotFoundException("Username not found:" + username);
        }
        return new User(user.GetUserName(),user.GetPassword(),user.GetGroups());
    }

    public UserEntity save(UserEntity user){
        return userCrud.save(user);
    }
    
}
