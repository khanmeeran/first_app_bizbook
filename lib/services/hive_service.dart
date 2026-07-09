import 'package:hive/hive.dart';

class HiveService {
  static Future<void> initialize() async {
    await Hive.openBox('products');
    await Hive.openBox('customers');
    await Hive.openBox('suppliers');
    await Hive.openBox('sales');
    await Hive.openBox('purchases');
    await Hive.openBox('payments');
  }

  static Box getBox(String name) => Hive.box(name);
}
