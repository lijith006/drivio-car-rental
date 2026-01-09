import 'package:drivio_car_rental/core/constants/app_padding.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const AppTextField({required this.controller, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.field,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(labelText: label),
        validator: (v) => v!.isEmpty ? 'Required' : null,
      ),
    );
  }
}
