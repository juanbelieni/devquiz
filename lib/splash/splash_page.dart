import 'package:devquiz/core/core.dart';
import 'package:devquiz/home/home_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  void navigateToHomePage(BuildContext context) async {
    await Future.delayed(Duration(seconds: 2));
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    navigateToHomePage(context);

    return Scaffold(
      body: Container(
          decoration: BoxDecoration(gradient: AppGradients.linear),
          child: Center(child: Image.asset(AppImages.logo))),
    );
  }
}
