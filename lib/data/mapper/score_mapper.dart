import 'package:yamsmaster/data/entities/score_data_entity.dart';
import 'package:yamsmaster/domains/entities/score_entity.dart';

import 'mapper.dart';

class ScoreMapper extends Mapper<ScoreEntity, ScoreDataEntity> {
  @override
  Future<ScoreEntity> from(ScoreDataEntity to) async => ScoreEntity(
      id: to.id,
      one: to.one,
      two: to.two,
      three: to.three,
      four: to.four,
      five: to.five,
      six: to.six,
      less: to.less,
      more: to.more,
      brelan: to.brelan,
      smallSuite: to.smallSuite,
      bigSuite: to.bigSuite,
      square: to.square,
      yams: to.yams);

  @override
  Future<ScoreDataEntity> to(ScoreEntity from) async => ScoreDataEntity(
      id: from.id,
      one: from.one,
      two: from.two,
      three: from.three,
      four: from.four,
      five: from.five,
      six: from.six,
      less: from.less,
      more: from.more,
      brelan: from.brelan,
      smallSuite: from.smallSuite,
      bigSuite: from.bigSuite,
      square: from.square,
      yams: from.yams);
}
