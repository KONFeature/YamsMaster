
import 'package:yamsmaster/data/entities/player_data_entity.dart';
import 'package:yamsmaster/domains/entities/player_entity.dart';
import 'mapper.dart';

class PlayerMapper extends Mapper<PlayerEntity, PlayerDataEntity> {

  @override
  Future<PlayerEntity> from(PlayerDataEntity to) async =>
      PlayerEntity(id: to.id, name: to.name);

  @override
  Future<PlayerDataEntity> to(PlayerEntity from) async =>
      PlayerDataEntity(id: from.id, name: from.name);

}