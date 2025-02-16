import 'package:amigo_pet/common_ui/highlighted_text.dart';
import 'package:amigo_pet/pet_details/domain/add_item_dialog/add_medication_item_dialog_state.dart';
import 'package:amigo_pet/pet_details/domain/chart_cubit/walking_chart_cubit.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../colors/app_colors.dart';
import '../../../common_ui/letter_decoration.dart';

class WalkingChart extends StatefulWidget {
  const WalkingChart({super.key});

  @override
  State<WalkingChart> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<WalkingChart> {
  List<Color> lineGradientColors = [
    AppColors.cyan,
    AppColors.cyan,
  ];

  List<Color> gradientColors = [
    AppColors.cyan,
    AppColors.surface,
  ];

  @override
  Widget build(BuildContext context) {
    final cubit = WalkingChartCubit(ChartLoading());

    return BlocBuilder<WalkingChartCubit, WalkingChartState>(
        bloc: cubit,
        builder: (context, state) {
          return switch (state) {
            ChartSuccess() => Stack(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 1.70,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 18,
                        left: 12,
                        top: 24,
                        bottom: 12,
                      ),
                      child: LineChart(
                        mainData(state.data),
                      ),
                    ),
                  ),
                ],
              ),
            ChartLoading() => Center(
                child: const CircularProgressIndicator(
                  color: AppColors.cyan,
                ),
              ),
            ChartEmpty() => Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Não tem registros ainda',
                    style: AppStyles.poppins12TextStyle,
                  ),
                  SizedBox(height: 30),
                ],
              ),
            WalkingChartState() => throw UnimplementedError(),
          };
        });
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    final style = AppStyles.poppins12TextStyle;

    Widget text;
    switch (value.toInt()) {
      case 15:
        text = Text('Últimos 30 dias', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    final style = AppStyles.poppins10TextStyle;

    String text;
    switch (value.toInt()) {
      case 60:
        text = '1 h';
        break;
      case 120:
        text = '2 h';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData(List<FlSpot> data) {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: AppColors.surface,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: AppColors.surface,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 30,
      minY: 0,
      maxY: 120,
      lineBarsData: [
        LineChartBarData(
          spots: data,
          isCurved: true,
          gradient: LinearGradient(
            colors: lineGradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
