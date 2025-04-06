import 'package:flutter/material.dart';
import 'package:ma_fatani/presentation/widgets/custom_settings_screen_body.dart';

class PrayerTimesScreen extends StatelessWidget {
  const PrayerTimesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomSettingsScreenBody(
      title: 'Prayer Times',
      child: Column(
        children: [
          Text(
            'Prayer time configurations...',
            style: TextStyle(fontSize: 16),
          ),
          // Add prayer time controls here
        ],
      ),
    );
  }
}
