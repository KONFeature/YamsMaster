import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:yamsmaster/data/entities/game_data_entity.dart';
import 'package:yamsmaster/data/mapper/game_mapper.dart';
import 'package:yamsmaster/domains/entities/game_entity.dart';
import 'package:yamsmaster/domains/entities/player_score_entity.dart';
import 'package:yamsmaster/domains/repositories/game_repository.dart';

import '../../objectbox.g.dart';

class GameRepositoryImpl implements GameRepository {
  final Box<GameDataEntity> _gameBox = Box(GetIt.I.get<Store>());
  final GameMapper _mapper = GetIt.I.get();

  @override
  Future<GameEntity> fromId(int id) async =>
      _mapper.from(_gameBox.get(id));

  @override
  Future<GameEntity> createGame() async {
    // Create the game we want
    GameDataEntity game = GameDataEntity(ended: false);
    // Save it
    int gameId = _gameBox.put(game);
    game.id = gameId;
    // Return it
    return await _mapper.from(game);
  }
}
