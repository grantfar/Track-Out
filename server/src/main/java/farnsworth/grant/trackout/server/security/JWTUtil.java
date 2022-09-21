package farnsworth.grant.trackout.server.security;

import java.io.Serializable;

import java.util.Date;
import java.util.function.Function;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;
import io.jsonwebtoken.Claims;

@Component
public class JWTUtil implements Serializable{

    private static long ET = 31 * 60 * 60 * 24;
    
    @Value("${jwt.secret}")
    private byte[] secret;

    
    /** 
     * @param token
     * @return String
     */
    public String userNameFromToken(String token){
        return getClaimsFromToken(token, Claims::getSubject);
    }

    
    /** 
     * @param token
     * @return Date
     */
    public Date expirationFromToken(String token){
        return getClaimsFromToken(token, Claims::getExpiration);
    }

    
    /** 
     * @param token
     * @param funk
     * @return T
     */
    public <T> T getClaimsFromToken(String token, Function<Claims,T> funk ){
        return funk.apply(Jwts.parserBuilder().setSigningKey(secret).build().parseClaimsJws(token).getBody());
    }

    
    /** 
     * @param details
     * @return String
     */
    public String genToken(UserDetails details){
        return Jwts.builder().setSubject(details.getUsername()).setExpiration( new Date(System.currentTimeMillis() + ET * 100))
        .signWith(Keys.hmacShaKeyFor(secret),SignatureAlgorithm.HS512).compact();
    }

    
    /** 
     * @param token
     * @param details
     * @return boolean
     */
    public boolean verifyToken(String token, UserDetails details){
        return userNameFromToken(token).equals(details.getUsername()) && expirationFromToken(token).after(new Date());
    }
}
