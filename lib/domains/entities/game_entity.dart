import 'package:yamsmaster/domains/entities/player_score_entity.dart';

class GameEntity {
  int id;
  List<PlayerScoreEntity> playerScores;
  bool ended;

  GameEntity({this.id, this.playerScores, this.ended});

  @override
  String toString() {
    return 'GameEntity{id: $id, playerScores: $playerScores, ended: $ended}';
  }
}
