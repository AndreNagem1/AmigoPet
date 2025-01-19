import 'package:amigo_pet/home/presentation/app_floating_action_button.dart';
import 'package:amigo_pet/home/presentation/ui/add_pet_dialog/add_pet_dialog.dart';
import 'package:amigo_pet/home/presentation/viewmodel/home_cubit.dart';
import 'package:amigo_pet/home/presentation/viewmodel/home_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../pet_details/presentation/pet_details_screen.dart';
import '../../../../tracking/presentation/tracking_screen.dart';
import '../pet_dialog/pet_dialog.dart';
import 'home_loading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit(Loading());
    cubit.loadPetInfo();

    return Scaffold(
      floatingActionButton: AppFloatingActionButton(
        onPress: () {
          _showMyDialog(context);
        },
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: BlocBuilder<HomeCubit, HomeState>(
            bloc: cubit,
            builder: (context, state) {
              if (state is ListPetInfo) {
                return ListView.builder(
                  itemBuilder: (context, position) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            navigateToPetDetails(context);
                          },
                          child: PetDialog(
                            info: state.listPetInfo[position],
                          ),
                        ),
                        SizedBox(height: 15)
                      ],
                    );
                  },
                  itemCount: state.listPetInfo.length,
                );
              }

              return HomeLoading();
            },
          ),
        ),
      ),
    );
  }

  void navigateToPetDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PetDetailsScreen()),
    );
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AddPetDialog();
      },
    );
  }
}
