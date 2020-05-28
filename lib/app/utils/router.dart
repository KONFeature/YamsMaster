import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yamsmaster/app/pages/game/game_view.dart';
import 'package:yamsmaster/app/pages/newgame/newgame_view.dart';
import 'package:yamsmaster/app/pages/pages.dart';

class Router {
  final RouteObserver<PageRoute> routeObserver;

  Router() : routeObserver = RouteObserver<PageRoute>();

  Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Pages.home:
        return _buildRoute(settings, HomePage());
      case Pages.newGame:
        return _buildRoute(settings, NewGamePage());
      case Pages.game:
        Map<String, dynamic> args = settings.arguments as Map;
        return _buildRoute(settings, GamePage(gameId: args['gameId']));
      default:
        return null;
    }
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return new MaterialPageRoute(
      settings: settings,
      builder: (ctx) => builder,
    );
  }
}
