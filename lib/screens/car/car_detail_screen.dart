import 'package:drivio_car_rental/widgets/primary_button.dart';
import 'package:drivio_car_rental/widgets/spec_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/booking_provider.dart';
import '../../app/routes.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimens.dart';

class CarDetailScreen extends StatelessWidget {
  const CarDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final booking = Provider.of<BookingProvider>(context);
    final car = booking.selectedCar!;

    return Scaffold(
      backgroundColor: AppColors.carImageBg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.textColor,
      ),
      body: Column(
        children: [
          // Image section
          Container(
            margin: const EdgeInsets.all(AppDimens.padding),
            padding: const EdgeInsets.all(AppDimens.padding),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 20,
                  child: Text(
                    car.name.toUpperCase(),
                    style: TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.35),
                      letterSpacing: 2,
                    ),
                  ),
                ),
                Image.asset(car.image, height: 190, fit: BoxFit.contain),
              ],
            ),
          ),

          // Details section
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(AppDimens.padding),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(AppDimens.radiusLarge),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Name and price
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                car.name,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textColor,
                                ),
                              ),
                              Text(
                                '₹${car.pricePerDay}/day',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),

                          // Specification card
                          Row(
                            children: [
                              SpecCard(
                                title: 'Transmission',
                                value: car.transmission,
                              ),
                              const SizedBox(width: 12),
                              SpecCard(title: 'Seats', value: '${car.seats}'),
                            ],
                          ),

                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),

                  PrimaryButton(
                    label: 'BOOK NOW',
                    onPressed: car.isAvailable
                        ? () => Navigator.pushNamed(context, Routes.booking)
                        : null,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
