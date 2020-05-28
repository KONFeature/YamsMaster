import 'package:get_it/get_it.dart';
import 'package:yamsmaster/data/entities/player_score_data_entity.dart';
import 'package:yamsmaster/domains/entities/player_score_entity.dart';
import 'package:yamsmaster/domains/repositories/player_repository.dart';
import 'package:yamsmaster/domains/repositories/score_repository.dart';

import 'mapper.dart';

class PlayerScoreMapper
    extends Mapper<PlayerScoreEntity, PlayerScoreDataEntity> {
  PlayerRepository _playerRepository = GetIt.I.get();
  ScoreRepository _scoreRepository = GetIt.I.get();

  @override
  Future<PlayerScoreEntity> from(PlayerScoreDataEntity to) async =>
      PlayerScoreEntity(
          id: to.id,
          player: await _playerRepository.fromId(to.playerId),
          score: await _scoreRepository.fromId(to.scoreId));

  @override
  Future<PlayerScoreDataEntity> to(PlayerScoreEntity from) async =>
      PlayerScoreDataEntity(
          id: from.id, playerId: from.player.id, scoreId: from.score.id);
}
