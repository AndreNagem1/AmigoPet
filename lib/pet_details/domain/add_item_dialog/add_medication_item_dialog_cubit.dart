import 'package:amigo_pet/pet_details/domain/add_item_dialog/add_medication_item_dialog_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/enum/pet_info_enum.dart';
import '../../presentation/model/PetRemedyInfo.dart';

class AddMedicationItemDialogCubit extends Cubit<AddMedicationItemDialogState> {
  AddMedicationItemDialogCubit(super.initialState);

  final db = FirebaseFirestore.instance;

  Future<void> savePetExamInfo(
      PetRemedyInfo petRemedyInfo, PetInfoType petInfoType) async {
    emit(LoadingState());
    DateTime now = DateTime.now();

    Map<String, dynamic> data = {
      'name': petRemedyInfo.name,
      'date': petRemedyInfo.date.toString(),
      'recurrent': petRemedyInfo.isRecurrent,
      'recurrenceInDays': petRemedyInfo.recurrenceInDays,
    };

    await db.collection(petInfoType.type).doc().set(data);
  }
}
