import 'package:amigo_pet/home/presentation/model/pet_dialog_info.dart';
import 'package:amigo_pet/home/presentation/viewmodel/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(super.initialState);

  void loadPetInfo() async {
    emit(Loading());
    await Future.delayed(Duration(milliseconds: 300));
    emit(ListPetInfo(listPetInfo));
  }

  void initBackgroundTracking() {}
}

final listPetInfo = [
  PetDialogInfo(
    image: 'assets/images/diana.jpg',
    name: 'Diana',
    birthday: '20 de Fevereiro',
    foodSupply: 'Comprar mais comida',
    vaccines: 'Vacinas - Em dia',
    remedies: 'Remédios - Em dia',
    onWalk: true,
  ),
  PetDialogInfo(
    image: 'assets/images/cachorro.jpg',
    name: 'Charllote',
    birthday: '15 de Março',
    foodSupply: 'Comprar mais comida',
    vaccines: 'Vacinas - Em dia',
    remedies: 'Remédios - Em dia',
    onWalk: false,
  ),
];
