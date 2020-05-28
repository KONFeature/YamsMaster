import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:yamsmaster/data/entities/score_data_entity.dart';
import 'package:yamsmaster/data/mapper/score_mapper.dart';
import 'package:yamsmaster/domains/entities/player_entity.dart';
import 'package:yamsmaster/domains/entities/score_entity.dart';
import 'package:yamsmaster/domains/repositories/score_repository.dart';

import '../../objectbox.g.dart';

class ScoreRepositoryImpl implements ScoreRepository {
  final Box<ScoreDataEntity> _scoreBox = Box(GetIt.I.get<Store>());
  final ScoreMapper _mapper = GetIt.I.get();

  @override
  Future<ScoreEntity> fromId(int id) async =>
      _mapper.from(_scoreBox.get(id));

  @override
  Future<Map<PlayerEntity, ScoreEntity>> createScoresForPlayers(List<PlayerEntity> players) async {
    Map<PlayerEntity, ScoreEntity> playersScoreMap = Map();
    for(PlayerEntity player in players) {
      // Create the score object for this player
      ScoreDataEntity score = ScoreDataEntity();
      // Insert it in database
      int scoreId = _scoreBox.put(score);
      score.id = scoreId;

      playersScoreMap[player] = await _mapper.from(score);
    }

    return playersScoreMap;
  }

  
}