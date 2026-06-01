import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/trip_controller.dart';
import '../models/trip_model.dart';

class TripDetailsScreen extends StatefulWidget {
  const TripDetailsScreen({super.key});
  @override
  State<TripDetailsScreen> createState() =>
      _TripDetailsScreenState();
}
class _TripDetailsScreenState
  extends State<TripDetailsScreen> {
  late Trip trip;
  late String selectedStatus;
  final TripController tripController =
  Get.find<TripController>();
  @override
  void initState() {
    super.initState();
    trip = Get.arguments;
    selectedStatus = trip.status;
  }
  List<String> getStatusOptions() {
    return ['Booked', 'Completed', 'Cancelled'];
  }

  Widget buildInfoTile(String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300,),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(label, style: const TextStyle(fontWeight:FontWeight.w600,),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(value),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trip Details',),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            buildInfoTile('Title', trip.title),
            buildInfoTile('Date', trip.date),
            buildInfoTile('Pickup', trip.pickup),
            buildInfoTile('Drop',trip.drop),
            buildInfoTile('Current Status', trip.status),
            const SizedBox(
              height: 20,
            ),
            DropdownButtonFormField<String>(
              value: selectedStatus,
              decoration: const InputDecoration(
                labelText: 'Change Status',
                border: OutlineInputBorder(),
              ),
              items: getStatusOptions().map((status) =>
                    DropdownMenuItem(value: status, child: Text(status)),
              ).toList(),
              onChanged: (value) {
                if (value == null) {
                  return;
                }
                setState(() { selectedStatus = value;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  tripController.updateStatus(trip.id, selectedStatus,
                  );
                  Get.back();
                },
                child: const Text('Save Changes',),
              ),
            ),
          ],
        ),
      ),
    );
  }
}