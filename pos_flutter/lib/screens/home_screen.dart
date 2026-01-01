import 'package:flutter/material.dart';
import 'package:pos_flutter/main.dart';
import 'package:pos_flutter/screens/auth_screen.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            client.auth.signOutDevice();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => AuthScreen(),
              ),
              (route) => false,
            );
          },
          child: Text('SignOut'),
        ),
      ),
    );
  }
}
