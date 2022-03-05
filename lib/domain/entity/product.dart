abstract class Measure {
  static const piece = 'шт.';
  static const kilo = 'кг.';
  static const gram = 'гр.';
  static const bottles = 'бут.';
  static const liters = 'л.';
  static const pack = 'уп.';
} // надо ли переделать на энам?

class Product {
  final String name;
  final int quantity;
  String measure;

  Product(
      {this.name = 'банан',
      this.quantity = 4,
      this.measure = Measure.piece});

  static List<Product> examples = [
    Product(
      name: 'Spaghetti and Meatballs',
      quantity: 3,
      measure: Measure.piece,
    ),
    Product(
        name: 'Tomato Soup',
        quantity: 1,
        measure: Measure.pack,
    ),
    Product(
      name: 'Grilled Cheese',
      quantity: 300,
      measure: Measure.gram,
    ),
    Product(
      name: 'Grilled Cheese',
      quantity: 300,
      measure: Measure.gram,
    ),
    Product(
      name: 'Taco Salad',
      quantity: 500,
      measure: Measure.gram,
    ),
    Product(
      name: 'Hawaiian Pizza',
      quantity: 1,
      measure: Measure.kilo,
    ),
    Product(
      name: 'Spaghetti and Meatballs',
      quantity: 3,
      measure: Measure.piece,
    ),
    Product(
      name: 'Tomato Soup',
      quantity: 1,
      measure: Measure.pack,
    ),
    Product(
      name: 'Grilled Cheese',
      quantity: 300,
      measure: Measure.gram,
    ),
    Product(
      name: 'Grilled Cheese',
      quantity: 300,
      measure: Measure.gram,
    ),
    Product(
      name: 'Taco Salad',
      quantity: 500,
      measure: Measure.gram,
    ),
    Product(
      name: 'Hawaiian Pizza',
      quantity: 1,
      measure: Measure.kilo,
    ),
  ];
}
