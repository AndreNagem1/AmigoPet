import 'package:amigo_pet/colors/app_colors.dart';
import 'package:amigo_pet/common_ui/highlighted_text.dart';
import 'package:amigo_pet/common_ui/letter_decoration.dart';
import 'package:flutter/material.dart';

import '../../../../common_ui/divider.dart';
import '../../../home/presentation/ui/add_pet_dialog/add_pet_input.dart';

class AddMedicationItemDialog extends StatefulWidget {
  const AddMedicationItemDialog({super.key});

  @override
  State<AddMedicationItemDialog> createState() => _AddMedicationItemDialog();
}

class _AddMedicationItemDialog extends State<AddMedicationItemDialog> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.surface,
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Novo registro',
                style: AppStyles.poppins18TextStyle,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  border: Border.all(
                    color: Colors.white38,
                    width: 1,
                  ),
                  color: AppColors.warmGreen.withOpacity(0.2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.health_and_safety,
                    color: AppColors.warmGreen,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          AppDivider()
        ],
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            PetInputText(
              labelColor: AppColors.lightTeal,
              label: 'Data',
              inputType: TextInputType.datetime,
            ),
            PetInputText(
              labelColor: AppColors.lightTeal,
              label: 'Descrição',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Recorrência',
                  style: AppStyles.poppins12TextStyle,
                ),
                SizedBox(width: 10),
                Switch(
                  activeColor: AppColors.warmGreen,
                  inactiveTrackColor: AppColors.background,
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                ),
              ],
            ),
            if (isSwitched)
              PetInputText(
                labelColor: AppColors.lightTeal,
                label: 'Frequência (dias)',
                inputType: TextInputType.number,
              ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: HighLightedText(
            label: 'Adicionar',
            labelColor: AppColors.letterColor,
          ),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
        ),
        TextButton(
          child: Text(
            'Cancelar',
            style: AppStyles.poppins12TextStyle,
          ),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
        ),
      ],
    );
  }
}
