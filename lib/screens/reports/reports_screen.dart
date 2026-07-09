import 'package:flutter/material.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/bottom_nav.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reports')),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: const [
            _ReportCard(title: 'Daily Sales', value: '₹12,500'),
            _ReportCard(title: 'Weekly Sales', value: '₹84,300'),
            _ReportCard(title: 'Monthly Sales', value: '₹320,000'),
            _ReportCard(title: 'Low Stock', value: '6 products'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(currentIndex: 3, onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/home');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/products');
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/customers');
            break;
        }
      }),
    );
  }
}

class _ReportCard extends StatelessWidget {
  const _ReportCard({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: Text(value, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
