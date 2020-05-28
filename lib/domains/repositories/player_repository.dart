import 'dart:async';

import 'package:yamsmaster/domains/entities/player_entity.dart';

abstract class PlayerRepository {
  /// Fetch a player it's ID.
  Future<PlayerEntity> fromId(int id);

  /// Get all the players.
  Future<List<PlayerEntity>> getPlayers();

  /// Add a new player.
  Future<void> addPlayer(String name);
}
