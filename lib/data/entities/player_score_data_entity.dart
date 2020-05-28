import 'package:objectbox/objectbox.dart';

@Entity()
class PlayerScoreDataEntity {
  @Id()
  int id;

  int gameId;

  int playerId;

  int scoreId;

  PlayerScoreDataEntity({this.id, this.gameId, this.playerId, this.scoreId});

  @override
  String toString() {
    return 'PlayerScoreDataEntity{id: $id, gameId: $gameId, playerId: $playerId, scoreId: $scoreId}';
  }
}
