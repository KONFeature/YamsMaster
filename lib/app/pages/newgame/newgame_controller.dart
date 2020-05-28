import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:yamsmaster/domains/entities/game_entity.dart';
import 'package:yamsmaster/domains/entities/player_entity.dart';

import '../pages.dart';
import 'newgame_presenter.dart';

class NewGameController extends Controller {
  NewGamePresenter _newGamePresenter;

  /// Map of all the player and a bool telling if they are currently selected or not for the new game.
  Map<PlayerEntity, bool> _selectedPlayers = Map<PlayerEntity, bool>();

  /// List of all the players, visible by the view.
  List<PlayerEntity> get players => _selectedPlayers.keys.toList();

  /// Tell if the start of the game is possible or not, ta activate or not the button.
  bool get isStartGamePossible =>
      _selectedPlayers.values.where((element) => element).length >= 2;

  /// Key for the new player form (in the modal).
  final newPlayerFormKey = GlobalKey<FormState>();

  // The new player name (always in the modal).
  String _newPlayerName;

  /// Init.
  NewGameController() : _newGamePresenter = NewGamePresenter() {
    // Init base object
    _selectedPlayers = Map<PlayerEntity, bool>();
    // Load the players
    _newGamePresenter.getPlayers();
  }

  @override
  void initListeners() {
    // Listener on the players List<dynamic> listName
    _newGamePresenter.getPLayersOnFinish =
        (List<PlayerEntity> receivedPlayers) {
      // Clear the list
      _selectedPlayers.clear();
      // Add all the players
      receivedPlayers.forEach((player) {
        /// Check if we don't have it, and then add it if we don't.
        if (!players.map((e) => e.name).contains(player.name))
          _selectedPlayers[player] = false;
      });
      refreshUI();
    };
    // Listener on the game creation
    _newGamePresenter.startGameOnFinish = (GameEntity gameCreated) {
      navigate(Pages.game, getContext(), gameCreated.id);
    };
  }

  /// Toggle the selection state of a new player.
  void togglePlayerSelectState(PlayerEntity player, bool state) =>
      _selectedPlayers[player] = state;

  /// Validator for the new player form.
  FormFieldValidator<String> get playerNameValidator => (value) {
        if (value.isEmpty)
          return 'Please enter a name';
        else if (value.length < 3)
          return 'Please enter a longer name';
        else
          _newPlayerName = value;

        return null;
      };

  /// Method called to add a new player.
  bool addPlayer() {
    if (newPlayerFormKey.currentState.validate()) {
      _newGamePresenter.addPlayer(_newPlayerName);
      return true;
    }
    return false;
  }

  void startGame() {
    List<PlayerEntity> players = List();
    _selectedPlayers.forEach((player, isSelected) {
      if (isSelected) players.add(player);
    });
    _newGamePresenter.startGame(players);
  }

  @override
  void dispose() {
    _newGamePresenter.dispose();
    super.dispose();
  }

  void navigate(String page, context, gameId) => Navigator.of(context).pushNamed(page, arguments: {
  'gameId': gameId
  });
}
