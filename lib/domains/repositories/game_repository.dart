import 'dart:async';

import 'package:yamsmaster/domains/entities/game_entity.dart';

abstract class GameRepository {
  /// Get a game from it's id.
  Future<GameEntity> fromId(int id);

  /// Create game object.
  Future<GameEntity> createGame();
}
