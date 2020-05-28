// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:objectbox/objectbox.dart';
export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file
import 'data/entities/score_data_entity.dart';
import 'data/entities/player_score_data_entity.dart';
import 'data/entities/game_data_entity.dart';
import 'data/entities/player_data_entity.dart';

ModelDefinition getObjectBoxModel() {
  final model = ModelInfo.fromMap({
    "entities": [
      {
        "id": "1:3845372014238200052",
        "lastPropertyId": "2:8138020731242608149",
        "name": "GameDataEntity",
        "properties": [
          {"id": "1:5338163677717741564", "name": "id", "type": 6, "flags": 1},
          {"id": "2:8138020731242608149", "name": "ended", "type": 1}
        ]
      },
      {
        "id": "2:453925758108354726",
        "lastPropertyId": "2:4378331516777437655",
        "name": "PlayerDataEntity",
        "properties": [
          {"id": "1:3201257791862061531", "name": "id", "type": 6, "flags": 1},
          {"id": "2:4378331516777437655", "name": "name", "type": 9}
        ]
      },
      {
        "id": "3:4073355140197666811",
        "lastPropertyId": "4:3998184999420041632",
        "name": "PlayerScoreDataEntity",
        "properties": [
          {"id": "1:9220986911615395954", "name": "id", "type": 6, "flags": 1},
          {"id": "2:9221748700399110", "name": "playerId", "type": 6},
          {"id": "3:655119892951325476", "name": "scoreId", "type": 6},
          {"id": "4:3998184999420041632", "name": "gameId", "type": 6}
        ]
      },
      {
        "id": "4:5144850029329589273",
        "lastPropertyId": "14:8463352577447594035",
        "name": "ScoreDataEntity",
        "properties": [
          {"id": "1:8490390274471997558", "name": "id", "type": 6, "flags": 1},
          {"id": "2:8975856314172553545", "name": "one", "type": 6},
          {"id": "3:8754264521239405485", "name": "two", "type": 6},
          {"id": "4:3791327398655538659", "name": "three", "type": 6},
          {"id": "5:136589865208173024", "name": "four", "type": 6},
          {"id": "6:1617590417158867254", "name": "five", "type": 6},
          {"id": "7:5850930224739044883", "name": "six", "type": 6},
          {"id": "8:5864907429327986872", "name": "less", "type": 6},
          {"id": "9:3071260675876101510", "name": "more", "type": 6},
          {"id": "10:1289818255600445570", "name": "brelan", "type": 6},
          {"id": "11:3207978402235814003", "name": "smallSuite", "type": 6},
          {"id": "12:3654289630383075248", "name": "bigSuite", "type": 6},
          {"id": "13:2711724182446002529", "name": "square", "type": 6},
          {"id": "14:8463352577447594035", "name": "yams", "type": 6}
        ]
      }
    ],
    "lastEntityId": "4:5144850029329589273",
    "lastIndexId": "0:0",
    "lastRelationId": "0:0",
    "lastSequenceId": "0:0",
    "modelVersion": 5
  }, check: false);

  final bindings = Map<Type, EntityDefinition>();
  bindings[GameDataEntity] = EntityDefinition<GameDataEntity>(
      model: model.findEntityByUid(3845372014238200052),
      reader: (GameDataEntity inst) => {"id": inst.id, "ended": inst.ended},
      writer: (Map<String, dynamic> members) {
        GameDataEntity r = GameDataEntity();
        r.id = members["id"];
        r.ended = members["ended"];
        return r;
      });
  bindings[PlayerDataEntity] = EntityDefinition<PlayerDataEntity>(
      model: model.findEntityByUid(453925758108354726),
      reader: (PlayerDataEntity inst) => {"id": inst.id, "name": inst.name},
      writer: (Map<String, dynamic> members) {
        PlayerDataEntity r = PlayerDataEntity();
        r.id = members["id"];
        r.name = members["name"];
        return r;
      });
  bindings[PlayerScoreDataEntity] = EntityDefinition<PlayerScoreDataEntity>(
      model: model.findEntityByUid(4073355140197666811),
      reader: (PlayerScoreDataEntity inst) => {
            "id": inst.id,
            "playerId": inst.playerId,
            "scoreId": inst.scoreId,
            "gameId": inst.gameId
          },
      writer: (Map<String, dynamic> members) {
        PlayerScoreDataEntity r = PlayerScoreDataEntity();
        r.id = members["id"];
        r.playerId = members["playerId"];
        r.scoreId = members["scoreId"];
        r.gameId = members["gameId"];
        return r;
      });
  bindings[ScoreDataEntity] = EntityDefinition<ScoreDataEntity>(
      model: model.findEntityByUid(5144850029329589273),
      reader: (ScoreDataEntity inst) => {
            "id": inst.id,
            "one": inst.one,
            "two": inst.two,
            "three": inst.three,
            "four": inst.four,
            "five": inst.five,
            "six": inst.six,
            "less": inst.less,
            "more": inst.more,
            "brelan": inst.brelan,
            "smallSuite": inst.smallSuite,
            "bigSuite": inst.bigSuite,
            "square": inst.square,
            "yams": inst.yams
          },
      writer: (Map<String, dynamic> members) {
        ScoreDataEntity r = ScoreDataEntity();
        r.id = members["id"];
        r.one = members["one"];
        r.two = members["two"];
        r.three = members["three"];
        r.four = members["four"];
        r.five = members["five"];
        r.six = members["six"];
        r.less = members["less"];
        r.more = members["more"];
        r.brelan = members["brelan"];
        r.smallSuite = members["smallSuite"];
        r.bigSuite = members["bigSuite"];
        r.square = members["square"];
        r.yams = members["yams"];
        return r;
      });

  return ModelDefinition(model, bindings);
}

