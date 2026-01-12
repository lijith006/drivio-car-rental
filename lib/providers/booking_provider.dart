import 'package:drivio_car_rental/models/booking.dart';
import 'package:drivio_car_rental/models/car.dart';
import 'package:flutter/material.dart';

class BookingProvider extends ChangeNotifier {
  Car? selectedCar;
  Booking? booking;

  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController locationCtrl = TextEditingController();

  DateTime? startDate;
  DateTime? endDate;

  void selectCar(Car car) {
    clearForm();
    selectedCar = car;
    notifyListeners();
  }

  void setDates(DateTime start, DateTime end) {
    startDate = start;
    endDate = end;
    notifyListeners();
  }

  void setStartDate(DateTime date) {
    startDate = date;
    notifyListeners();
  }

  void setEndDate(DateTime date) {
    endDate = date;
    notifyListeners();
  }

  bool get isFormValid {
    return selectedCar != null &&
        nameCtrl.text.trim().isNotEmpty &&
        locationCtrl.text.trim().isNotEmpty &&
        startDate != null &&
        endDate != null;
  }

  // Booking creation

  void createBooking() {
    if (!isFormValid) return;

    final days = _calculateRentalDays(startDate!, endDate!);
    final total = days * selectedCar!.pricePerDay;

    booking = Booking(
      id: 'DRV-${DateTime.now().millisecondsSinceEpoch}',
      createdAt: DateTime.now(),
      name: nameCtrl.text.trim(),
      startDate: startDate!,
      endDate: endDate!,
      location: locationCtrl.text.trim(),
      days: days,
      totalPrice: total,
      car: selectedCar!,
    );

    notifyListeners();
  }

  // Rental day calculation
  int _calculateRentalDays(DateTime start, DateTime end) {
    final diff = end.difference(start).inDays;
    return diff <= 0 ? 1 : diff;
  }

  void clearForm() {
    nameCtrl.clear();
    locationCtrl.clear();
    startDate = null;
    endDate = null;
    notifyListeners();
  }

  void clearAll() {
    nameCtrl.clear();
    locationCtrl.clear();
    startDate = null;
    endDate = null;
    booking = null;
    selectedCar = null;
    notifyListeners();
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    locationCtrl.dispose();
    super.dispose();
  }
}
