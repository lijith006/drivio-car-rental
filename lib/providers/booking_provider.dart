import 'package:drivio_car_rental/models/booking.dart';
import 'package:drivio_car_rental/models/car.dart';
import 'package:flutter/material.dart';

class BookingProvider extends ChangeNotifier {
  Car? selectedCar;
  Booking? booking;

  void selectCar(Car car) {
    selectedCar = car;
    notifyListeners();
  }

  void createBooking({
    required String name,
    required DateTime start,
    required DateTime end,
    required String location,
  }) {
    final days = end.difference(start).inDays;
    final total = days * selectedCar!.pricePerDay;

    booking = Booking(
      name: name,
      startDate: start,
      endDate: end,
      location: location,
      totalPrice: total,
    );
    notifyListeners();
  }
}
