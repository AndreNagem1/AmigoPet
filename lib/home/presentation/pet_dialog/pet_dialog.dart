import 'package:amigo_pet/colors/app_colors.dart';
import 'package:amigo_pet/common_ui/divider.dart';
import 'package:amigo_pet/home/presentation/pet_dialog/pet_dialog_item.dart';
import 'package:amigo_pet/home/presentation/pet_dialog/status_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PetDialog extends StatelessWidget {
  const PetDialog({super.key});

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
                    'assets/images/diana.jpg',
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  'Diana, 6 anos',
                  style: GoogleFonts.righteous(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: AppColors.letterColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            PetDialogItem(
              icon: Icons.cake,
              iconColor: AppColors.lightTeal,
              label: '20 de Fevereiro',
            ),
            SizedBox(height: 4),
            PetDialogItem(
              icon: Icons.pets_outlined,
              iconColor: AppColors.orange,
              label: 'Comprar mais comida',
            ),
            SizedBox(height: 4),
            PetDialogItem(
              icon: Icons.vaccines,
              iconColor: AppColors.warmGreen,
              label: 'Vacinas - Em dia',
            ),
            SizedBox(height: 4),
            PetDialogItem(
              icon: Icons.bug_report_outlined,
              iconColor: AppColors.warmGreen,
              label: 'Pulga - Em dia',
            ),
            SizedBox(height: 20),
            AppDivider(),
            SizedBox(height: 8),
            Row(
              children: [
                StatusRow(
                  selected: true,
                  label: 'Em casa',
                ),
                SizedBox(width: 10),
                StatusRow(
                  selected: false,
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
