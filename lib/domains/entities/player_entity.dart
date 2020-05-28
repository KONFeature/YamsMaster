class PlayerEntity {
  int id;
  String name;

  PlayerEntity({this.id, this.name});

  @override
  String toString() {
    return 'PlayerEntity{id: $id, name: $name}';
  }
}
