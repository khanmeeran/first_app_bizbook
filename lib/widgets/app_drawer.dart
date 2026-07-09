import 'package:flutter/material.dart';
import '../core/constants/app_constants.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const ListTile(
              leading: CircleAvatar(
                radius: 24,
                backgroundColor: Color(0xFF2563EB),
                child: Icon(Icons.business, color: Colors.white),
              ),
              title: Text('BizBook'),
              subtitle: Text('Business management'),
            ),
            const Divider(),
            _DrawerItem(icon: Icons.dashboard, title: 'Dashboard', route: AppConstants.homeRoute),
            _DrawerItem(icon: Icons.inventory_2, title: 'Products', route: AppConstants.productsRoute),
            _DrawerItem(icon: Icons.people, title: 'Customers', route: AppConstants.customersRoute),
            _DrawerItem(icon: Icons.receipt_long, title: 'Sales', route: AppConstants.salesRoute),
            _DrawerItem(icon: Icons.shopping_cart, title: 'Purchases', route: AppConstants.purchasesRoute),
            _DrawerItem(icon: Icons.payments, title: 'Payments', route: AppConstants.paymentsRoute),
            _DrawerItem(icon: Icons.bar_chart, title: 'Reports', route: AppConstants.reportsRoute),
            _DrawerItem(icon: Icons.settings, title: 'Settings', route: AppConstants.settingsRoute),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  const _DrawerItem({required this.icon, required this.title, required this.route});

  final IconData icon;
  final String title;
  final String route;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }
}
