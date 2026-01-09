import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/car_provider.dart';
import '../../providers/booking_provider.dart';
import '../../app/routes.dart';

class CarListScreen extends StatelessWidget {
  const CarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final carProvider = Provider.of<CarProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Available Cars')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search car',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: carProvider.search,
            ),
          ),
          Expanded(
            child: carProvider.cars.isEmpty
                ? const Center(child: Text('No cars found'))
                : ListView.builder(
                    itemCount: carProvider.cars.length,
                    itemBuilder: (_, i) {
                      final car = carProvider.cars[i];
                      return ListTile(
                        leading: Image.asset(car.image, width: 60),
                        title: Text(car.name),
                        subtitle: Text('₹${car.pricePerDay}/day'),
                        trailing: car.isAvailable
                            ? const Text(
                                'Available',
                                style: TextStyle(color: Colors.green),
                              )
                            : const Text(
                                'Unavailable',
                                style: TextStyle(color: Colors.red),
                              ),
                        onTap: () {
                          Provider.of<BookingProvider>(
                            context,
                            listen: false,
                          ).selectCar(car);
                          Navigator.pushNamed(context, Routes.carDetail);
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
