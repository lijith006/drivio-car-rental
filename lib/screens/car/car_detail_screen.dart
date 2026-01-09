import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/booking_provider.dart';
import '../../app/routes.dart';

class CarDetailScreen extends StatelessWidget {
  const CarDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final booking = Provider.of<BookingProvider>(context);
    final car = booking.selectedCar!;

    return Scaffold(
      appBar: AppBar(title: Text(car.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(car.image, height: 200),
            const SizedBox(height: 16),
            Text('₹${car.pricePerDay}/day'),
            Text('${car.seats} seats • ${car.transmission}'),
            const Spacer(),
            ElevatedButton(
              onPressed: car.isAvailable
                  ? () => Navigator.pushNamed(context, Routes.booking)
                  : null,
              child: const Text('Book Now'),
            ),
          ],
        ),
      ),
    );
  }
}
