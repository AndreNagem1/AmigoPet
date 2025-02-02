import 'package:amigo_pet/pet_details/domain/pet_expandable/pet_expandable_cubit.dart';
import 'package:amigo_pet/pet_details/presentation/pet_info_container/pet_info_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../domain/pet_expandable/pet_expandable_state.dart';

class PetDetailsScreen extends StatelessWidget {
  const PetDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = PetDetailsCubit(LoadingState());
    cubit.loadPetInfo();

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Column(
              children: [
                SizedBox(height: 50),
                SizedBox(
                  child: Image.asset('assets/images/diana.jpg'),
                ),
                PetInfoContent()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
