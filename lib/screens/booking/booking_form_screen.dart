import 'package:drivio_car_rental/screens/booking/booking_form_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/booking_provider.dart';
import '../../app/routes.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimens.dart';

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

  int get totalDays {
    if (start == null || end == null) return 0;
    return end!.difference(start!).inDays + 1;
  }

  @override
  Widget build(BuildContext context) {
    final booking = Provider.of<BookingProvider>(context);
    final car = booking.selectedCar!;

    final totalPrice = totalDays * car.pricePerDay;

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: const Text('Booking Details'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.padding),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: BookingFormCard(
                  nameCtrl: nameCtrl,
                  locCtrl: locCtrl,
                  start: start,
                  end: end,
                  onStartPick: () async {
                    start = await _pickDate(context);
                    setState(() {});
                  },
                  onEndPick: () async {
                    end = await _pickDate(context);
                    setState(() {});
                  },
                  totalDays: totalDays,
                  totalPrice: totalPrice,
                ),
              ),
            ),

            /// Button for confirm booking
            SizedBox(
              width: double.infinity,
              height: AppDimens.buttonHeight,
              child: ElevatedButton(
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppDimens.radius),
                  ),
                ),
                child: const Text(
                  'CONFIRM BOOKING',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<DateTime?> _pickDate(BuildContext context) {
    return showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );
  }
}
