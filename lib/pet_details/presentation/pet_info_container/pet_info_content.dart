import 'package:amigo_pet/pet_details/presentation/pet_info_container/pet_info_container.dart';
import 'package:amigo_pet/pet_details/presentation/pet_info_container/pet_info_spandable.dart';
import 'package:flutter/cupertino.dart';

class PetInfoContent extends StatelessWidget {
  const PetInfoContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
      ),
      child: Column(
        children: [
          PetInfoContainer(),
          SizedBox(height: 20),
          PetInfoExpandable(label: 'Vacinas'),
          SizedBox(height: 20),
          PetInfoExpandable(label: 'Parasitas')
        ],
      ),
    );
  }
}
