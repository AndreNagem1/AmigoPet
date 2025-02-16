import 'package:amigo_pet/pet_details/presentation/model/walking_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class PetDialogState {}

class PetDialogLoading extends PetDialogState {}

class PetDialogIdle extends PetDialogState {}

class PetDialogError extends PetDialogState {}

class PetDialogStartedWalk extends PetDialogState {}

class PetDialogFinishWalk extends PetDialogState {}

class PetDialogShowRegisterWalk extends PetDialogState {
  final WalkingInfo info;

  PetDialogShowRegisterWalk(this.info);
}

class PetDialogCubit extends Cubit<PetDialogState> {
  PetDialogCubit(super.initialState) {
    loadWalkInfo();
  }

  final db = FirebaseFirestore.instance;

  void startWalk() async {
    emit(PetDialogLoading());
    try {
      CollectionReference collectionRef = db.collection("passeio");

      Map<String, dynamic> data = {
        'isWalking': true,
        'date': DateTime.now().toString()
      };

      await collectionRef.doc('passeio').set(data);

      emit(PetDialogStartedWalk());
    } catch (e) {
      emit(PetDialogError());
    }
  }

  void stopWalk() async {
    emit(PetDialogLoading());
    try {
      CollectionReference collectionRef = db.collection("passeio");

      final walkingInfo = await loadWalkInfo();

      Map<String, dynamic> data = {
        'isWalking': false,
        'date': DateTime.now().toString(),
      };

      await collectionRef.doc('passeio').set(data);

      if (walkingInfo != null) {
        emit(PetDialogShowRegisterWalk(walkingInfo));
      } else {
        emit(PetDialogError());
      }
    } catch (e) {
      emit(PetDialogError());
    }
  }

  Future<WalkingInfo?> loadWalkInfo() async {
    emit(PetDialogLoading());

    try {
      WalkingInfo? walkingInfo;

      var event = await db.collection('passeio').get();

      if (event.docs.isEmpty) {
        emit(PetDialogIdle());
        print("No data found");
        return null;
      }

      var doc = event.docs.first;
      walkingInfo = WalkingInfo(
        isWalking: doc['isWalking'],
        date: DateTime.parse(doc['date']),
      );

      if (walkingInfo.isWalking) {
        emit(PetDialogStartedWalk());
      } else {
        emit(PetDialogIdle());
      }
      return walkingInfo;
    } catch (error) {
      emit(PetDialogError());
      print('Failed to load walking: $error');
    }
    return null;
  }

  void resetState() async {
    emit(PetDialogIdle());
  }
}
