import 'dart:async';

import 'package:yamsmaster/domains/entities/player_entity.dart';
import 'package:yamsmaster/domains/entities/player_score_entity.dart';
import 'package:yamsmaster/domains/entities/score_entity.dart';

abstract class PlayerScoreRepository {
  /// Fetch a score from it's ID.
  Future<PlayerScoreEntity> fromId(int id);

  /// Create players scores object for a map of players and score.
  Future<List<PlayerScoreEntity>> createPlayersScore(
      Map<PlayerEntity, ScoreEntity> playerScores, int gameId);

  /// Retreive all the player score for a specified game id
  Future<List<PlayerScoreEntity>> fromGameId(
      int gameId);
}
