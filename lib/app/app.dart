import 'package:drivio_car_rental/providers/booking_provider.dart';
import 'package:drivio_car_rental/providers/car_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'routes.dart';

class DrivioApp extends StatelessWidget {
  const DrivioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CarProvider()),
        ChangeNotifierProvider(create: (_) => BookingProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Drivio',
        initialRoute: Routes.splash,
        routes: Routes.map,
      ),
    );
  }
}
