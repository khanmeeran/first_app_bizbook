import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/product.dart';

class ProductProvider extends ChangeNotifier {
  ProductProvider() {
    _loadProducts();
  }

  final List<Product> _products = [];
  final Box _box = Hive.box('products');

  List<Product> get products => List.unmodifiable(_products);

  Future<void> _loadProducts() async {
    final data = _box.values.toList();
    _products
      ..clear()
      ..addAll(data.map((e) => Product.fromMap(Map<String, dynamic>.from(e as Map))));
    notifyListeners();
  }

  Future<void> addProduct(Product product) async {
    await _box.put(product.id, product.toMap());
    _products.add(product);
    notifyListeners();
  }

  Future<void> updateProduct(Product product) async {
    await _box.put(product.id, product.toMap());
    final index = _products.indexWhere((element) => element.id == product.id);
    if (index >= 0) {
      _products[index] = product;
      notifyListeners();
    }
  }

  Future<void> deleteProduct(String id) async {
    await _box.delete(id);
    _products.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
