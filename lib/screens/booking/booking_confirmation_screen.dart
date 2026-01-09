import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/booking_provider.dart';
import '../../app/routes.dart';

class BookingConfirmationScreen extends StatelessWidget {
  const BookingConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final booking = Provider.of<BookingProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Confirmation')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Icon(Icons.check_circle, size: 80, color: Colors.green),
            Text(
              'Booking Confirmed',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Text('Name: ${booking.booking!.name}'),
            Text('Total: ₹${booking.booking!.totalPrice}'),
            const Spacer(),
            ElevatedButton(
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.cars,
                (_) => false,
              ),
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
