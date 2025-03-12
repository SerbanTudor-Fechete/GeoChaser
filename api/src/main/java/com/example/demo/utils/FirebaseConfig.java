package com.example.demo.utils;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import jakarta.annotation.PostConstruct;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;

import java.io.IOException;
import java.io.InputStream;

@Slf4j
@Configuration
public class FirebaseConfig {

    @PostConstruct
    public void initializeFirebase() {
        try{
            InputStream serviceAccount = getClass().getClassLoader()
                    .getResourceAsStream("geochaser-5eede-firebase-adminsdk-fbsvc-69221dc2d2.json");

            FirebaseOptions options = FirebaseOptions.builder()
                    .setCredentials(GoogleCredentials.fromStream(serviceAccount))
                    .build();

            FirebaseApp.initializeApp(options);
            log.info("FirebaseApp initialized");
        }catch (IOException e){
            log.error("Error initializing Firebase Admin SDK: "+e.getMessage());
        }
    }
}
