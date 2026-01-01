import 'package:flutter/material.dart';
import 'package:pos_flutter/controllers/custom_email_auth_controller.dart';
import 'package:pos_flutter/main.dart';
import 'package:pos_flutter/screens/home_screen.dart';
import 'package:pos_flutter/screens/sign_up_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CustomEmailAuthController(
      client: client,
      startScreen: .login,
      onAuthenticated: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
          (route) => false,
        );
      },
      onError: (error) {},
      emailValidation: (email) {},
      passwordRequirements: [],
    );
    if (controller.isLoading) {
      Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    if (controller.isAuthenticated) {
      return HomeScreen();
    }
    return SignUpScreen(controller: controller);
  }
}
