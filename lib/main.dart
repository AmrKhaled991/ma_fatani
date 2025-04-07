
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app/app.dart';
import 'package:geolocator/geolocator.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 Future.wait([
    getCurrentLocation().then((po) => position = po),
  ]);

  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const MyApp());
}
Position? position=null;
Future<Position?> getCurrentLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Check if location services are enabled
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    print('Location services are disabled.');
    return null;
  }

  // Request permissions
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      print('Location permissions are denied');
      return null;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    print('Location permissions are permanently denied');
    return null;
  }

  // Get current position
  return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
}
