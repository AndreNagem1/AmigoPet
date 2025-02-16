import 'dart:convert';

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

    final prefs = await SharedPreferences.getInstance();
    final String? storedData = prefs.getString(_walkingStorageKey);

    List<Map<String, dynamic>> list = [];

    if (storedData != null) {
      List<dynamic> decodedList = jsonDecode(storedData);
      list = decodedList.map((e) => {'x': e['x'], 'y': e['y']}).toList();
    }

    int nextX = list.isNotEmpty ? (list.last['x'] as int) + 1 : 0;

    list.add({'x': nextX, 'y': walkInMinutes});

    if (list.length > 30) {
      list = list.sublist(list.length - 30);
    }

    await prefs.setString(_walkingStorageKey, jsonEncode(list));
  }


}
