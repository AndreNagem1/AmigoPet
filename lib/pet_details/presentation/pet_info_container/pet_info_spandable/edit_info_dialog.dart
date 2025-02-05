import 'package:amigo_pet/colors/app_colors.dart';
import 'package:amigo_pet/common_ui/letter_decoration.dart';
import 'package:amigo_pet/pet_details/domain/edit_info_dialog/edit_info_dialog_cubit.dart';
import 'package:amigo_pet/pet_details/presentation/enum/pet_info_enum.dart';
import 'package:amigo_pet/pet_details/presentation/model/PetRemedyInfo.dart';
import 'package:flutter/material.dart';

import '../../../../common_ui/divider.dart';
import '../../../../common_ui/highlighted_text.dart';
import '../../../domain/edit_info_dialog/edit_info_dialog_state.dart';

class InfoDialog extends StatelessWidget {
  final PetRemedyInfo info;
  final PetInfoType type;

  const InfoDialog({super.key, required this.info, required this.type});

  @override
  Widget build(BuildContext context) {
    final cubit = EditInfoDialogCubit(IdleState());

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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          InfoRow(label: 'Nome', value: info.name),
          SizedBox(height: 4.0),
          InfoRow(
            label: 'Data',
            value: "${info.date.day}/${info.date.month}/${info.date.year}",
          ),
          SizedBox(height: 4.0),
          if (info.isRecurrent)
            InfoRow(
                label: 'Frequência',
                value: info.recurrenceInDays.toString() + ' dias'),
          SizedBox(height: 4.0),
          if (info.isRecurrent)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HighLightedText(
                  labelColor: AppColors.cyan,
                  label: 'Status',
                ),
                HighLightedText(
                  labelColor: AppColors.warmGreen,
                  label: 'Em dia',
                ),
              ],
            ),
          SizedBox(height: 4.0),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: HighLightedText(
            label: 'Deletar',
            labelColor: AppColors.pastelOrange,
          ),
          onPressed: () {
            cubit.deletePetExamInfo(info.Id, type);
            Navigator.of(context).pop(); // Close the dialog
          },
        ),
        TextButton(
          child: Text(
            'Editar',
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

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HighLightedText(
          labelColor: AppColors.cyan,
          label: label,
        ),
        Text(
          value,
          style: AppStyles.poppins12TextStyle,
        ),
      ],
    );
  }
}
