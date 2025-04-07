import 'dart:convert';

import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ma_fatani/main.dart';
import 'package:ma_fatani/presentation/widgets/custom_settings_screen_body.dart';
import 'package:http/http.dart' as http;

class PrayerTimesScreen extends StatefulWidget {
  const PrayerTimesScreen({super.key});

  @override
  State<PrayerTimesScreen> createState() => _PrayerTimesScreenState();
}

class _PrayerTimesScreenState extends State<PrayerTimesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getPrayerTimesFromApi();
  }

  Future<void> getPrayerTimesFromApi() async {
    final url = Uri.parse(
      'https://api.aladhan.com/v1/timings?latitude=${position!.latitude}&longitude=${position!.longitude}&method=4',
    );

    final res = await http.get(url);
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      final timings = data['data']['timings'];
      print("SS--Fajr: ${timings['Fajr']}");
      print("SS--Dhuhr: ${timings['Dhuhr']}");
      print("SS--Asr: ${timings['Asr']}");
      print("SS--Maghrib: ${timings['Maghrib']}");
      print("SS--Isha: ${timings['Isha']}");
    } else {
      print("Error fetching prayer times");
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomSettingsScreenBody(
      title: 'Prayer Times',
      child: Column(
        spacing: 20,
        children: [
          const Text(
            'Prayer time configurations...',
            style: TextStyle(fontSize: 16),
          ),

          // Add prayer time controls here
        ],
      ),
    );
  }
}
