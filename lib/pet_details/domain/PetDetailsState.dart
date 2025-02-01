import 'package:amigo_pet/pet_details/presentation/model/PetRemedyInfo.dart';

abstract class PetDetailsState {}

class SuccessState extends PetDetailsState {
  final List<PetRemedyInfo> data;
  SuccessState(this.data);

  List<Object> get props => [data];
}

class ErrorState extends PetDetailsState {
  List<Object> get props => [];
}

class LoadingState extends PetDetailsState {
  List<Object> get props => [];
}
