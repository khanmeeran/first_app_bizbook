import 'package:flutter/material.dart';
import '../../widgets/app_drawer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      drawer: const AppDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(child: ListTile(leading: Icon(Icons.dark_mode), title: Text('Dark mode'), trailing: Icon(Icons.chevron_right))),
          Card(child: ListTile(leading: Icon(Icons.notifications), title: Text('Notifications'), trailing: Icon(Icons.chevron_right))),
          Card(child: ListTile(leading: Icon(Icons.security), title: Text('Privacy'), trailing: Icon(Icons.chevron_right))),
        ],
      ),
    );
  }
}
