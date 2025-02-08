import 'package:flutter/cupertino.dart';

import '../colors/app_colors.dart';

class AppDivider extends StatelessWidget {
  final double thickness;

  const AppDivider({super.key, this.thickness = 0.5});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: thickness,
      color: AppColors.letterColor,
    );
  }
}
