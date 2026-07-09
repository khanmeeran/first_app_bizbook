import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/customer.dart';

class CustomerProvider extends ChangeNotifier {
  CustomerProvider() {
    _loadCustomers();
  }

  final List<Customer> _customers = [];
  final Box _box = Hive.box('customers');

  List<Customer> get customers => List.unmodifiable(_customers);

  Future<void> _loadCustomers() async {
    final data = _box.values.toList();
    _customers
      ..clear()
      ..addAll(data.map((e) => Customer.fromMap(Map<String, dynamic>.from(e as Map))));
    notifyListeners();
  }

  Future<void> addCustomer(Customer customer) async {
    await _box.put(customer.id, customer.toMap());
    _customers.add(customer);
    notifyListeners();
  }

  Future<void> updateCustomer(Customer customer) async {
    await _box.put(customer.id, customer.toMap());
    final index = _customers.indexWhere((element) => element.id == customer.id);
    if (index >= 0) {
      _customers[index] = customer;
      notifyListeners();
    }
  }

  Future<void> deleteCustomer(String id) async {
    await _box.delete(id);
    _customers.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
