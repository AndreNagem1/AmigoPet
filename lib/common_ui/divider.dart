import 'package:flutter/cupertino.dart';

import '../colors/app_colors.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 0.5,
      color: AppColors.letterColor,
    );
  }
}
