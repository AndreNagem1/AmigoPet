import 'package:amigo_pet/common_ui/letter_decoration.dart';
import 'package:flutter/cupertino.dart';

import '../../../../colors/app_colors.dart';

class PetDialogDistancePerDay extends StatelessWidget {
  const PetDialogDistancePerDay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        color: AppColors.warmGreen.withOpacity(0.2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Total percorrido hoje',
              style: AppStyles.righteous10TextStyle.copyWith(color: AppColors.warmGreen),
            ),
            Text(
              '24 m',
              style: AppStyles.righteous18TextStyle.copyWith(color: AppColors.warmGreen),
            ),
          ],
        ),
      ),
    );
  }
}
