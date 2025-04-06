import 'package:flutter/material.dart';
import 'package:ma_fatani/presentation/widgets/custom_settings_screen_body.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomSettingsScreenBody(
      title: 'About Us',
      child: Column(
        children: [
          Text(
            'App Version: 1.0.0',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          Text(
            'Developed by Your Company',
            style: TextStyle(fontSize: 16),
          ),
          // Add about content here
        ],
      ),
    );
  }
}
