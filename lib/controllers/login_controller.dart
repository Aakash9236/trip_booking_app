import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }
  @override
  void onClose() {
    emailController.dispose();
    passController.dispose();
    super.onClose();
  }
}