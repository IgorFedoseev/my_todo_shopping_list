abstract class Measure {
  static const piece = 'шт.';
  static const kilo = 'кг.';
  static const gram = 'гр.';
  static const bottles = 'бут.';
  static const liters = 'л.';
} // надо ли переделать на энам?

class Product {
  final String name;
  final int quantity;
  String measure;

  Product(
      {this.name = 'бананбананбананбананбананбанан',
      this.quantity = 1,
      this.measure = Measure.piece});
}
