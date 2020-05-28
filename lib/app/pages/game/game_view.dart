import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:yamsmaster/domains/entities/player_entity.dart';
import 'package:yamsmaster/domains/entities/player_score_entity.dart';

import 'game_controller.dart';

class GamePage extends View {
  /// Id of the game of this view;
  final int gameId;

  GamePage({Key key, @required this.gameId, this.title}) : super(key: key);

  final String title;

  @override
  GamePageView createState() => GamePageView(gameId);
}

class GamePageView extends ViewState<GamePage, GameController>
    with SingleTickerProviderStateMixin {
  GamePageView(gameId) : super(GameController(gameId));

  @override
  Widget buildPage() {
    return Scaffold(
        key: globalKey,
        body: body,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.scorePageIndex,
          items: getMenuItems(controller.playersScores),
          onTap: (index) => controller.pageChanged(index, true),
        ));
  }

  /// Get all the item for the bottom bar.
  List<BottomNavigationBarItem> getMenuItems(
          List<PlayerScoreEntity> playerScores) =>
      playerScores
          .map((playerScore) => BottomNavigationBarItem(
                title: Text(playerScore.player.name),
        icon: Icon(Icons.account_circle),
              ))
          .toList();

  // Scaffold body.
  Widget get body => SafeArea(
        child: PageView(
          controller: controller.scorePagesController,
          children: getScorePages(controller.playersScores),
          onPageChanged: (index) => controller.pageChanged(index, false),
        ),
      );

  /// Get all the scores pages.
  List<Widget> getScorePages(List<PlayerScoreEntity> playerScores) =>
      playerScores
          .map((playerScore) => Text("Player name ${playerScore.player.name}"))
          .toList();
}
