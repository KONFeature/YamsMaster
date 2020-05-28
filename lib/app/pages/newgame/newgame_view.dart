import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:yamsmaster/app/pages/newgame/selectable_player_widget.dart';
import 'package:yamsmaster/app/utils/constants.dart';
import 'package:yamsmaster/domains/entities/player_entity.dart';

import 'newgame_controller.dart';

class NewGamePage extends View {
  NewGamePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  NewGamePageView createState() => NewGamePageView();
}

class NewGamePageView extends ViewState<NewGamePage, NewGameController>
    with SingleTickerProviderStateMixin {
  NewGamePageView() : super(NewGameController());

  @override
  Widget buildPage() {
    return Scaffold(key: globalKey, body: body);
  }

  // Scaffold body
  Widget get body => SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: UIConstants.largeVPadding,
              child: Text(
                "New game",
                style: UIConstants.titleStyle(context),
              ),
            ),
            Text(
              "Players",
              style: UIConstants.mainInfosStyle(context),
            ),
            Expanded(
                child: controller.players.isNotEmpty
                    ? _playersCards
                    : Text("No players", textAlign: TextAlign.center)),
            ButtonBar(
                alignment: MainAxisAlignment.spaceEvenly,
                children: [newPlayerButton, startGameButton]),
          ],
        ),
      );

  MaterialButton get newPlayerButton => FlatButton(
        onPressed: () => _showNewPlayerModal(),
        padding: UIConstants.mediumPadding,
        child: const Text('New player', style: UIConstants.buttonStyle),
      );

  MaterialButton get startGameButton => RaisedButton(
        onPressed: controller.isStartGamePossible ? () => controller.startGame() : null,
        padding: UIConstants.mediumPadding,
        child: const Text('Start game', style: UIConstants.buttonStyle),
      );

  Widget get _playersCards =>
      OrientationBuilder(builder: (context, orientation) {
        return StaggeredGridView.count(
          crossAxisCount: orientation == Orientation.landscape ? 6 : 4,
          scrollDirection: Axis.vertical,
          padding: UIConstants.mediumPadding,
          children: controller.players
              .map<Widget>((player) => _buildPlayerCard(player))
              .toList(),
          staggeredTiles: controller.players
              .map<StaggeredTile>((_) => StaggeredTile.fit(2))
              .toList(),
        );
      });

  Widget _buildPlayerCard(PlayerEntity player) {
    return SelectablePlayer(player, (bool state) {
      controller.togglePlayerSelectState(player, state);
      setState(() {});
    });
  }

  void _showNewPlayerModal() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext bc) {
          return Container(
              padding: UIConstants.mediumPadding,
              child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Form(
                    key: controller.newPlayerFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextFormField(
                          autofocus: true,
                          validator: controller.playerNameValidator,
                          decoration: InputDecoration(
                              labelText: "Player name", hintText: "Paul"),
                        ),
                        Padding(
                          padding: UIConstants.mediumPadding,
                          child: RaisedButton(
                            onPressed: () {
                              if (controller.addPlayer())
                                Navigator.pop(bc);
                            },
                            padding: UIConstants.mediumPadding,
                            child: const Text('Add player',
                                style: UIConstants.buttonStyle),
                          ),
                        )
                      ],
                    ),
                  )));
        });
  }
}
