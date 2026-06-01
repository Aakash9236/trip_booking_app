import 'package:get/get.dart';
import '../app/trip_data.dart';
import '../models/trip_model.dart';

class TripController extends GetxController {
  final trips = <Trip>[].obs;
  final searchKeyword = ''.obs;

  @override
  void onInit() {
    super.onInit();
    trips.assignAll(
      tripData.map((e) => Trip.fromJson(e)).toList(),
    );
  }
  void searchTrip(String value) {
    searchKeyword.value = value;
  }
  List<Trip> get filteredTrips {
    if (searchKeyword.value.isEmpty) {
      return trips;
    }
    return trips.where((trip) {
      return trip.title.toLowerCase().contains(searchKeyword.value.toLowerCase());
    }).toList();
  }
  void updateStatus(int tripId, String newStatus) {
    final trip = trips.firstWhere(
          (element) => element.id == tripId,
    );
    trip.status = newStatus;
    trips.refresh();
  }
}