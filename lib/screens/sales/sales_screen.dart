import 'package:flutter/material.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/bottom_nav.dart';

class SalesScreen extends StatelessWidget {
  const SalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sales')),
      drawer: const AppDrawer(),
      body: const Center(child: Text('Sales tracking and invoices will appear here.')),
      bottomNavigationBar: BottomNav(currentIndex: 0, onTap: (index) {
        if (index == 0) {
          Navigator.pushReplacementNamed(context, '/home');
        }
      }),
    );
  }
}
