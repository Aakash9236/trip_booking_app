import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_and_booking/screen/home_screen.dart';
import 'package:trip_and_booking/screen/login_screen.dart';
import 'package:trip_and_booking/screen/trip_details_screen.dart';
import 'app/routes.dart';
import 'controllers/trip_controller.dart';

void main() {
  Get.put(TripController());
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.loginPage,
      getPages: [
        GetPage(
          name: AppRoutes.loginPage,
          page:()=>LoginScreen(),
        ),
        GetPage(
          name: AppRoutes.homePage,
          page:()=>const HomeScreen(),
        ),
        GetPage(
          name:AppRoutes.tripDetailsPage,
          page:()=>const TripDetailsScreen(),
        ),
      ],
    );
  }
}