package com.example.demo.user;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/users")
@RequiredArgsConstructor
public class UserController {

    //UserService is declared as final so that it gets injected via the generated
    // constructor using @RequiredArgsConstructor
    private final UserService userService;

    @PostMapping("/register")
    public ResponseEntity<?> registerUser(@RequestBody UserDto userDto) {

        try{
            User user = userService.registerUser(userDto.getUsername(),userDto.getFirebaseUid());
            return ResponseEntity.ok(user);
        }catch (RuntimeException ex){
            return ResponseEntity.badRequest().body(ex.getMessage());
        }
    }

    @GetMapping("/{fireBaseUid}")
    public ResponseEntity<?> getUser(@PathVariable String fireBaseUid) {

        try{
            User user = userService.getUserByFireBaseUid(fireBaseUid);
            return ResponseEntity.ok(user);
        } catch (RuntimeException ex){
            return ResponseEntity.badRequest().body(ex.getMessage());
        }
    }
}
