import 'package:amigo_pet/common_ui/surface_decoration.dart';
import 'package:flutter/cupertino.dart';

import '../../../colors/app_colors.dart';
import '../pet_info_container/info_header.dart';
import 'chart.dart';

class ChartWalkingWidget extends StatelessWidget {
  const ChartWalkingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: surfaceDecoration,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PetInfoHeader(
              label: 'Passeios',
              labelColor: AppColors.cyan,
            ),
          ),
          Chart(),
        ],
      ),
    );
  }
}
