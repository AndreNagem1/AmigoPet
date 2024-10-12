import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PetDialogItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const PetDialogItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 12,
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
            ),
          ],
        ),
        SizedBox(height: 2)
      ],
    );
  }
}
