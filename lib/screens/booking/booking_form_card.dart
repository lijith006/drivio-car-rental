import 'package:drivio_car_rental/core/constants/app_colors.dart';
import 'package:drivio_car_rental/core/constants/app_dimens.dart';
import 'package:drivio_car_rental/core/widgets/app_date_field.dart';
import 'package:drivio_car_rental/core/widgets/app_input_field.dart';
import 'package:drivio_car_rental/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BookingFormCard extends StatelessWidget {
  final TextEditingController nameCtrl;
  final TextEditingController locCtrl;
  final DateTime? start;
  final DateTime? end;
  final VoidCallback onStartPick;
  final VoidCallback onEndPick;
  final int totalDays;
  final double totalPrice;

  const BookingFormCard({
    required this.nameCtrl,
    required this.locCtrl,
    required this.start,
    required this.end,
    required this.onStartPick,
    required this.onEndPick,
    required this.totalDays,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.padding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimens.radiusLarge),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppInputField(
            controller: nameCtrl,
            label: 'Full Name',
            icon: Icons.person_outline,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
            ],
            validator: (value) =>
                Validators.onlyLetters(value, fieldName: 'Full name'),
          ),

          const SizedBox(height: 16),
          AppInputField(
            controller: locCtrl,
            label: 'Pickup Location',
            icon: Icons.location_on_outlined,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
            ],
            validator: (value) =>
                Validators.onlyLetters(value, fieldName: 'Pickup location'),
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: AppDateField(
                  label: 'Start Date',
                  value: start,
                  onTap: onStartPick,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: AppDateField(
                  label: 'End Date',
                  value: end,
                  onTap: onEndPick,
                ),
              ),
            ],
          ),

          if (totalDays > 0) ...[
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.carImageBg,
                borderRadius: BorderRadius.circular(AppDimens.radius),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$totalDays Days',
                    style: TextStyle(color: AppColors.grey),
                  ),
                  Text(
                    '₹$totalPrice',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