class GameDataEntity_ {
  static final id =
      QueryIntegerProperty(entityId: 1, propertyId: 1, obxType: 6);
  static final ended =
      QueryBooleanProperty(entityId: 1, propertyId: 2, obxType: 1);
}

class PlayerDataEntity_ {
  static final id =
      QueryIntegerProperty(entityId: 2, propertyId: 1, obxType: 6);
  static final name =
      QueryStringProperty(entityId: 2, propertyId: 2, obxType: 9);
}

class PlayerScoreDataEntity_ {
  static final id =
      QueryIntegerProperty(entityId: 3, propertyId: 1, obxType: 6);
  static final playerId =
      QueryIntegerProperty(entityId: 3, propertyId: 2, obxType: 6);
  static final scoreId =
      QueryIntegerProperty(entityId: 3, propertyId: 3, obxType: 6);
  static final gameId =
      QueryIntegerProperty(entityId: 3, propertyId: 4, obxType: 6);
}

class ScoreDataEntity_ {
  static final id =
      QueryIntegerProperty(entityId: 4, propertyId: 1, obxType: 6);
  static final one =
      QueryIntegerProperty(entityId: 4, propertyId: 2, obxType: 6);
  static final two =
      QueryIntegerProperty(entityId: 4, propertyId: 3, obxType: 6);
  static final three =
      QueryIntegerProperty(entityId: 4, propertyId: 4, obxType: 6);
  static final four =
      QueryIntegerProperty(entityId: 4, propertyId: 5, obxType: 6);
  static final five =
      QueryIntegerProperty(entityId: 4, propertyId: 6, obxType: 6);
  static final six =
      QueryIntegerProperty(entityId: 4, propertyId: 7, obxType: 6);
  static final less =
      QueryIntegerProperty(entityId: 4, propertyId: 8, obxType: 6);
  static final more =
      QueryIntegerProperty(entityId: 4, propertyId: 9, obxType: 6);
  static final brelan =
      QueryIntegerProperty(entityId: 4, propertyId: 10, obxType: 6);
  static final smallSuite =
      QueryIntegerProperty(entityId: 4, propertyId: 11, obxType: 6);
  static final bigSuite =
      QueryIntegerProperty(entityId: 4, propertyId: 12, obxType: 6);
  static final square =
      QueryIntegerProperty(entityId: 4, propertyId: 13, obxType: 6);
  static final yams =
      QueryIntegerProperty(entityId: 4, propertyId: 14, obxType: 6);
}
