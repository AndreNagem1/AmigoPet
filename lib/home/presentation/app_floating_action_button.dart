import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../colors/app_colors.dart';

class AppFloatingActionButton extends StatelessWidget {
  final VoidCallback onPress;

  const AppFloatingActionButton({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(100),
              topRight: Radius.circular(100),
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(100),
            ),
            color: AppColors.cyan.withOpacity(0.8),
          ),
          child: Icon(Icons.pets_outlined),
        ),
      ),
    );
  }
}
