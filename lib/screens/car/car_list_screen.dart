import 'package:drivio_car_rental/screens/car/car_detail_screen.dart';
import 'package:drivio_car_rental/widgets/logout_confirmation_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/car_provider.dart';
import '../../providers/booking_provider.dart';
import '../../core/constants/app_colors.dart';
import '../../widgets/car_card.dart';

class CarListScreen extends StatelessWidget {
  const CarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final carProvider = Provider.of<CarProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.bgColor,

      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: const Text('Available Cars'),
        scrolledUnderElevation: 0,
        elevation: 0,
        surfaceTintColor: Colors.transparent,

        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => const LogoutConfirmationDialog(),
              );
            },
          ),
        ],
      ),

      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: TextField(
              onChanged: carProvider.search,
              decoration: InputDecoration(
                hintText: 'Search cars',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: AppColors.inputBg,
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          //Car List
          Expanded(
            child: carProvider.cars.isEmpty
                ? const Center(child: Text('No cars found'))
                : ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: carProvider.cars.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (_, i) {
                      final car = carProvider.cars[i];

                      return CarCard(
                        car: car,
                        onTap: () {
                          Provider.of<BookingProvider>(
                            context,
                            listen: false,
                          ).selectCar(car);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CarDetailScreen(),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
