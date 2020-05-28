import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yamsmaster/app/utils/constants.dart';
import 'package:yamsmaster/domains/entities/player_entity.dart';

class SelectablePlayer extends StatefulWidget {
  final PlayerEntity _player;
  final void Function(bool) _onPlayerSelectionChanged;

  SelectablePlayer(this._player, this._onPlayerSelectionChanged);

  static SelectablePlayer of(BuildContext context) =>
      context.findAncestorStateOfType();

  @override
  State<StatefulWidget> createState() => SelectablePlayerState(_player, _onPlayerSelectionChanged);
}

class SelectablePlayerState extends State<SelectablePlayer>
    with SingleTickerProviderStateMixin {
  PlayerEntity _player;
  void Function(bool) onPlayerSelectionChanged;

  AnimationController _animController;
  Animation _animation;

  bool _selected = false;

  SelectablePlayerState(this._player, this.onPlayerSelectionChanged);

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    _animation = ColorTween(
      begin: Theme.of(context).backgroundColor,
      end: Theme.of(context).primaryColor,
    ).animate(_animController)
      ..addListener(() {
        setState(() {});
      });

    return GestureDetector(
      onTap: () {
        toggleSelect();
      },
      child: Card(
        elevation: 4,
        child: Container(
            padding: UIConstants.mediumPadding,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: _animation.value),
            child: Text(_player.name,
                style: UIConstants.largeTextStyle,
                overflow: TextOverflow.ellipsis)),
      ),
    );
  }

  void toggleSelect() {
    _selected = !_selected;
    if (_selected)
      _animController.forward();
    else
      _animController.reverse();

    onPlayerSelectionChanged(_selected);
  }
}
