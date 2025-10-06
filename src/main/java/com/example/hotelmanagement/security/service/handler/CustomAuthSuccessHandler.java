package com.example.hotelmanagement.security.service.handler;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Set;

@Component
public class CustomAuthSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
                                        HttpServletResponse response,
                                        Authentication authentication)
            throws IOException, ServletException {

        Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());

        // Store user role(s) in session for later use (e.g., in Thymeleaf or JS)
        request.getSession().setAttribute("userRoles", roles);

        // Store login time or hotel scope info (for multi-hotel logic)
        request.getSession().setAttribute("loginTime", System.currentTimeMillis());

        // If all roles use same dashboard
        response.sendRedirect("/index");
    }
}
