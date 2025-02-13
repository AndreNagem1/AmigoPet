import 'package:amigo_pet/common_ui/letter_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class HighlightedTextButton extends StatelessWidget {
  final Function onPress;
  final String label;
  final Color color;

  const HighlightedTextButton({
    super.key,
    required this.onPress,
    required this.label,
    this.color = AppColors.warmGreen,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPress();
      },
      child: Text(
        label,
        style: AppStyles.poppins12TextStyle,
      ),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          color.withOpacity(0.3),
        ),
      ),
    );
  }
}
