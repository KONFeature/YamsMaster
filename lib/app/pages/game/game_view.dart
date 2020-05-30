import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:yamsmaster/app/utils/yams_master_icons.dart';
import 'package:yamsmaster/domains/entities/player_score_entity.dart';

import '../../../domains/entities/player_score_entity.dart';
import '../../utils/constants.dart';
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
          items: _getMenuItems(controller.playersScores),
          onTap: (index) => controller.pageChanged(index, true),
        ));
  }

  /// Get all the item for the bottom bar.
  List<BottomNavigationBarItem> _getMenuItems(
          List<PlayerScoreEntity> playerScores) =>
      playerScores
          .map((playerScore) => BottomNavigationBarItem(
              title: Text(playerScore.player.name),
              icon: Icon(Icons.account_circle),
              activeIcon: Icon(YamsMasterIcons.dice)))
          .toList();

  // Scaffold body.
  Widget get body => SafeArea(
        child: PageView(
          controller: controller.scorePagesController,
          children: _getScorePages(controller.playersScores),
          onPageChanged: (index) => controller.pageChanged(index, false),
        ),
      );

  /// Get all the scores pages.
  List<Widget> _getScorePages(List<PlayerScoreEntity> playerScores) =>
      playerScores.map((playerScore) => _buildScorePage(playerScore)).toList();

  /// Build a new score pages
  Widget _buildScorePage(PlayerScoreEntity playerScore) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Card(
              margin: UIConstants.smallPadding,
              child: Column(
                children: [
                  Padding(
                    padding: UIConstants.smallPadding,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "One",
                          icon: Icon(YamsMasterIcons.dice_one)),
                    ),
                  ),
                  Padding(
                    padding: UIConstants.smallPadding,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Two",
                          icon: Icon(YamsMasterIcons.dice_two)),
                    ),
                  ),
                  Padding(
                    padding: UIConstants.smallPadding,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Three",
                          icon: Icon(YamsMasterIcons.dice_three)),
                    ),
                  ),
                  Padding(
                    padding: UIConstants.smallPadding,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Four",
                          icon: Icon(YamsMasterIcons.dice_four)),
                    ),
                  ),
                  Padding(
                    padding: UIConstants.smallPadding,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Five",
                          icon: Icon(YamsMasterIcons.dice_five)),
                    ),
                  ),
                  Padding(
                    padding: UIConstants.smallPadding,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Six",
                          icon: Icon(YamsMasterIcons.dice_six)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Card(
              child: Column(
                children: [],
              ),
            ),
          )
        ],
      );
//Text("Player name ${playerScore.player.name}");
}
