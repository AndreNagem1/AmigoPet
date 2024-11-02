import 'package:amigo_pet/colors/app_colors.dart';
import 'package:amigo_pet/common_ui/highlighted_text.dart';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Novo amigo',
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
                  color: AppColors.pastelOrange.withOpacity(0.2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.pets_outlined,
                    color: AppColors.pastelOrange,
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
            AddPetInput(
              labelColor: AppColors.warmGreen,
              label: 'Nome',
            ),
            AddPetInput(
              labelColor: AppColors.cyan,
              label: 'Data de nascimento',
              inputType: TextInputType.datetime,
            ),
            AddPetInput(
              labelColor: AppColors.pastelOrange,
              label: 'Peso (Opicional)',
              inputType: TextInputType.number,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: HighLightedText(
            label :'Adicionar',
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
    ;
  }
}
