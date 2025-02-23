import 'package:amigo_pet/pet_details/presentation/enum/pet_info_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../colors/app_colors.dart';
import '../../../../common_ui/divider.dart';
import '../../../../common_ui/highlighted_text.dart';
import '../../../../common_ui/letter_decoration.dart';
import '../../model/PetRemedyInfo.dart';
import 'edit_info_dialog.dart';

class PetInfoSpandableSuccessRow extends StatelessWidget {
  final PetRemedyInfo info;
  final PetInfoType type;

  const PetInfoSpandableSuccessRow({
    super.key,
    required this.info,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showInfoDialog(context, info, type);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  info.name,
                  style: AppStyles.poppins12TextStyle,
                ),
                Text(
                  "${info.date.day}/${info.date.month}/${info.date.year}",
                  style: AppStyles.poppins12TextStyle,
                ),
                Text(
                  info.isRecurrent
                      ? info.recurrenceInDays.toString() + ' dias'
                      : ' - ',
                  style: AppStyles.poppins12TextStyle,
                ),
                if (info.isRecurrent)
                  HighLightedText(
                    labelColor: AppColors.warmGreen,
                    label: 'Em dia',
                  ),
                if (!info.isRecurrent)
                  Text(
                    ' - ',
                    style: AppStyles.poppins12TextStyle,
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: AppDivider(thickness:0.1),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _showInfoDialog(
  BuildContext context,
  PetRemedyInfo info,
  PetInfoType type,
) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return InfoDialog(
        info: info,
        type: type,
      );
    },
  );
}
