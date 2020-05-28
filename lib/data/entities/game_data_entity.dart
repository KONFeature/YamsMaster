import 'package:objectbox/objectbox.dart';

@Entity()
class GameDataEntity {
  @Id()
  int id;

  bool ended;

  GameDataEntity({this.id, this.ended});

  @override
  String toString() {
    return 'GameDataEntity{id: $id, ended: $ended}';
  }
}
