import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.feedback),
          title: const Text('آراء دالة'),
          onTap: () {
            // Handle feedback tap
          },
        ),
        ListTile(
          leading: const Icon(Icons.access_time),
          title: const Text('مواقيت الصلاة'),
          onTap: () {
            // Handle prayer times tap
          },
        ),
        ListTile(
          leading: const Icon(Icons.language),
          title: const Text('اللغة'),
          onTap: () {
            // Handle language tap
          },
        ),
        ListTile(
          leading: const Icon(Icons.info),
          title: const Text('عن التطبيق'),
          onTap: () {
            // Handle about tap
          },
        ),
      ],
    );
  }
}
