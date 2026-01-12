import 'package:drivio_car_rental/screens/booking/booking_confirmation_screen.dart';
import 'package:drivio_car_rental/screens/booking/booking_form_card.dart';
import 'package:drivio_car_rental/utils/app_snackbar.dart';
import 'package:drivio_car_rental/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/booking_provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimens.dart';

class BookingFormScreen extends StatefulWidget {
  const BookingFormScreen({super.key});

  @override
  State<BookingFormScreen> createState() => _BookingFormScreenState();
}

class _BookingFormScreenState extends State<BookingFormScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final booking = context.watch<BookingProvider>();
    final car = booking.selectedCar!;

    final totalDays = booking.startDate != null && booking.endDate != null
        ? booking.endDate!.difference(booking.startDate!).inDays + 1
        : 0;

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
                child: Form(
                  key: _formKey,
                  child: BookingFormCard(
                    nameCtrl: booking.nameCtrl,
                    locCtrl: booking.locationCtrl,
                    start: booking.startDate,
                    end: booking.endDate,
                    onStartPick: () async {
                      final date = await _pickDate(context);
                      if (date != null && booking.endDate != null) {
                        booking.setDates(date, booking.endDate!);
                      } else if (date != null) {
                        // booking.startDate = date;
                        // booking.notifyListeners();
                        booking.setStartDate(date);
                      }
                    },
                    onEndPick: () async {
                      final date = await _pickDate(context);
                      if (date != null && booking.startDate != null) {
                        booking.setDates(booking.startDate!, date);
                      } else if (date != null) {
                        // booking.endDate = date;
                        // booking.notifyListeners();
                        booking.setEndDate(date);
                      }
                    },
                    totalDays: totalDays,
                    totalPrice: totalPrice,
                  ),
                ),
              ),
            ),

            /// Confirm booking button
            SizedBox(
              width: double.infinity,
              height: AppDimens.buttonHeight,
              child: PrimaryButton(
                label: 'CONFIRM BOOKING',
                onPressed: booking.isFormValid
                    ? () {
                        if (!_formKey.currentState!.validate()) return;

                        booking.createBooking();
                        AppSnackBar.show(
                          context,
                          'Booking confirmed successfully',
                          backgroundColor: Colors.green,
                        );
                        // Navigator.pushNamed(context, Routes.confirmation);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const BookingConfirmationScreen(),
                          ),
                        );
                      }
                    : null,
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
