import 'dart:async';

import 'package:firebase_auth_p2/constants/app_color.dart';
import 'package:firebase_auth_p2/constants/app_images.dart';
import 'package:firebase_auth_p2/constants/widgets/text_styles.dart';
import 'package:firebase_auth_p2/presentation/auth/login/login%20_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.splashLogo),
            const SizedBox(
              height: 30,
            ),
            Text(
              "FoodMarket",
              style: AppStyle.poppins32xW500White,
            )
          ],
        ),
      ),
    );
  }
}
