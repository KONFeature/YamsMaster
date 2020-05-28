import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:get_it/get_it.dart';
import 'package:yamsmaster/domains/repositories/player_repository.dart';

class AddPlayerUseCase extends CompletableUseCase<String> {
  final PlayerRepository _playerRepository = GetIt.I.get();

  @override
  Future<Stream<void>> buildUseCaseStream(String playerName) async {
    final StreamController<void> controller = StreamController();

    await _playerRepository.addPlayer(playerName);

    controller.close();
    return controller.stream;
  }
}
