import 'package:amigo_pet/colors/app_colors.dart';
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
      height: 270,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        border: Border.all(
          color: AppColors.brown,
          width: 0.5,
        ),
        color: AppColors.pastelOrange,
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
                      color: AppColors.yellow,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            PetDialogItem(
              icon: Icons.cake,
              label: 'Aniversário',
            ),
            PetDialogItem(
              icon: Icons.pets_outlined,
              label: 'Comida',
            ),
            PetDialogItem(
              icon: Icons.vaccines,
              label: 'Vacina',
            ),
            PetDialogItem(
              icon: Icons.bug_report_outlined,
              label: 'Pulga',
            ),
            SizedBox(height: 40),
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
