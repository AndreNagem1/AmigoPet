import 'package:amigo_pet/home/presentation/model/pet_dialog_info.dart';

abstract class HomeState {}

class Loading extends HomeState {
  List<Object> get props => [];
}

class ListPetInfo extends HomeState {
  ListPetInfo(this.listPetInfo);

  final List<PetDialogInfo> listPetInfo;

  List<Object> get props => [listPetInfo];
}
