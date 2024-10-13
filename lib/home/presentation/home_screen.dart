import 'package:amigo_pet/home/presentation/app_floating_action_button.dart';
import 'package:amigo_pet/home/presentation/pet_dialog/pet_dialog.dart';
import 'package:amigo_pet/pet_details/presentation/pet_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AppFloatingActionButton(
        onPress: () {
          navigateToPetDetails(context);
        },
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 100),
              GestureDetector(
                onTap: () {
                  navigateToPetDetails(context);
                },
                child: PetDialog(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToPetDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PetDetailsScreen()),
    );
  }
}
