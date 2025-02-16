import 'package:amigo_pet/colors/app_colors.dart';
import 'package:amigo_pet/common_ui/highlighted_text.dart';
import 'package:amigo_pet/common_ui/letter_decoration.dart';
import 'package:amigo_pet/home/domain/register_walk_dialog_cubit.dart';
import 'package:amigo_pet/pet_details/presentation/model/walking_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterWalkDialog extends StatelessWidget {
  final WalkingInfo info;

  const RegisterWalkDialog({
    super.key,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = RegisterWalkDialogCubit(Idle());
    final walkInMinutes = DateTime.now().difference(info.date).inMinutes;

    return AlertDialog(
      backgroundColor: AppColors.surface,
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Registrar passeio',
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
                  color: AppColors.cyan.withOpacity(0.2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.add,
                    color: AppColors.cyan,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Vocês passearam por:',
            style: AppStyles.poppins12TextStyle,
          ),
          SizedBox(height: 10),
          Text(
            walkInMinutes.toString() + ' min',
            style: AppStyles.poppins14W400TextStyle,
          ),
          SizedBox(height: 10),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            'Cancelar',
            style: AppStyles.poppins12TextStyle,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        BlocBuilder<RegisterWalkDialogCubit, RegisterWalkDialogState>(
          bloc: cubit,
          builder: (context, state) {
            return switch (state) {
              Idle() => TextButton(
                  child: HighLightedText(
                    label: 'Adicionar',
                    labelColor: AppColors.cyan,
                  ),
                  onPressed: () {
                    cubit.saveChartPoints(walkInMinutes);
                    Navigator.of(context).pop();
                  },
                ),
              Loading() => Center(
                  child: const CircularProgressIndicator(
                    color: AppColors.cyan,
                  ),
                ),
              RegisterWalkDialogState() => throw UnimplementedError(),
            };
          },
        ),
      ],
    );
  }
}
