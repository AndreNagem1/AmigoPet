import 'package:amigo_pet/colors/app_colors.dart';
import 'package:amigo_pet/common_ui/letter_decoration.dart';
import 'package:amigo_pet/pet_details/presentation/model/PetRemedyInfo.dart';
import 'package:flutter/material.dart';

import '../../../../common_ui/divider.dart';
import '../../../../common_ui/highlighted_text.dart';

class InfoDialog extends StatelessWidget {
  final PetRemedyInfo info;

  const InfoDialog({super.key, required this.info});

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
                'Editar Registro',
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
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            info.name,
            style: AppStyles.poppins12TextStyle,
          ),
          Text(
            info.date.toString(),
            style: AppStyles.poppins12TextStyle,
          ),
          if (info.isRecurrent)
            Text(
              "${info.date.day}/${info.date.month}/${info.date.year}" +
                  ' frequência em dias ',
              style: AppStyles.poppins12TextStyle,
            ),
          if (info.isRecurrent)
            HighLightedText(
              labelColor: AppColors.warmGreen,
              label: 'Em dia',
            ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            'Salvar',
            style: AppStyles.poppins12TextStyle,
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
