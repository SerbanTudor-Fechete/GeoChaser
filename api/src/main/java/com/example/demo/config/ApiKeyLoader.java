package com.example.demo.config;

import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;


@Component
@NoArgsConstructor
public class ApiKeyLoader {

    @Value("${api.key.location}")
    private String apiKeyLocation;

    public String getApiKey(){
        try{
            // Path path = Path.of(apiKeyLocation);

            Path path = Path.of("C:/Users/serba/Downloads/geo_chaser/api_key.txt");
            return Files.readString(path).trim();
        }catch(IOException e){
            throw new RuntimeException("Failed to load API key from file "+e);
        }
    }

}
