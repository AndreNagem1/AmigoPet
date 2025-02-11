import 'package:amigo_pet/colors/app_colors.dart';
import 'package:amigo_pet/common_ui/highlighted_text.dart';
import 'package:amigo_pet/common_ui/letter_decoration.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../common_ui/divider.dart';
import '../../../home/presentation/ui/add_pet_dialog/add_pet_input.dart';

class DeleteChartPointDialog extends StatelessWidget {
  final Function onDelete;

  const DeleteChartPointDialog({super.key, required this.onDelete});

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
                'Deletar registro',
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
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.delete,
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
      actions: <Widget>[
        TextButton(
          child: HighLightedText(
            label: 'Deletar',
            labelColor: AppColors.pastelOrange,
          ),
          onPressed: () {
            onDelete();
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(
            'Cancelar',
            style: AppStyles.poppins12TextStyle,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
