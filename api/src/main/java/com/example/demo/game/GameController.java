package com.example.demo.game;

import com.example.demo.coordinates.CoordinatesDto;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/game")
public class GameController {

    CoordinatesDto coordinatesDto;
    private boolean coordinatesUpdated = false;

    @PostMapping("/coordinate")
    public ResponseEntity<?> updateCoordinates(@RequestBody CoordinatesDto coordinates) {
        coordinatesDto = coordinates;
        coordinatesUpdated = true;
        return ResponseEntity.ok(coordinates);

    }

    @GetMapping("/coordinates")
    public ResponseEntity<?> getCoordinates() {
        if (coordinatesUpdated && coordinatesDto != null) {
            coordinatesUpdated = false;
            return ResponseEntity.ok(coordinatesDto);
        }
        return ResponseEntity.status(204).header("Content-Type", "application/json").body("{}");
    }
}
