package farnsworth.grant.trackout.server.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;


@Entity
public class UserEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String username;
    private String password;

    @ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinTable(
        name = "User_Groups",
        joinColumns = @JoinColumn(name ="UserID"),
        inverseJoinColumns = @JoinColumn(name = "GroupID")
    )
    private Set<Group> groups;

    public Long getId(){return id;}
    public String GetUserName(){return username;}
    public String GetPassword(){return password;}
    public Set<Group> GetGroups(){return groups;}
    public void SetUserName(String userName){this.username = userName;}
    public void SetPassword(String password){this.password = password;}
    public void SetGroups(Set<Group> groups){this.groups = groups;}
}
