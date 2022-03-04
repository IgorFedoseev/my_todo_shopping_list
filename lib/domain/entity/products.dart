abstract class Measure {
  static const piece = 'шт.';
  static const kilo = 'кг.';
  static const gram = 'гр.';
  static const bottles = 'бут.';
  static const liters = 'л.';
}

class Products {
  final String label;
  final int quantity;
  String measure;

  Products({this.label = 'банан', this.quantity = 1, this.measure = Measure.piece});
}
