import 'package:amigo_pet/colors/app_colors.dart';
import 'package:amigo_pet/common_ui/letter_decoration.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../common_ui/divider.dart';
import '../../../home/presentation/ui/add_pet_dialog/add_pet_input.dart';

class AddChartPointDialog extends StatelessWidget {
  final Function(FlSpot) onAdd;

  const AddChartPointDialog({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    var weight = 0.0;
    var month = 0.0;

    return AlertDialog(
      backgroundColor: AppColors.surface,
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Adicionar peso',
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
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.add,
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
          PetInputText(
            labelColor: AppColors.cyan,
            label: 'Peso em Kg',
            inputType: TextInputType.number,
            onValueChanged: (info) {
              weight = double.parse(info);
            },
          ),
          PetInputText(
            labelColor: AppColors.cyan,
            label: 'Mês',
            inputType: TextInputType.numberWithOptions(decimal: false),
            onValueChanged: (info) {
              month = double.parse(info);
            },
          ),
          SizedBox(height: 4.0),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            'Adicionar',
            style: AppStyles.poppins12TextStyle,
          ),
          onPressed: () {
            onAdd(FlSpot(month - 1, weight));
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
