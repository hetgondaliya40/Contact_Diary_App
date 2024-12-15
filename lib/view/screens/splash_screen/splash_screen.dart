import 'dart:async';

import 'package:flutter/material.dart';

import '../../../routes/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, Routes.homePage);
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.network(
            'https://www.ubackup.com/phone/screenshot/en/others/pictures/google-contacts.png'),
      ),
    );
  }
}
