import 'package:amigo_pet/pet_details/presentation/model/PetRemedyInfo.dart';

abstract class PetExpandableState {}

class SuccessState extends PetExpandableState {
  final List<PetRemedyInfo> data;

  SuccessState(this.data);

  List<Object> get props => [data];
}

class LoadingState extends PetExpandableState {
  List<Object> get props => [];
}

class ErrorState extends PetExpandableState {
  List<Object> get props => [];
}

class EmptyListState extends PetExpandableState {
  List<Object> get props => [];
}

