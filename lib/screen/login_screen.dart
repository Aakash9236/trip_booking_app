import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app/routes.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController controller =
  Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        centerTitle: true,
      ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: controller.formKey,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .8,
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.stretch,
                  children: [
                const SizedBox(height: 40),
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller:
                  controller.emailController,
                  keyboardType:
                  TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter email';
                    }
                    if (!GetUtils.isEmail(value.trim())) {
                      return 'Enter valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller:
                  controller.passController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hint: Text('Enter the pass'),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return 'Pass must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                SizedBox(
                   height: 50,
                   child: ElevatedButton(
                     style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.blue,
                       foregroundColor: Colors.white,
                     ),
                    onPressed: () {
                      if (controller.validateForm()) {
                        Get.offNamed(
                          AppRoutes.homePage,
                        );
                      }
                    },child: const Text('Login button'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    )
    );
  }
}