import 'dart:io';

import 'package:amigo_pet/colors/app_colors.dart';
import 'package:amigo_pet/common_ui/highlighted_text.dart';
import 'package:amigo_pet/common_ui/letter_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../common_ui/surface_decoration.dart';
import 'domain/image_upload_cubit.dart';

class ImageViewScreen extends StatelessWidget {
  final String imagePath;

  ImageViewScreen({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final cubit = ImageStorageCubit();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Image.file(File(imagePath)),
            SizedBox(height: 28),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: surfaceDecoration,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Deletar',
                      style: AppStyles.poppins14W400TextStyle,
                    ),
                    SizedBox(width: 95),
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: AppColors.pastelOrange,
                      ),
                      onPressed: () {
                        _confirmDelete(context, cubit);
                      },
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: surfaceDecoration,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Compartilhar',
                      style: AppStyles.poppins14W400TextStyle,
                    ),
                    SizedBox(width: 70),
                    IconButton(
                      icon: Icon(
                        Icons.share,
                        color: AppColors.cyan,
                      ),
                      onPressed: () async {
                        await Share.shareXFiles(
                          [XFile(imagePath)],
                          text: "Segue a foto da bebe",
                        );
                      },
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context, ImageStorageCubit cubit) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: Text(
          "Deletar imagem",
          style: AppStyles.poppins18TextStyle,
        ),
        content: Text(
          "Tem certeza que deseja deletar essa imagem?",
          style: AppStyles.poppins12TextStyle,
        ),
        actions: [
          TextButton(
            child: Text(
              "Cancelar",
              style: AppStyles.poppins12TextStyle,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: HighLightedText(
              label: "Deletar",
              labelColor: AppColors.pastelOrange,
            ),
            onPressed: () {
              cubit.deleteImage(imagePath);
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Go back to gallery
            },
          ),
        ],
      ),
    );
  }
}
