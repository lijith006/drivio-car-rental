import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/booking_provider.dart';
import '../../app/routes.dart';

class BookingFormScreen extends StatefulWidget {
  const BookingFormScreen({super.key});

  @override
  State<BookingFormScreen> createState() => _BookingFormScreenState();
}

class _BookingFormScreenState extends State<BookingFormScreen> {
  final nameCtrl = TextEditingController();
  final locCtrl = TextEditingController();
  DateTime? start;
  DateTime? end;

  @override
  Widget build(BuildContext context) {
    final booking = Provider.of<BookingProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Booking')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: locCtrl,
              decoration: const InputDecoration(labelText: 'Location'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              child: Text(
                start == null ? 'Select Start Date' : start.toString(),
              ),
              onPressed: () async {
                start = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                  initialDate: DateTime.now(),
                );
                setState(() {});
              },
            ),
            ElevatedButton(
              child: Text(end == null ? 'Select End Date' : end.toString()),
              onPressed: () async {
                end = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                  initialDate: DateTime.now(),
                );
                setState(() {});
              },
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: start != null && end != null
                  ? () {
                      booking.createBooking(
                        name: nameCtrl.text,
                        start: start!,
                        end: end!,
                        location: locCtrl.text,
                      );
                      Navigator.pushNamed(context, Routes.confirmation);
                    }
                  : null,
              child: const Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}
