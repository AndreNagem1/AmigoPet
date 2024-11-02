import 'package:amigo_pet/colors/app_colors.dart';
import 'package:amigo_pet/common_ui/divider.dart';
import 'package:amigo_pet/home/presentation/model/pet_dialog_info.dart';
import 'package:amigo_pet/home/presentation/ui/pet_dialog/pet_dialog_distance_per_day.dart';
import 'package:amigo_pet/home/presentation/ui/pet_dialog/pet_dialog_item.dart';
import 'package:amigo_pet/home/presentation/ui/pet_dialog/status_row.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common_ui/letter_decoration.dart';

class PetDialog extends StatelessWidget {
  final PetDialogInfo info;

  const PetDialog({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: AppColors.surface,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    info.image,
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 14),
                Text(
                  info.name,
                  style: AppStyles.poppins12TextStyle,
                ),
                Spacer(),
                PetDialogDistancePerDay()
              ],
            ),
            SizedBox(height: 20),
            PetDialogItem(
              icon: Icons.cake,
              iconColor: AppColors.lightTeal,
              label: info.birthday,
            ),
            SizedBox(height: 4),
            PetDialogItem(
              icon: Icons.pets_outlined,
              iconColor: AppColors.orange,
              label: info.foodSupply,
            ),
            SizedBox(height: 4),
            PetDialogItem(
              icon: Icons.vaccines,
              iconColor: AppColors.warmGreen,
              label: info.vaccines,
            ),
            SizedBox(height: 4),
            PetDialogItem(
              icon: Icons.bug_report_outlined,
              iconColor: AppColors.warmGreen,
              label: info.remedies,
            ),
            SizedBox(height: 20),
            AppDivider(),
            SizedBox(height: 8),
            Row(
              children: [
                StatusRow(
                  selected: info.onWalk ? false : true,
                  label: 'Em casa',
                ),
                SizedBox(width: 10),
                StatusRow(
                  selected: info.onWalk ? true : false,
                  label: 'Passeando',
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
