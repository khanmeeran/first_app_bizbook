import 'package:flutter/material.dart';
import '../../widgets/app_drawer.dart';

class PurchasesScreen extends StatelessWidget {
  const PurchasesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Purchases')),
      drawer: const AppDrawer(),
      body: const Center(child: Text('Purchase orders and supplier activity will appear here.')),
    );
  }
}
