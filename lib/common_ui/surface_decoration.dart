import 'package:flutter/cupertino.dart';

import '../colors/app_colors.dart';

final surfaceDecoration = BoxDecoration(
  borderRadius: const BorderRadius.only(
    topLeft: Radius.circular(10),
    topRight: Radius.circular(10),
    bottomLeft: Radius.circular(10),
    bottomRight: Radius.circular(10),
  ),
  color: AppColors.surface,
);

final surfaceDecorationRoundedTop = BoxDecoration(
  borderRadius: const BorderRadius.only(
    topLeft: Radius.circular(10),
    topRight: Radius.circular(10),
  ),
  color: AppColors.surface,
);

final surfaceDecorationRoundedBottom = BoxDecoration(
  borderRadius: const BorderRadius.only(
    bottomLeft: Radius.circular(10),
    bottomRight: Radius.circular(10),
  ),
  color: AppColors.surface,
);

