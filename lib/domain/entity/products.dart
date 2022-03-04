abstract class Measure {
  static const piece = 'шт.';
  static const kilo = 'кг.';
  static const gram = 'гр.';
  static const bottles = 'бут.';
  static const liters = 'л.';
} // надо ли переделать на энам?

class Products {
  final String label;
  final int quantity;
  String measure;

  Products({this.label = 'бананбананбананбананбананбанан', this.quantity = 1, this.measure = Measure.piece});
}
