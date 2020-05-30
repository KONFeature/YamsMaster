import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:get_it/get_it.dart';
import 'package:yamsmaster/domains/entities/game_entity.dart';
import 'package:yamsmaster/domains/repositories/game_repository.dart';

class GetGameUseCase extends UseCase<GameEntity, int> {
  final GameRepository _gameRepository = GetIt.I.get();

  @override
  Future<Stream<GameEntity>> buildUseCaseStream(int gameId) async {
    final StreamController<GameEntity> controller = StreamController();

    // Fetch the game.
    GameEntity game = await _gameRepository.fromId(gameId);

    // Return it.
    controller.add(game);

    controller.close();
    return controller.stream;
  }
}
