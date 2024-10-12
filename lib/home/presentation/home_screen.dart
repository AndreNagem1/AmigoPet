import 'package:amigo_pet/colors/app_colors.dart';
import 'package:amigo_pet/home/presentation/pet_dialog/pet_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: AppColors.background,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 100),
              PetDialog(),
            ],
          ),
        ),
      ),
    );
  }
}
