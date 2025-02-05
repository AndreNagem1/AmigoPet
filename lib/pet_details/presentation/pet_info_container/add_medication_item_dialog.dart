import 'package:amigo_pet/colors/app_colors.dart';
import 'package:amigo_pet/common_ui/highlighted_text.dart';
import 'package:amigo_pet/common_ui/letter_decoration.dart';
import 'package:amigo_pet/pet_details/domain/add_item_dialog/add_medication_item_dialog_cubit.dart';
import 'package:amigo_pet/pet_details/domain/add_item_dialog/add_medication_item_dialog_state.dart';
import 'package:amigo_pet/pet_details/presentation/enum/pet_info_enum.dart';
import 'package:amigo_pet/pet_details/presentation/model/PetRemedyInfo.dart';
import 'package:amigo_pet/pet_details/presentation/pet_info_container/pet_info_spandable/info_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common_ui/divider.dart';
import '../../../home/presentation/ui/add_pet_dialog/add_pet_input.dart';

class AddMedicationItemDialog extends StatefulWidget {
  final PetInfoType petInfoType;

  const AddMedicationItemDialog({super.key, required this.petInfoType});

  @override
  State<AddMedicationItemDialog> createState() => _AddMedicationItemDialog();
}

class _AddMedicationItemDialog extends State<AddMedicationItemDialog> {
  late final AddMedicationItemDialogCubit cubit;
  bool isSwitched = false;
  var date = DateTime.now();
  var name = '';
  var isRecurrent = false;
  var recurrenceInDays = 0;

  @override
  void initState() {
    super.initState();
    cubit = AddMedicationItemDialogCubit(IdleState());
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

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
              onValueChanged: (value) {},
            ),
            PetInputText(
              labelColor: AppColors.lightTeal,
              label: 'Descrição',
              onValueChanged: (value) {
                name = value;
              },
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
                      isRecurrent = value;
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
                onValueChanged: (value) {
                  recurrenceInDays = int.parse(value);
                },
              ),
          ],
        ),
      ),
      actions: <Widget>[
        BlocBuilder<AddMedicationItemDialogCubit, AddMedicationItemDialogState>(
          bloc: cubit,
          builder: (context, state) {
            return switch (state) {
              IdleState() => TextButton(
                  child: HighLightedText(
                    label: 'Adicionar',
                    labelColor: AppColors.letterColor,
                  ),
                  onPressed: () {
                    cubit.savePetExamInfo(
                      PetRemedyInfo(
                        date: date,
                        name: name,
                        isRecurrent: isRecurrent,
                        recurrenceInDays: recurrenceInDays,
                      ),
                      widget.petInfoType,
                    ); // Close the dialog
                  },
                ),
              LoadingState() => const CircularProgressIndicator(),
              ErrorState() => Center(
                  child: Text(
                    "Error loading data",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              _ => throw UnimplementedError(),
            };
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