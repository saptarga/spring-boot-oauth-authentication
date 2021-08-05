package com.example.demooauth.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configurers.oauth2.server.resource.OAuth2ResourceServerConfigurer;

@Configuration @Order(1)
public class ResourceServerConfig extends WebSecurityConfigurerAdapter {
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.antMatcher("/api/**")
                .authorizeRequests(authorizeRequests ->
                        authorizeRequests
                                .anyRequest().authenticated())
                //.oauth2ResourceServer(OAuth2ResourceServerConfigurer::opaqueToken);
                .oauth2ResourceServer(OAuth2ResourceServerConfigurer::jwt);
    }
}
