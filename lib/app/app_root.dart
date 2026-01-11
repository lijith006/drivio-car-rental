import 'package:drivio_car_rental/providers/auth_provider.dart';
import 'package:drivio_car_rental/screens/auth/login_screen.dart';
import 'package:drivio_car_rental/screens/car/car_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, _) {
        return auth.isLoggedIn ? const CarListScreen() : const LoginScreen();
      },
    );
  }
}
