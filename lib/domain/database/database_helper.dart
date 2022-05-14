import 'package:sqlbrite/sqlbrite.dart';
import 'package:synchronized/synchronized.dart';

class DatabaseHelper {
  static const _databaseName = 'ShoppingListAndTasks.db';
  static const _databaseVersion = 1;

  static const shoppingListTable = 'ShoppingList';
  static const tasksTable = 'Tasks';
  static const productId = 'productId';
  static const taskId = 'taskId';

  static late BriteDatabase _streamDatabase;

  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();

  static var lock = Lock();

  static Database? _database;

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    // 
      ''');
  }
}
