package com.example.demo.user;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;

    public User registerUser(String username, String fireBaseUId) {
        if(userRepository.existsByFireBaseUid(fireBaseUId)) {
            throw new RuntimeException("User with the provided Firebase UID already exists.");
        }

        User user = User.builder()
                .username(username)
                .fireBaseUid(fireBaseUId)
                .score(0L)
                .build();
        return userRepository.save(user);
    }

    public User getUserByFireBaseUid(String fireBaseUId) {
        return userRepository.findByFireBaseUid(fireBaseUId)
                .orElseThrow(() -> new RuntimeException("User not found."));
    }
}
