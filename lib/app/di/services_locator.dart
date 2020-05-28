import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yamsmaster/data/mapper/game_mapper.dart';
import 'package:yamsmaster/data/mapper/player_mapper.dart';
import 'package:yamsmaster/data/mapper/player_score_mapper.dart';
import 'package:yamsmaster/data/mapper/score_mapper.dart';
import 'package:yamsmaster/data/repositories/game_repository_impl.dart';
import 'package:yamsmaster/data/repositories/player_repository_impl.dart';
import 'package:yamsmaster/data/repositories/player_score_repository_impl.dart';
import 'package:yamsmaster/data/repositories/score_repository_impl.dart';
import 'package:yamsmaster/domains/repositories/game_repository.dart';
import 'package:yamsmaster/domains/repositories/player_repository.dart';
import 'package:yamsmaster/domains/repositories/player_score_repository.dart';
import 'package:yamsmaster/domains/repositories/score_repository.dart';
import 'package:yamsmaster/domains/usecases/add_player_use_case.dart';
import 'package:yamsmaster/domains/usecases/get_game_use_case.dart';
import 'package:yamsmaster/domains/usecases/get_players_use_case.dart';
import 'package:yamsmaster/domains/usecases/start_game_use_case.dart';
import 'package:yamsmaster/objectbox.g.dart';

final GetIt getIt = GetIt.instance;

// Setup all the dependency injection
void setupDI() {
  _setupData();
  _setupRepository();
  _setupMapper();
  _setupUseCases();
}

// Setup our data layer
void _setupData() {
  getIt.registerSingletonAsync<Store>(() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    return Store(getObjectBoxModel(),
        directory: appDirectory.path + "/database");
  });
}

// Setup repository injection
void _setupRepository() {
  getIt.registerLazySingleton<PlayerRepository>(
          () => PlayerRepositoryImpl());
  getIt.registerLazySingleton<ScoreRepository>(
          () => ScoreRepositoryImpl());
  getIt.registerLazySingleton<PlayerScoreRepository>(
          () => PlayerScoreRepositoryImpl());
  getIt.registerLazySingleton<GameRepository>(
          () => GameRepositoryImpl());
}

// Setup mapper injection
void _setupMapper() {
  getIt.registerLazySingleton(() => PlayerMapper());
  getIt.registerLazySingleton(() => ScoreMapper());
  getIt.registerLazySingleton(() => PlayerScoreMapper());
  getIt.registerLazySingleton(() => GameMapper());
}

// Setup all the use cases
void _setupUseCases() {
  // Players use cases
  getIt.registerLazySingleton(() => GetPlayersUseCase());
  getIt.registerLazySingleton(() => AddPlayerUseCase());
  getIt.registerLazySingleton(() => StartGameUseCase());
  getIt.registerLazySingleton(() => GetGameUseCase());
}
