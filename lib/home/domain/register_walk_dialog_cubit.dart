import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RegisterWalkDialogState {}

class Loading extends RegisterWalkDialogState {}

class Idle extends RegisterWalkDialogState {}

class RegisterWalkDialogCubit extends Cubit<RegisterWalkDialogState> {
  RegisterWalkDialogCubit(super.initialState);

  static const String _walkingStorageKey = "_walking_chart_data";

  Future<void> saveChartPoints(int walkInMinutes) async {
    emit(Loading());

    final dateNow = DateTime.now();
    final registeredDate = "${dateNow.day}${dateNow.month}";

    final prefs = await SharedPreferences.getInstance();
    final String? storedData = prefs.getString(_walkingStorageKey);

    List<Map<String, dynamic>> list = [];

    if (storedData != null) {
      List<dynamic> decodedList = jsonDecode(storedData);
      list = decodedList.map((e) => {'x': e['x'], 'y': e['y']}).toList();
    }

    final existingIndex = list.indexWhere((entry) => entry['x'] == registeredDate);

    if (existingIndex != -1) {
      list[existingIndex]['y'] = (list[existingIndex]['y'] as int) + walkInMinutes;
    } else {
      list.add({'x': registeredDate, 'y': walkInMinutes});
    }

    if (list.length > 30) {
      list = list.sublist(list.length - 30);
    }

    await prefs.setString(_walkingStorageKey, jsonEncode(list));
  }

}
