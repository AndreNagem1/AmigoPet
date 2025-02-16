import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SplashScreenState {}

class LoadingState extends SplashScreenState {}

class SuccessState extends SplashScreenState {
  final bool shouldUpdate;

  SuccessState(this.shouldUpdate);
}

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit(super.initialState) {
    _checkUpdateApp();
  }

  final db = FirebaseFirestore.instance;

  void _checkUpdateApp() async {
    emit(LoadingState());

    bool shouldUpdate = false;

    try {
      await db.collection('versao').get().then((event) {
        for (var doc in event.docs) {
          shouldUpdate = doc['version'];
        }
      });
    } catch (error) {
      print('Failed to load document: $error');
    }

    emit(SuccessState(shouldUpdate));
  }
}
