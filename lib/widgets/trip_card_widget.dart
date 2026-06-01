import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/routes.dart';
import '../models/trip_model.dart';


class TripCard extends StatelessWidget {
  final Trip trip;
  const TripCard({
    super.key,
    required this.trip,
  });
  Color getStatusColor() {
    switch (trip.status) {
      case 'Completed':
        return Colors.green;
       case 'Cancelled':
        return Colors.red;
        default:
        return Colors.orange;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      child: ListTile(
        title: Text(
          trip.title,
        ),
        subtitle: Text(
          trip.date,
        ),
        trailing: Container(
          padding:
          const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: getStatusColor()
                .withOpacity(0.15),
            borderRadius:
            BorderRadius.circular(
              20,
            ),
          ),
          child: Text(
            trip.status,
            style: TextStyle(
              color: getStatusColor(),
              fontWeight:
              FontWeight.w600,
            ),
          ),
        ),
        onTap: () {
          Get.toNamed(
            AppRoutes.tripDetailsPage,
            arguments: trip,
          );
        },
      ),
    );
  }
}