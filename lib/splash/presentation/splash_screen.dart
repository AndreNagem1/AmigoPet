import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../colors/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/splash_image.jpg'),
        SizedBox(height: 10),
        const CircularProgressIndicator(
          color: AppColors.cyan,
        ),
      ],
    );
  }
}
