import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

abstract class ImageState {}

class ImageInitial extends ImageState {}

class ImageLoading extends ImageState {}

class ImageStored extends ImageState {
  final List<String> imagePaths;

  ImageStored(this.imagePaths);
}

class ImageError extends ImageState {
  final String message;

  ImageError(this.message);
}

class ImageStorageCubit extends Cubit<ImageState> {
  final ImagePicker _picker = ImagePicker();
  late Box<String> imageBox;

  ImageStorageCubit() : super(ImageInitial()) {
    _init();
  }

  Future<void> _init() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    imageBox = await Hive.openBox<String>('images');
    emit(ImageStored(imageBox.values.toList()));
  }

  Future<void> pickAndSaveImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      if (image == null) return;

      emit(ImageLoading());

      final directory = await getApplicationDocumentsDirectory();
      final newPath =
          '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
      final File newImage = await File(image.path).copy(newPath);

      imageBox.add(newImage.path);
      emit(ImageStored(imageBox.values.toList()));
    } catch (e) {
      emit(ImageError("Error saving image: $e"));
    }
  }

  Future<void> deleteImage(String imagePath) async {
    try {
      final file = File(imagePath);
      if (file.existsSync()) {
        file.deleteSync();
      }

      final index = imageBox.values.toList().indexOf(imagePath);
      if (index != -1) {
        await imageBox.deleteAt(index);
      }

      emit(ImageStored(imageBox.values.toList()));
    } catch (e) {
      emit(ImageError("Error deleting image: $e"));
    }
  }

}
