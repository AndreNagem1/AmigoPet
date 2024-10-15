import 'package:flutter/cupertino.dart';
import '../../../colors/app_colors.dart';
import '../../../common_ui/highlighted_text.dart';

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
        HighLightedText(
          label: label,
          labelColor: labelColor,
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
