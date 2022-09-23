package farnsworth.grant.trackout.server.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class JWToken {
    @Id
    private Long id;
    private Long userId;
    private String token;
    private String deviceName;
    private s
}
