
import 'package:flutter/material.dart';
import 'package:ma_fatani/presentation/widgets/custom_settings_screen_body.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomSettingsScreenBody(
      title: 'Language',
      child: Column(
        children: [
          Text('Language selection...',
            style: TextStyle(fontSize: 16),
          ),
          // Add language selector here
        ],
      ),
    );
  }
}