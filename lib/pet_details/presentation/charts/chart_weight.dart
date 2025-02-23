import 'package:amigo_pet/pet_details/domain/chart_cubit/chart_cubit.dart';
import 'package:amigo_pet/pet_details/presentation/charts/delete_chart_point_dialog.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../colors/app_colors.dart';
import '../../../common_ui/letter_decoration.dart';
import 'add_chart_point_dialog.dart';

class ChartWeight extends StatefulWidget {
  const ChartWeight({super.key});

  @override
  State<ChartWeight> createState() => _ChartWeightState();
}

class _ChartWeightState extends State<ChartWeight> {
  late final ChartCubit cubit;

  List<Color> lineGradientColors = [
    AppColors.pastelOrange,
    AppColors.pastelOrange,
  ];

  List<Color> gradientColors = [
    AppColors.pastelOrange,
    AppColors.surface,
  ];

  bool showAvg = false;

  @override
  void initState() {
    super.initState();
    cubit = ChartCubit(ChartLoading());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChartCubit, ChartCubitState>(
      bloc: cubit,
      builder: (context, state) {
        return switch (state) {
          ChartSuccess(:final chartPoints) => Stack(
              children: [
                Column(
                  children: [
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
                          mainData(chartPoints),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _showAddChartPointDialog(
                          context,
                          (chartPoint) {
                            cubit.addChartPoint(chartPoint);
                          },
                        );
                      },
                      child: Text(
                        'Adicionar  registro',
                        style: TextStyle(color: AppColors.warmGreen),
                      ),
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          AppColors.warmGreen.withOpacity(0.3),
                        ),
                      ),
                    ),
                    SizedBox(height: 20)
                  ],
                ),
              ],
            ),
          ChartOutOfRangeError(:final errorMessage) => Center(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Text(
                      errorMessage,
                      style: AppStyles.poppins12TextStyle,
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        cubit.loadChartPoints();
                      },
                      child: Text(
                        'ok',
                        style: TextStyle(color: AppColors.warmGreen),
                      ),
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          AppColors.warmGreen.withOpacity(0.3),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ChartLoading() => Center(
              child: const CircularProgressIndicator(
                color: AppColors.cyan,
              ),
            ),
          ChartEmpty() => Center(
              child: Text(
                'Você ainda não tem registros',
                style: AppStyles.poppins12TextStyle,
              ),
            ),
          ChartCubitState() => throw UnimplementedError(),
        };
      },
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    final style = AppStyles.poppins12TextStyle;

    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text('JAN', style: style);
        break;
      case 2:
        text = Text('MAR', style: style);
        break;
      case 5:
        text = Text('JUN', style: style);
        break;
      case 7:
        text = Text('AGO', style: style);
        break;
      case 9:
        text = Text('SET', style: style);
        break;
      case 11:
        text = Text('DEZ', style: style);
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
      case 1:
        text = '0 kg';
        break;
      case 30:
        text = '30 kg';
        break;
      case 60:
        text = '60.0 kg';
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
      maxX: 11,
      minY: 0,
      maxY: 60,
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
      lineTouchData: LineTouchData(
        touchCallback: (FlTouchEvent event, LineTouchResponse? response) {
          if (event is FlLongPressStart && response?.lineBarSpots != null) {
            final touchedSpot = response!.lineBarSpots!.first;
            _showDeletePointDialog(
              context,
              () {
                cubit.removeChartPoint(touchedSpot);
              },
            );
          }
        },
      ),
    );
  }
}

Future<void> _showDeletePointDialog(
  BuildContext context,
  Function onDelete,
) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return DeleteChartPointDialog(onDelete: onDelete);
    },
  );
}

Future<void> _showAddChartPointDialog(
  BuildContext context,
  Function(FlSpot) onAdd,
) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AddChartPointDialog(onAdd: onAdd);
    },
  );
}
