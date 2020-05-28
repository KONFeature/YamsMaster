import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:get_it/get_it.dart';
import 'package:yamsmaster/domains/entities/game_entity.dart';
import 'package:yamsmaster/domains/usecases/get_game_use_case.dart';

class GamePresenter extends Presenter {
  /// The id of the current game.
  int _gameId;

  /// Callback when the game fetching ended.
  Function getGameOnFinish;

  /// List all the players use case.
  final GetGameUseCase _getGameUseCase = GetIt.I.get();

  /// Constructor
  GamePresenter(this._gameId) {
    // Load the game
    _getGameUseCase.execute(_GetGamePresenter(this), _gameId);
  }

  @override
  void dispose() {
    _getGameUseCase.dispose();
  }
}

class _GetGamePresenter implements Observer<GameEntity> {
  GamePresenter _gamePresenter;

  _GetGamePresenter(this._gamePresenter);

  @override
  void onComplete() {
    print("Complete the game fetching");
  }

  @override
  void onError(e) {
    print("Error when fetching game : $e");
  }

  @override
  void onNext(GameEntity e) {
    // send the data
    assert(_gamePresenter.getGameOnFinish != null);
    _gamePresenter.getGameOnFinish(e);
  }
}