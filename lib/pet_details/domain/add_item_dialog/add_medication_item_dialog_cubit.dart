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

    try {
      CollectionReference collectionRef = db.collection(petInfoType.type);

      QuerySnapshot snapshot = await collectionRef.get();

      int nextId = 0;
      if (snapshot.docs.isNotEmpty) {
        List<int> ids = snapshot.docs
            .map((doc) => int.tryParse(doc.id) ?? -1)
            .where((id) => id >= 0)
            .toList();

        if (ids.isNotEmpty) {
          nextId = ids.reduce((a, b) => a > b ? a : b) + 1;
        }
      }

      Map<String, dynamic> data = {
        'id': nextId,
        'name': petRemedyInfo.name,
        'date': petRemedyInfo.date.toString(),
        'recurrent': petRemedyInfo.isRecurrent,
        'recurrenceInDays': petRemedyInfo.recurrenceInDays,
      };

      await collectionRef.doc(nextId.toString()).set(data);

      emit(SuccessState());
    } catch (e) {
      emit(ErrorState());
    }
  }
}
