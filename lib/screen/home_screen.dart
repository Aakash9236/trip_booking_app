import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/trip_controller.dart';
import '../widgets/trip_card_widget.dart';


class HomeScreen extends GetView<TripController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trips details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              onChanged: controller.searchTrip,
              decoration: const InputDecoration(
                hintText: 'Search the trip',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Obx( () {
                  final trips = controller.filteredTrips;
                  if (trips.isEmpty) {
                    return const Center(
                      child: Text(
                        'No trips data found',
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: trips.length,
                    itemBuilder: (context, index) {
                      return TripCard(
                        trip: trips[index],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}