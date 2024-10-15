import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class HighLightedText extends StatelessWidget {
  final Color labelColor;
  final String label;


  const HighLightedText({super.key,
    required this.labelColor,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
