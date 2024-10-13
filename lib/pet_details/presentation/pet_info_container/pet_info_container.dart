import 'package:amigo_pet/pet_details/presentation/pet_info_container/pet_info_data.dart';
import 'package:flutter/cupertino.dart';

import '../../../colors/app_colors.dart';
import 'info_header.dart';

class PetInfoContainer extends StatelessWidget {
  const PetInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          color: AppColors.surface,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              PetInfoHeader(
                label: 'Nome',
                labelColor: AppColors.warmGreen,
              ),
              SizedBox(height: 5),
              PetInfoData(
                data: 'Diana',
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        PetInfoHeader(
                          label: 'Idade',
                          labelColor: AppColors.yellow,
                        ),
                        SizedBox(height: 5),
                        PetInfoData(
                          data: '6 anos e 7 meses',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      children: [
                        PetInfoHeader(
                          label: 'Peso',
                          labelColor: AppColors.pastelOrange,
                        ),
                        SizedBox(height: 5),
                        PetInfoData(
                          data: '24.5 kg',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
