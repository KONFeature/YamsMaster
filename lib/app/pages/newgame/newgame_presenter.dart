import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:get_it/get_it.dart';
import 'package:yamsmaster/domains/entities/game_entity.dart';
import 'package:yamsmaster/domains/entities/player_entity.dart';
import 'package:yamsmaster/domains/usecases/add_player_use_case.dart';
import 'package:yamsmaster/domains/usecases/get_players_use_case.dart';
import 'package:yamsmaster/domains/usecases/start_game_use_case.dart';

class NewGamePresenter extends Presenter {
  /// Callback when the players fetching ended.
  Function getPLayersOnFinish;
  /// Callback when the start game.
  Function startGameOnFinish;

  /// List all the players use case.
  final GetPlayersUseCase _getPlayersUseCase = GetIt.I.get();

  /// Add a new player use case.
  final AddPlayerUseCase _addPlayerUseCase = GetIt.I.get();

  /// Create new game use case.
  final StartGameUseCase _startGameUseCase = GetIt.I.get();

  @override
  void dispose() {
    _getPlayersUseCase.dispose();
    _addPlayerUseCase.dispose();
    _startGameUseCase.dispose();
  }

  /// List all the player
  void getPlayers() {
    _getPlayersUseCase.execute(_GetPlayersPresenter(this));
  }

  /// Add a new player
  void addPlayer(String name) {
    _addPlayerUseCase.execute(_AddPlayerPresenter(this), name);
  }

  /// Start the new game
  void startGame(List<PlayerEntity> players) {
    print("Executing game creation for players $players");
    _startGameUseCase.execute(_StartGamePresenter(this), players);
  }
}

class _GetPlayersPresenter implements Observer<List<PlayerEntity>> {
  NewGamePresenter _newgamePresenter;

  _GetPlayersPresenter(this._newgamePresenter);

  @override
  void onComplete() {
    print("Complete the players fetching");
  }

  @override
  void onError(e) {
    print("Error when fetching players : $e");
  }

  @override
  void onNext(List<PlayerEntity> e) {
    // send the data
    assert(_newgamePresenter.getPLayersOnFinish != null);
    _newgamePresenter.getPLayersOnFinish(e);
  }
}

class _AddPlayerPresenter implements Observer<void> {
  NewGamePresenter _newgamePresenter;

  _AddPlayerPresenter(this._newgamePresenter);

  @override
  void onComplete() {
    print("Completed the player creation");
    _newgamePresenter.getPlayers();
  }

  @override
  void onError(e) {
    print("Error when adding a player : $e");
  }

  @override
  void onNext(_) {}
}

class _StartGamePresenter implements Observer<GameEntity> {
  NewGamePresenter _newgamePresenter;

  _StartGamePresenter(this._newgamePresenter);

  @override
  void onComplete() {
    print("Completed the game creation");
  }

  @override
  void onError(e) {
    print("Error when creating the new game : $e");
  }

  @override
  void onNext(GameEntity newGame) {
    _newgamePresenter.startGameOnFinish(newGame);
  }
}
