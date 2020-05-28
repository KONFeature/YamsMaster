import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:yamsmaster/data/entities/player_score_data_entity.dart';
import 'package:yamsmaster/data/mapper/player_score_mapper.dart';
import 'package:yamsmaster/domains/entities/player_entity.dart';
import 'package:yamsmaster/domains/entities/player_score_entity.dart';
import 'package:yamsmaster/domains/entities/score_entity.dart';
import 'package:yamsmaster/domains/repositories/player_score_repository.dart';

import '../../objectbox.g.dart';

class PlayerScoreRepositoryImpl implements PlayerScoreRepository {
  final Box<PlayerScoreDataEntity> _playerScoreBox = Box(GetIt.I.get<Store>());
  final PlayerScoreMapper _mapper = GetIt.I.get();

  @override
  Future<PlayerScoreEntity> fromId(int id) async =>
      _mapper.from(_playerScoreBox.get(id));

  @override
  Future<List<PlayerScoreEntity>> createPlayersScore(
      Map<PlayerEntity, ScoreEntity> playerScores, int gameId) async {
    List<PlayerScoreDataEntity> playerScoresCreated = List();

    playerScores.forEach((player, score) {
      // Create the player score to insert
      PlayerScoreDataEntity playerScore = PlayerScoreDataEntity(
          gameId: gameId, playerId: player.id, scoreId: score.id);
      // Save it in the database
      int playerScoreId = _playerScoreBox.put(playerScore);
      playerScore.id = playerScoreId;

      // Add it to our creation list
      playerScoresCreated.add(playerScore);
    });

    // Map our created object list to the result
    List<PlayerScoreEntity> playerScoresRes = List();
    for (PlayerScoreDataEntity playerScoreDataEntity in playerScoresCreated) {
      // Map it and add it to the result list
      PlayerScoreEntity playerScoreEntity =
          await _mapper.from(playerScoreDataEntity);
      playerScoresRes.add(playerScoreEntity);
    }

    return playerScoresRes;
  }

  @override
  Future<List<PlayerScoreEntity>> fromGameId(int gameId) async {
    List<PlayerScoreDataEntity> playerScores = await _playerScoreBox
        .query(PlayerScoreDataEntity_.gameId.equals(gameId))
        .build()
        .find();

    List<PlayerScoreEntity> playerScoresRes = List();
    for (PlayerScoreDataEntity playerScore in playerScores) {
      playerScoresRes.add(await _mapper.from(playerScore));
    }
    return playerScoresRes;
  }
}
