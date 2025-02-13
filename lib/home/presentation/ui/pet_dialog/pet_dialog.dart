import 'package:amigo_pet/colors/app_colors.dart';
import 'package:amigo_pet/common_ui/divider.dart';
import 'package:amigo_pet/home/domain/pet_dialog_cubit.dart';
import 'package:amigo_pet/home/presentation/model/pet_dialog_info.dart';
import 'package:amigo_pet/home/presentation/ui/pet_dialog/pet_dialog_distance_per_day.dart';
import 'package:amigo_pet/home/presentation/ui/pet_dialog/pet_dialog_item.dart';
import 'package:amigo_pet/home/presentation/ui/pet_dialog/status_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common_ui/highlighted_text_button.dart';
import '../../../../common_ui/letter_decoration.dart';

class PetDialog extends StatelessWidget {
  final PetDialogInfo info;

  const PetDialog({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    final cubit = PetDialogCubit(PetDialogIdle());

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: AppColors.surface,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    info.image,
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 14),
                Text(
                  info.name,
                  style: AppStyles.poppins14TextStyle,
                ),
                Spacer(),
                PetDialogDistancePerDay()
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    PetDialogItem(
                      icon: Icons.cake,
                      iconColor: AppColors.lightTeal,
                      label: info.birthday,
                    ),
                    SizedBox(height: 4),
                    PetDialogItem(
                      icon: Icons.pets_outlined,
                      iconColor: AppColors.orange,
                      label: info.foodSupply,
                    ),
                    SizedBox(height: 4),
                    PetDialogItem(
                      icon: Icons.vaccines,
                      iconColor: AppColors.warmGreen,
                      label: info.vaccines,
                    ),
                    SizedBox(height: 4),
                    PetDialogItem(
                      icon: Icons.bug_report_outlined,
                      iconColor: AppColors.warmGreen,
                      label: info.remedies,
                    ),
                  ],
                ),
                Spacer(),
                BlocBuilder<PetDialogCubit, PetDialogState>(
                    bloc: cubit,
                    builder: (context, state) {
                      return switch (state) {
                        PetDialogStartedWalk() => HighlightedTextButton(
                            color: AppColors.pastelOrange,
                            onPress: () {
                              cubit.stopWalk();
                            },
                            label: 'Parar',
                          ),
                        PetDialogIdle() => HighlightedTextButton(
                            onPress: () {
                              cubit.startWalk();
                            },
                            label: 'Passear',
                          ),
                        PetDialogLoading() => Center(
                            child: const CircularProgressIndicator(
                              color: AppColors.cyan,
                            ),
                          ),
                        PetDialogError() => HighlightedTextButton(
                            color: AppColors.pastelOrange,
                            onPress: () {
                              cubit.startWalk();
                            },
                            label: 'Erro',
                          ),
                        PetDialogState() => throw UnimplementedError(),
                      };
                    }),
                SizedBox(width: 10)
              ],
            ),
            SizedBox(height: 20),
            AppDivider(),
            SizedBox(height: 8),
            Row(
              children: [
                StatusRow(
                  selected: info.onWalk ? false : true,
                  label: 'Em casa',
                ),
                SizedBox(width: 10),
                StatusRow(
                  selected: info.onWalk ? true : false,
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
