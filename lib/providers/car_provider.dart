import 'package:drivio_car_rental/data/mock_cars.dart';
import 'package:drivio_car_rental/models/car.dart';
import 'package:flutter/material.dart';

class CarProvider extends ChangeNotifier {
  final List<Car> _cars = mockCars;
  String _search = '';

  List<Car> get cars =>
      _cars.where((c) => c.name.toLowerCase().contains(_search)).toList();

  void search(String value) {
    _search = value.toLowerCase();
    notifyListeners();
  }
}
