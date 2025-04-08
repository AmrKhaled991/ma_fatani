import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/material.dart';
import 'package:ma_fatani/core/helpers/format_dataTime.dart';
import 'package:ma_fatani/presentation/widgets/SelectDropList.dart';
import 'package:ma_fatani/presentation/widgets/custom_settings_screen_body.dart';

class PrayerTimesScreen extends StatefulWidget {
  const PrayerTimesScreen({super.key});

  @override
  State<PrayerTimesScreen> createState() => _PrayerTimesScreenState();
}

class _PrayerTimesScreenState extends State<PrayerTimesScreen> {
  City city = CitiesData.allCities.first;
  @override
  Widget build(BuildContext context) {
    Coordinates coordinates = Coordinates(city.latitude, city.longitude);

    CalculationParameters params = CalculationMethod.egyptian();
    params.madhab = Madhab.shafi;
    PrayerTimes prayerTimes = PrayerTimes(
        coordinates: coordinates,
        date: DateTime.now(),
        calculationParameters: params,
        precision: true);
    return CustomSettingsScreenBody(
      title: 'Prayer Times',
      child: Column(
        spacing: 20,
        children: [
          const Text(
            'Prayer time configurations...',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            'prayerTimes.fajr => ${getFormattedTime(prayerTimes.fajr)} }',
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            'prayerTimes.sunrise => ${getFormattedTime(prayerTimes.sunrise)}',
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            'prayerTimes.dhuhr => ${getFormattedTime(prayerTimes.dhuhr)}',
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            'prayerTimes.asr => ${getFormattedTime(prayerTimes.asr)}',
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            'prayerTimes.maghrib => ${getFormattedTime(prayerTimes.maghrib)}',
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            'prayerTimes.isha => ${getFormattedTime(prayerTimes.isha)}',
            style: const TextStyle(fontSize: 16),
          ),
          CityDropdown(
            onCitySelected: (value) {
              setState(() {
                city = value;
              });
            },
            selectedCity: CitiesData.allCities.first,
          )

          // Add prayer time controls here
        ],
      ),
    );
  }
}
