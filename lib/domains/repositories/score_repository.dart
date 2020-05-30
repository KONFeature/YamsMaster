import 'dart:async';

import 'package:yamsmaster/domains/entities/player_entity.dart';
import 'package:yamsmaster/domains/entities/score_entity.dart';

abstract class ScoreRepository {

  /// Fetch a score from it's ID.
  Future<ScoreEntity> fromId(int id);

  /// Create scores object for a list of players.
  Future<Map<PlayerEntity, ScoreEntity>> createScoresForPlayers(List<PlayerEntity> players);
  
}