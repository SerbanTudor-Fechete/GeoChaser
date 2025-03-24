package com.example.demo.street_view;

import com.example.demo.config.ApiKeyLoader;
import com.example.demo.utils.RandomCoordinateGenerator;
import lombok.RequiredArgsConstructor;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequiredArgsConstructor
@Controller
@RequestMapping("/api")
@Log4j2
public class StreetViewController {

    private final RandomCoordinateGenerator  randomCoordinateGenerator;
    private final ApiKeyLoader apiKeyLoader;

    @GetMapping("/streetview")
    public String serveStreetView(

            Model model) {
        // Hardcoded values
        double latitude = 40.714728;
        double longitude = -73.998672;
        String radius = "100";
        log.info("Received coordonates: {}", new double[]{latitude, longitude});

        String apiKey = apiKeyLoader.getApiKey();

        double[] coordinates = {0.0, 0.0};
        coordinates = randomCoordinateGenerator.generateRandomCoordinate(latitude, longitude,Integer.parseInt(radius));

        model.addAttribute("latitude", coordinates[0]);
        model.addAttribute("longitude", coordinates[1]);
        model.addAttribute("apiKey", apiKey);

        return "dynamicStreetView";
    }

    }
