
import 'package:yamsmaster/domains/entities/player_entity.dart';
import 'package:yamsmaster/domains/entities/score_entity.dart';

class PlayerScoreEntity {
  int id;
  PlayerEntity player;
  ScoreEntity score;

  PlayerScoreEntity({this.id, this.player, this.score});

  @override
  String toString() {
    return 'PlayerScoreEntity{id: $id, player: $player, score: $score}';
  }
}
