import 'package:flutter/material.dart';
import '../../widgets/app_drawer.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payments')),
      drawer: const AppDrawer(),
      body: const Center(child: Text('Customer and supplier payment tracking will appear here.')),
    );
  }
}
