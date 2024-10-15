import 'package:amigo_pet/colors/app_colors.dart';
import 'package:amigo_pet/common_ui/letter_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common_ui/divider.dart';
import 'add_pet_input.dart';

class AddPetDialog extends StatelessWidget {
  const AddPetDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.surface,
      title: Column(
        children: [
          Text(
            'Adicionar novo amigo',
            style: AppStyles.righteous18TextStyle,
          ),
          SizedBox(height: 10),
          AppDivider()
        ],
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            AddPetInput(
              labelColor: AppColors.warmGreen,
              label: 'Nome',
            ),
            AddPetInput(
              labelColor: AppColors.cyan,
              label: 'Data de nascimento',
            ),
            AddPetInput(
              labelColor: AppColors.pastelOrange,
              label: 'Peso (Opicional)',
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            'Adicionar',
            style: AppStyles.righteous12TextStyle,
          ),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
        ),
        TextButton(
          child: Text(
            'Cancelar',
            style: AppStyles.righteous12TextStyle,
          ),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
        ),
      ],
    );
    ;
  }
}
