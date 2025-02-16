import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class WalkingChartState {}

class ChartLoading extends WalkingChartState {}

class ChartEmpty extends WalkingChartState {}

class ChartError extends WalkingChartState {}

class ChartSuccess extends WalkingChartState {
  final List<FlSpot> data;

  ChartSuccess(this.data);
}

class WalkingChartCubit extends Cubit<WalkingChartState> {
  WalkingChartCubit(super.initialState) {
    loadChartPoints();
  }

  static const String _walkingStorageKey = "_walking_chart_data";

  void loadChartPoints() async {
    emit(ChartLoading());
    final prefs = await SharedPreferences.getInstance();
    final String? storedData = prefs.getString(_walkingStorageKey);

    List<FlSpot> list = [];
    if (storedData != null) {
      List<dynamic> decodedList = jsonDecode(storedData);

      for (int i = 0; i < decodedList.length; i++) {
        list.add(FlSpot(i.toDouble(), decodedList[i]['y'].toDouble()));
      }

      if (list.length > 30) {
        list = list.sublist(list.length - 30);
        await prefs.setString(_walkingStorageKey, jsonEncode(list));
      }
    }

    if (list.isEmpty) {
      emit(ChartEmpty());
    } else {
      emit(ChartSuccess(list));
    }
  }
}
