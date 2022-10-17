package farnsworth.grant.trackout.server.model;


import javax.persistence.Entity;
import javax.persistence.Id;
import org.springframework.security.core.GrantedAuthority;

@Entity
public class Group implements GrantedAuthority{
    @Id
    private String name;
    
    @Override
    public String getAuthority() {
        return name;
    }    
}
