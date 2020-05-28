import 'package:get_it/get_it.dart';
import 'package:objectbox/objectbox.dart';
import 'package:yamsmaster/data/entities/player_data_entity.dart';
import 'package:yamsmaster/data/mapper/player_mapper.dart';
import 'package:yamsmaster/domains/entities/player_entity.dart';
import 'package:yamsmaster/domains/repositories/player_repository.dart';

class PlayerRepositoryImpl implements PlayerRepository {
  final Box<PlayerDataEntity> _playerBox = Box(GetIt.I.get<Store>());
  final PlayerMapper _mapper = GetIt.I.get();

  @override
  Future<PlayerEntity> fromId(int id) async =>
      _mapper.from(_playerBox.get(id));

  @override
  Future<List<PlayerEntity>> getPlayers() async {
    return _playerBox
        .getAll()
        .map((playerData) =>
            PlayerEntity(id: playerData.id, name: playerData.name))
        .toList();
  }

  @override
  Future<void> addPlayer(String playerName) async {
    _playerBox.put(PlayerDataEntity(name: playerName));
  }
}
