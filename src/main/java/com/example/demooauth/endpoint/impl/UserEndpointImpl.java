package com.example.demooauth.endpoint.impl;

import com.example.demooauth.endpoint.IUserEndPoint;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.core.OAuth2AuthenticatedPrincipal;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
public class UserEndpointImpl implements IUserEndPoint {

    @Autowired
    private ObjectMapper objectMapper;

    @Override
    public ResponseEntity<Authentication> getDataUser(Authentication currentUser) throws Exception {
        log.info("Current user : {}", objectMapper.writeValueAsString(currentUser));
        log.info("Principal type : {}", currentUser.getPrincipal().getClass().getName());

        String username;
        if (OAuth2AuthenticatedPrincipal.class.isAssignableFrom(currentUser.getPrincipal().getClass())) {
            username = ((OAuth2AuthenticatedPrincipal) currentUser.getPrincipal())
                    .getAttribute("user_name");
        } else if (Jwt.class.isAssignableFrom(currentUser.getPrincipal().getClass())) {
            username = ((Jwt) currentUser.getPrincipal()).getClaim("user_name");
        } else {
            throw new IllegalStateException("Cannot get username");
        }

        log.info("Username : {}", username);
        return ResponseEntity.ok(currentUser);
    }
}
