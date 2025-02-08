import 'package:amigo_pet/colors/app_colors.dart';
import 'package:amigo_pet/common_ui/letter_decoration.dart';
import 'package:amigo_pet/pet_details/presentation/charts/chart_weight_widget.dart';
import 'package:amigo_pet/pet_details/presentation/enum/pet_info_enum.dart';
import 'package:amigo_pet/pet_details/presentation/pet_info_container/pet_info_container.dart';
import 'package:amigo_pet/pet_details/presentation/pet_info_container/pet_info_spandable/pet_info_spandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common_ui/surface_decoration.dart';
import '../../../save_results_screen/photos_gallery_screen.dart';
import '../charts/chart_walking_widget.dart';
import '../model/PetRemedyInfo.dart';

class PetInfoContent extends StatelessWidget {
  const PetInfoContent({
    super.key,
  });

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
          ChartWalkingWidget(),
          SizedBox(height: 20),
          ChartWeightWidget(),
          SizedBox(height: 20),
          PetInfoExpandable(
            label: 'Vacinas',
            infoType: PetInfoType.vaccine,
          ),
          SizedBox(height: 20),
          PetInfoExpandable(
            label: 'Remédios',
            infoType: PetInfoType.medication,
          ),
          SizedBox(height: 20),
          PetInfoExpandable(
            label: 'Exames',
            infoType: PetInfoType.exams,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ButtonStyle(
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), // Adjust the radius as needed
                ),
              ),
              backgroundColor: WidgetStatePropertyAll(AppColors.surface),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhotosGalleryScreen(),
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: double.infinity,
              color: AppColors.surface,
              child: Text(
                'Fotos',
                style: AppStyles.poppins14TextStyle,
              ),
            ),
          )
        ],
      ),
    );
  }
}
