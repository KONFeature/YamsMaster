import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:yamsmaster/domains/entities/game_entity.dart';
import 'package:yamsmaster/domains/entities/player_score_entity.dart';

import 'game_presenter.dart';

class GameController extends Controller {
  GamePresenter _gamePresenter;

  /// The game of this view.
  GameEntity game;

  /// List of all the player scores, visible by the view.
  List<PlayerScoreEntity> get playersScores =>
      game?.playerScores?.toList() ?? [];

  /// Init.
  GameController(gameId) : _gamePresenter = GamePresenter(gameId);

  /// PageView controller for all the player.
  PageController scorePagesController =
      PageController(initialPage: 0, keepPage: true);

  /// Index of the current displayed page
  int scorePageIndex = 0;

  @override
  void initListeners() {
    // Listener on the players List<dynamic> listName
    _gamePresenter.getGameOnFinish = (GameEntity game) {
      // Save the object
      this.game = game;
      // Refresh the UI
      refreshUI();
    };
  }

  @override
  void dispose() {
    scorePagesController.dispose();
    _gamePresenter.dispose();
    super.dispose();
  }

  /// Called when the user change his current score page.
  void pageChanged(int newPageIndex, bool needPageViewAnim) {
    // Exit directly if we are on the right page
    if(newPageIndex == scorePageIndex) return;
    // Else perform the page change, with an animations if requested
    scorePageIndex = newPageIndex;
    if (needPageViewAnim)
      scorePagesController.animateToPage(newPageIndex,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    refreshUI();
  }
}
