import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../colors/app_colors.dart';

class PetInfoHeader extends StatelessWidget {
  final String label;
  final Color labelColor;

  const PetInfoHeader({
    super.key,
    required this.label,
    required this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
            color: labelColor.withOpacity(0.2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              label,
              style: GoogleFonts.righteous(
                textStyle: TextStyle(
                  fontSize: 12,
                  color: labelColor,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 0.5,
          color: AppColors.letterColor,
        )
      ],
    );
  }
}
