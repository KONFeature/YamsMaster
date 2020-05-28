abstract class Mapper<From, To> {
  // Map an from an other to the desired format.
  Future<To> to(From from);

  // Map an object from the disired format to the other.
  Future<From> from(To to);

  Future<List<To>> toList(List<From> froms) async {
    List<To> tos = List();
    for (From from in froms) {
      tos.add(await to(from));
    }
    return tos;
  }

  Future<List<From>> fromList(List<To> tos) async {
    List<From> froms = List();
    for (To to in tos) {
      froms.add(await from(to));
    }
    return froms;
  }
}
