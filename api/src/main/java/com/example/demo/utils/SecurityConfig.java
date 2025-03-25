package com.example.demo.utils;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .csrf(csrf -> csrf.disable())
                .authorizeHttpRequests(auth -> auth
                        // Allow registration endpoint without authentication
                        .requestMatchers("/api/users/register", "/api/streetview", "/game/**").permitAll()
                        // Optionally, allow other endpoints as needed
                        .anyRequest().authenticated()
                )

                // Disable form login and HTTP Basic so no login prompt appears.
                .formLogin(AbstractHttpConfigurer::disable)
                .httpBasic(AbstractHttpConfigurer::disable)

                // Ensure your FirebaseTokenFilter is added before UsernamePasswordAuthenticationFilter
                .addFilterBefore(new FirebaseTokenFilter(), org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter.class)
                .httpBasic(Customizer.withDefaults());
        return http.build();
    }
}
