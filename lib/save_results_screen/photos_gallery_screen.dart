import 'dart:io';
import 'package:amigo_pet/colors/app_colors.dart';
import 'package:amigo_pet/common_ui/letter_decoration.dart';
import 'package:amigo_pet/home/presentation/app_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'domain/image_upload_cubit.dart';
import 'image_view_screen.dart';

class PhotosGalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = ImageStorageCubit();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: AppColors.letterColor,
          ),
        ),
        title: Text(
          'Fotos',
          style: AppStyles.poppins18TextStyle,
          textAlign: TextAlign.center,
        ),
        backgroundColor: AppColors.background,
        centerTitle: true,
      ),
      floatingActionButton: AppFloatingActionButton(
        onPress: () => {cubit.pickAndSaveImage()},
      ),
      body: BlocBuilder<ImageStorageCubit, ImageState>(
        bloc: cubit,
        builder: (context, state) {
          if (state is ImageLoading) {
            return Center(
                child: CircularProgressIndicator(color: AppColors.cyan));
          } else if (state is ImageStored) {
            return state.imagePaths.isEmpty
                ? Center(
                    child: Text(
                      "Você ainda não tem fotos",
                      style: AppStyles.poppins14W400TextStyle,
                    ),
                  )
                : GridView.builder(
                    padding: EdgeInsets.all(8),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: state.imagePaths.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ImageViewScreen(
                                imagePath: state.imagePaths[index],
                              ),
                            ),
                          );
                        },
                        child: Image.file(
                          File(state.imagePaths[index]),
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
          } else if (state is ImageError) {
            return Center(
              child: Text(
                state.message,
                style: AppStyles.poppins14W400TextStyle,
              ),
            );
          }
          return Center(
            child: Text(
              "Press the camera button to save an image",
              style: AppStyles.poppins14W400TextStyle,
            ),
          );
        },
      ),
    );
  }
}
