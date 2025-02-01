import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/model/PetRemedyInfo.dart';
import 'PetDetailsState.dart';

class PetDetailsCubit extends Cubit<PetDetailsState> {
  PetDetailsCubit(super.initialState);

  final db = FirebaseFirestore.instance;

  Future<List<PetRemedyInfo>> loadPetInfo() async {
    emit(LoadingState());

    List<PetRemedyInfo> listPetRemedies = [];

    try {
      await db.collection("remedy").get().then((event) {
        for (var doc in event.docs) {
          final petRemedyInfo = PetRemedyInfo(
            date: doc['date'],
            name: doc['name'],
            isRecurrent: doc['recurrent'],
            recurrenceInDays: doc['recurrenceInDays'],
          );

          listPetRemedies.add(petRemedyInfo);
        }
      });
    } catch (error) {
      print('Failed to update document: $error');
    }

    return listPetRemedies;
  }

  Future<void> savePetRemedyInfo(PetRemedyInfo petRemedyInfo) async {
    emit(LoadingState());

    Map<String, dynamic> data = {
      'name': petRemedyInfo.name,
      'date': petRemedyInfo.date,
      'description': petRemedyInfo.isRecurrent,
      'phoneNumber': petRemedyInfo.recurrenceInDays,
    };

    await db.collection('favorites').doc("remedy").set(data);
  }

  Future<void> savePetExamInfo(PetRemedyInfo petRemedyInfo) async {
    emit(LoadingState());

    Map<String, dynamic> data = {
      'name': petRemedyInfo.name,
      'date': petRemedyInfo.date,
      'description': petRemedyInfo.isRecurrent,
      'phoneNumber': petRemedyInfo.recurrenceInDays,
    };

    await db.collection('favorites').doc("remedy").set(data);
  }

  Future<void> savePetInfo(PetRemedyInfo petRemedyInfo) async {
    emit(LoadingState());

    Map<String, dynamic> data = {
      'name': petRemedyInfo.name,
      'date': petRemedyInfo.date,
      'description': petRemedyInfo.isRecurrent,
      'phoneNumber': petRemedyInfo.recurrenceInDays,
    };

    await db.collection('favorites').doc("remedy").set(data);
  }
}
