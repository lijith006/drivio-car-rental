import 'package:drivio_car_rental/models/car.dart';

class Booking {
  final String id;
  final DateTime createdAt;

  final String name;
  final DateTime startDate;
  final DateTime endDate;
  final int days;

  final String location;
  final double totalPrice;

  final Car car;

  Booking({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.days,
    required this.location,
    required this.totalPrice,
    required this.car,
  });
}
