import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../colors/app_colors.dart';

class PetInfoData extends StatelessWidget {
  final String data;

  const PetInfoData({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data,
          style: GoogleFonts.righteous(
            textStyle: TextStyle(
              fontSize: 12,
              color: AppColors.letterColor,
            ),
          ),
        ),
      ],
    );
  }
}
