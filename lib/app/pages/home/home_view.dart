import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:yamsmaster/app/pages/pages.dart';
import 'package:yamsmaster/app/utils/constants.dart';

import 'home_controller.dart';

class HomePage extends View {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  HomePageView createState() => HomePageView();
}

class HomePageView extends ViewState<HomePage, HomeController> {
  HomePageView() : super(HomeController());

  @override
  Widget buildPage() {
    return Scaffold(
      key: globalKey,
      body: body,
    );
  }

  // Scaffold body
  Widget get body => SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Yam's Master",
            style: UIConstants.titleStyle(context),
          ),
          Column(
            children: <Widget>[
              newGameButton,
              ButtonBar(
                  alignment: MainAxisAlignment.spaceEvenly,
                  overflowDirection: VerticalDirection.down,
                  children: [prevGamesButton, currentGameButton]),
            ],
          )
        ],
      ));

  MaterialButton get prevGamesButton => RaisedButton(
        onPressed: null,
        padding: UIConstants.mediumPadding,
    child: const Text('Previous games', style: UIConstants.buttonStyle),
      );

  MaterialButton get currentGameButton => RaisedButton(
        onPressed: null,
        padding: UIConstants.mediumPadding,
        child: const Text('Current game', style: UIConstants.buttonStyle),
      );

  MaterialButton get newGameButton => RaisedButton(
        onPressed: () {
          controller.navigate(Pages.newGame, context);
        },
        padding: UIConstants.mediumPadding,
        child: const Text('New game', style: UIConstants.buttonStyle),
      );
}
