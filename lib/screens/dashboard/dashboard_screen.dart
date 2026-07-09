import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/bottom_nav.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Good morning', style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 4),
              Text('BizBook overview', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.15,
                children: const [
                  StatCard(title: 'Sales', value: '₹42K', icon: Icons.receipt_long, color: Color(0xFF2563EB)),
                  StatCard(title: 'Purchases', value: '₹18K', icon: Icons.shopping_cart, color: Color(0xFF16A34A)),
                  StatCard(title: 'Stock', value: '128', icon: Icons.inventory_2, color: Color(0xFFF59E0B)),
                  StatCard(title: 'Dues', value: '₹7.2K', icon: Icons.account_balance_wallet, color: Color(0xFFDC2626)),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(child: ShortcutButton(title: 'Products', icon: Icons.inventory_2, route: AppConstants.productsRoute)),
                  const SizedBox(width: 12),
                  Expanded(child: ShortcutButton(title: 'Customers', icon: Icons.people, route: AppConstants.customersRoute)),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: ShortcutButton(title: 'Sales', icon: Icons.receipt_long, route: AppConstants.salesRoute)),
                  const SizedBox(width: 12),
                  Expanded(child: ShortcutButton(title: 'Reports', icon: Icons.bar_chart, route: AppConstants.reportsRoute)),
                ],
              ),
              const SizedBox(height: 20),
              Text('Recent activity', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                separatorBuilder: (_, _) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final items = [
                    'New product added: Wireless Mouse',
                    'Payment received from Modern Store',
                    'Stock updated for Office Chair',
                  ];
                  return Card(
                    child: ListTile(
                      leading: const CircleAvatar(child: Icon(Icons.update)),
                      title: Text(items[index]),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(currentIndex: 0, onTap: (index) {
        switch (index) {
          case 1:
            Navigator.pushNamed(context, AppConstants.productsRoute);
            break;
          case 2:
            Navigator.pushNamed(context, AppConstants.customersRoute);
            break;
          case 3:
            Navigator.pushNamed(context, AppConstants.reportsRoute);
            break;
          default:
            Navigator.pushNamed(context, AppConstants.homeRoute);
            break;
        }
      }),
    );
  }
}

class StatCard extends StatelessWidget {
  const StatCard({super.key, required this.title, required this.value, required this.icon, required this.color});

  final String title;
  final String value;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(backgroundColor: color.withValues(alpha: 0.12), child: Icon(icon, color: color)),
            const SizedBox(height: 12),
            Text(title, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 4),
            Text(value, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class ShortcutButton extends StatelessWidget {
  const ShortcutButton({super.key, required this.title, required this.icon, required this.route});

  final String title;
  final IconData icon;
  final String route;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => Navigator.pushNamed(context, route),
      style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
      icon: Icon(icon),
      label: Text(title),
    );
  }
}
