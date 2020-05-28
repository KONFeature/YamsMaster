import 'package:objectbox/objectbox.dart';

@Entity()
class PlayerDataEntity {
  @Id()
  int id;

  String name;

  PlayerDataEntity({this.id, this.name}); // empty default constructor needed but it can have optional args

  toString() => "PlayerDataEntity{id: $id, text: $name}";
}