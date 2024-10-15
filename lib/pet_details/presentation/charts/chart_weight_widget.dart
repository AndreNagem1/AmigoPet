import 'package:flutter/cupertino.dart';

import '../../../colors/app_colors.dart';
import '../../../common_ui/surface_decoration.dart';
import '../pet_info_container/info_header.dart';
import 'chart_weight.dart';

class ChartWeightWidget extends StatelessWidget {
  const ChartWeightWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: surfaceDecoration,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PetInfoHeader(
              label: 'Pesagem',
              labelColor: AppColors.pastelOrange,
            ),
          ),
          ChartWeight(),
        ],
      ),
    );
    ;
  }
}
