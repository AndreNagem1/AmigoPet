import 'dart:convert';

import 'package:amigo_pet/pet_details/domain/pet_expandable/pet_expandable_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/enum/pet_info_enum.dart';
import '../../presentation/model/PetRemedyInfo.dart';

class PetDetailsCubit extends Cubit<PetExpandableState> {
  PetDetailsCubit(super.initialState);

  final db = FirebaseFirestore.instance;

  Future<void> loadPetInfo(PetInfoType infoType) async {
    emit(LoadingState());

    List<PetRemedyInfo> listPetRemedies = [];

    try {
      await db.collection(infoType.type).get().then((event) {
        for (var doc in event.docs) {
          final petRemedyInfo = PetRemedyInfo(
            Id: doc['id'],
            date: DateTime.parse(doc['date']),
            name: doc['name'],
            isRecurrent: doc['recurrent'],
            recurrenceInDays: doc['recurrenceInDays'],
          );

          listPetRemedies.add(petRemedyInfo);
        }
      });
    } catch (error) {
      emit(ErrorState());
      print('Failed to load document: $error');
    }

    if (listPetRemedies.isEmpty) {
      emit(EmptyListState());
    } else {
      emit(SuccessState(listPetRemedies));
    }
  }
}
