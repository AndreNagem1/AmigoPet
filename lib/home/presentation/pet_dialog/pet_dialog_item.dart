import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../colors/app_colors.dart';

class PetDialogItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;

  const PetDialogItem({
    super.key,
    required this.icon,
    required this.label,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 22,
              width: 22,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(100),
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
                color: iconColor.withOpacity(0.3),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 16,
              ),
            ),
            SizedBox(width: 10),
            Text(
              label,
              style: GoogleFonts.righteous(
                textStyle: TextStyle(
                  fontSize: 12,
                  color: AppColors.letterColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 2)
      ],
    );
  }
}
