import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/enum/pet_info_enum.dart';
import 'edit_info_dialog_state.dart';

class EditInfoDialogCubit extends Cubit<InfoDialogState> {
  EditInfoDialogCubit(super.initialState);

  final db = FirebaseFirestore.instance;

  Future<void> deletePetExamInfo(int id, PetInfoType petInfoType) async {
    emit(LoadingState());

    try {
      DocumentReference docRef =
          db.collection(petInfoType.type).doc(id.toString());
      DocumentSnapshot doc = await docRef.get();
      if (!doc.exists) {
        print("Document with ID $id does not exist.");
        emit(ErrorState());
        return;
      }

      await docRef.delete();

      emit(SuccessState());
    } catch (e) {
      emit(ErrorState()); // Handle errors
    }
  }
}
