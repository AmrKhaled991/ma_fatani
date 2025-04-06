import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ma_fatani/app/router.dart';

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
            context.push(AppRouter.indicativeOpinions);
          },
        ),
        ListTile(
          leading: const Icon(Icons.access_time),
          title: const Text('مواقيت الصلاة'),
          onTap: () {
            context.push(AppRouter.prayerTimes);
          },
        ),
        ListTile(
          leading: const Icon(Icons.language),
          title: const Text('اللغة'),
          onTap: () {
            context.push(AppRouter.language);
          },
        ),
        ListTile(
          leading: const Icon(Icons.info),
          title: const Text('عن التطبيق'),
          onTap: () {
            context.push(AppRouter.aboutUs);
          },
        ),
      ],
    );
  }
}
