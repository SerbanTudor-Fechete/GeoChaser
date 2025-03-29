package com.example.demo.game;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

@Service
@RequiredArgsConstructor
public class GameService {
    private final GameRepository gameRepository;

    public Game getGameById(Long id) {
        return gameRepository.findById(String.valueOf(id)).orElse(null);
    }

    public Game updateGame(Long gameId, double lat, double lng ) {
        Game game = getGameById(gameId);

        game.setLatitude(lat);
        game.setLongitude(lng);

        return gameRepository.save(game);
    }
}
