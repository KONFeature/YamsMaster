import 'package:get_it/get_it.dart';
import 'package:yamsmaster/data/entities/game_data_entity.dart';
import 'package:yamsmaster/domains/entities/game_entity.dart';
import 'package:yamsmaster/domains/entities/player_score_entity.dart';
import 'package:yamsmaster/domains/repositories/player_score_repository.dart';

import 'mapper.dart';

class GameMapper extends Mapper<GameEntity, GameDataEntity> {
  PlayerScoreRepository _playerScoreRepository = GetIt.I.get();

  @override
  Future<GameEntity> from(GameDataEntity to) async {
    List<PlayerScoreEntity> playerScores =
        await _playerScoreRepository.fromGameId(to.id);
    return GameEntity(id: to.id, playerScores: playerScores, ended: to.ended);
  }

  @override
  Future<GameDataEntity> to(GameEntity from) async =>
      GameDataEntity(id: from.id, ended: from.ended);
}
