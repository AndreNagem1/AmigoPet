import 'package:amigo_pet/common_ui/divider.dart';
import 'package:amigo_pet/common_ui/letter_decoration.dart';
import 'package:amigo_pet/pet_details/domain/pet_expandable/pet_expandable_cubit.dart';
import 'package:amigo_pet/pet_details/presentation/pet_info_container/pet_info_spandable/pet_info_spandable_success_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../colors/app_colors.dart';
import '../../../../common_ui/surface_decoration.dart';
import '../../../../save_results_screen/photos_gallery_screen.dart';
import '../../../domain/pet_expandable/pet_expandable_state.dart';
import '../../enum/pet_info_enum.dart';
import '../add_medication_item_dialog.dart';

class PetInfoExpandable extends StatefulWidget {
  final String label;
  final PetInfoType infoType;

  const PetInfoExpandable(
      {Key? key, required this.label, required this.infoType})
      : super(key: key);

  @override
  State<PetInfoExpandable> createState() => _PetInfoExpandableState();
}

class _PetInfoExpandableState extends State<PetInfoExpandable> {
  late final PetDetailsCubit cubit;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    cubit = PetDetailsCubit(LoadingState());
    cubit.loadPetInfo(widget.infoType);
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void _toggleExpand() {
      setState(
        () {
          _isExpanded = !_isExpanded;
          if (_isExpanded) {
            if (widget.infoType.type == PetInfoType.results.type) {
              navigateToImageScreen(context);
            } else {
              cubit.loadPetInfo(widget.infoType);
            }
          }
        },
      );
    }

    return Column(
      children: [
        GestureDetector(
          onTap: _toggleExpand,
          child: Container(
            decoration:
                _isExpanded ? surfaceDecorationRoundedTop : surfaceDecoration,
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.label,
                      style: AppStyles.poppins12TextStyle,
                    ),
                    Container(
                      height: 24,
                      width: 24,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                        ),
                        color: AppColors.warmGreen.withOpacity(0.3),
                      ),
                      child: Icon(
                        _isExpanded
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                        color: AppColors.warmGreen,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                AppDivider(),
              ],
            ),
          ),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 100),
          height: _isExpanded ? 160 : 0,
          decoration: surfaceDecorationRoundedBottom,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  BlocBuilder<PetDetailsCubit, PetExpandableState>(
                    bloc: cubit,
                    builder: (context, state) {
                      return switch (state) {
                        EmptyListState() => Center(
                            child: Text(
                              "Você não possui registros",
                              style: AppStyles.poppins12TextStyle,
                            ),
                          ),
                        ErrorState() => Center(
                            child: Text(
                              "Error loading data",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        SuccessState(:final data) => Column(
                            children: data
                                .map((info) => PetInfoSpandableSuccessRow(
                                      info: info,
                                      type: widget.infoType,
                                    ))
                                .toList(),
                          ),
                        LoadingState() =>
                          const CircularProgressIndicator(), // Default case
                        _ => throw UnimplementedError(),
                      };
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _showAddMedicationDialog(
                              context,
                              widget.infoType,
                            );
                          },
                          child: Text(
                            'Adicionar  ${widget.label}',
                            style: TextStyle(color: AppColors.warmGreen),
                          ),
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              AppColors.warmGreen.withOpacity(0.3),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Future<void> _showAddMedicationDialog(
    BuildContext context, PetInfoType infoType) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AddMedicationItemDialog(
        petInfoType: infoType,
      );
    },
  );
}

void navigateToImageScreen(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PhotosGalleryScreen()),
  );
}
