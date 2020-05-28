class ScoreEntity {
  int id;

  int one;
  int two;
  int three;
  int four;
  int five;
  int six;

  int less;
  int more;

  int brelan;
  int smallSuite;
  int bigSuite;
  int square;
  int yams;

  ScoreEntity(
      {this.id,
      this.one,
      this.two,
      this.three,
      this.four,
      this.five,
      this.six,
      this.less,
      this.more,
      this.brelan,
      this.smallSuite,
      this.bigSuite,
      this.square,
      this.yams}); // empty default constructor needed but it can have optional args

  @override
  String toString() {
    return 'ScoreEntity{id: $id, one: $one, two: $two, three: $three, four: $four, five: $five, six: $six, less: $less, more: $more, brelan: $brelan, smallSuite: $smallSuite, bigSuite: $bigSuite, square: $square, yams: $yams}';
  }
}
