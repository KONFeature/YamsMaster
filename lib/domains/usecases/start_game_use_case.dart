import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:get_it/get_it.dart';
import 'package:yamsmaster/domains/entities/game_entity.dart';
import 'package:yamsmaster/domains/entities/player_entity.dart';
import 'package:yamsmaster/domains/entities/player_score_entity.dart';
import 'package:yamsmaster/domains/entities/score_entity.dart';
import 'package:yamsmaster/domains/repositories/game_repository.dart';
import 'package:yamsmaster/domains/repositories/player_score_repository.dart';
import 'package:yamsmaster/domains/repositories/score_repository.dart';

/// Create a new game.
class StartGameUseCase extends UseCase<GameEntity, List<PlayerEntity>> {
  final ScoreRepository _scoreRepository = GetIt.I.get();
  final PlayerScoreRepository _playerScoreRepository = GetIt.I.get();
  final GameRepository _gameRepository = GetIt.I.get();

  @override
  Future<Stream<GameEntity>> buildUseCaseStream(
      List<PlayerEntity> players) async {
    final StreamController<GameEntity> controller = StreamController();

    /// Create the score for all the players.
    Map<PlayerEntity, ScoreEntity> scores =
        await _scoreRepository.createScoresForPlayers(players);

    // Create the game object
    GameEntity game = await _gameRepository.createGame();

    /// Create the player score object for the game
    List<PlayerScoreEntity> playerScores =
        await _playerScoreRepository.createPlayersScore(scores, game.id);

    // Return it
    controller.add(game);

    controller.close();
    return controller.stream;
  }
}
