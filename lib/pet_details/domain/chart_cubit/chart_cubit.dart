import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ChartCubitState {}

class ChartLoading extends ChartCubitState {}

class ChartEmpty extends ChartCubitState {}

class ChartOutOfRangeError extends ChartCubitState {
  final String errorMessage;

  ChartOutOfRangeError(this.errorMessage);
}

class ChartSuccess extends ChartCubitState {
  final List<FlSpot> chartPoints;

  ChartSuccess(this.chartPoints);
}

class ChartCubit extends Cubit<ChartCubitState> {
  ChartCubit(super.initialState) {
    loadChartPoints();
  }

  static const String _storageKey = "chart_points";

  Future<List<FlSpot>> loadChartPoints() async {
    emit(ChartLoading());
    final prefs = await SharedPreferences.getInstance();
    final String? storedData = prefs.getString(_storageKey);

    List<FlSpot> list = [];
    if (storedData != null) {
      List<dynamic> decodedList = jsonDecode(storedData);
      list = decodedList.map((e) => FlSpot(e['x'], e['y'])).toList();
    }

    if (list.isEmpty) {
      emit(ChartEmpty());
    } else {
      emit(ChartSuccess(list));
    }

    return list;
  }

  Future<void> addChartPoint(FlSpot newPoint) async {
    emit(ChartLoading());

    if (newPoint.x < 0 || newPoint.x > 11) {
      emit(ChartOutOfRangeError('O mês tem que ser de 1 até 12'));
      return;
    }

    if (newPoint.y < 0 || newPoint.y > 60) {
      emit(ChartOutOfRangeError('O peso tem que estar entre 0Kg até 60 Kg'));
      return;
    }

    final currentList = await loadChartPoints();

    final index = currentList.indexWhere((p) => p.x == newPoint.x);
    if (index != -1) {
      currentList[index] = newPoint;
    } else {
      currentList.add(newPoint);
    }

    currentList.sort((a, b) => a.x.compareTo(b.x));

    await _saveChartPoints(currentList);
    emit(ChartSuccess(currentList));
  }

  Future<void> removeChartPoint(FlSpot chartPoint) async {
    final currentList = await loadChartPoints();

    currentList.removeWhere(
        (point) => point.x == chartPoint.x && point.y == chartPoint.y);

    await _saveChartPoints(currentList);
    emit(ChartSuccess(currentList));
  }

  Future<void> _saveChartPoints(List<FlSpot> points) async {
    final prefs = await SharedPreferences.getInstance();
    final encodedList =
        jsonEncode(points.map((e) => {'x': e.x, 'y': e.y}).toList());
    await prefs.setString(_storageKey, encodedList);
  }
}
