import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../colors/app_colors.dart';

class StatusRow extends StatelessWidget {
  final bool selected;
  final String label;

  const StatusRow({super.key, required this.selected, required this.label});

  @override
  Widget build(BuildContext context) {
    Color color = Colors.transparent;

    if (selected) {
      color = AppColors.warmGreen;
    }

    return Row(
      children: [
        Container(
          height: 18,
          width: 18,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            border: Border.all(
              color: AppColors.brown,
              width: 1.5,
            ),
            color: color,
          ),
        ),
        SizedBox(width: 10),
        Text(
          label,
          style: GoogleFonts.righteous(
            textStyle: TextStyle(
              fontSize: 12,
              color: Colors.black87,
            ),
          ),
        )
      ],
    );
  }
}
