package com.javaweb.api;

import com.javaweb.model.dto.RoleDTO;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.model.request.LoginRequest;
import com.javaweb.model.response.LoginResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/auth")
public class AuthAPI {

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private IUserService userService;

    @PostMapping("/login")
    public ResponseEntity<ResponseDTO> login(@RequestBody LoginRequest request, HttpServletRequest httpServletRequest) {
        ResponseDTO response = new ResponseDTO();
        try {
            Authentication authentication = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(request.getUsername(), request.getPassword())
            );

            SecurityContextHolder.getContext().setAuthentication(authentication);
            httpServletRequest.getSession(true);

            UserDTO userDTO = userService.findOneByUserName(request.getUsername());
            LoginResponse loginResponse = new LoginResponse();
            loginResponse.setUsername(userDTO.getUserName());
            loginResponse.setFullName(userDTO.getFullName());
            loginResponse.setRoles(userDTO.getRoles().stream().map(RoleDTO::getCode).collect(Collectors.toList()));

            response.setMessage("login_success");
            response.setData(loginResponse);
            return ResponseEntity.ok(response);
        } catch (AuthenticationException ex) {
            response.setMessage("invalid_credentials");
            response.setDetail("Tên đăng nhập hoặc mật khẩu không đúng");
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
        }
    }
}
