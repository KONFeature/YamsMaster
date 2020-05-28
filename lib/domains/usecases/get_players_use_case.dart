import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:get_it/get_it.dart';
import 'package:yamsmaster/domains/entities/player_entity.dart';
import 'package:yamsmaster/domains/repositories/player_repository.dart';

class GetPlayersUseCase extends UseCase<List<PlayerEntity>, void> {
  final PlayerRepository _playerRepository = GetIt.I.get();

  @override
  Future<Stream<List<PlayerEntity>>> buildUseCaseStream(_) async {
    final StreamController<List<PlayerEntity>> controller = StreamController();

    List<PlayerEntity> players = await _playerRepository.getPlayers();
    controller.add(players);

    controller.close();
    return controller.stream;
  }
}
