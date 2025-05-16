import 'package:image_picker/image_picker.dart';

imagePicker(bool isgallery) async {
  XFile? image = await ImagePicker().pickImage(
    source: isgallery ? ImageSource.gallery : ImageSource.camera,
  );
  if (image != null) {
    return image.path;
  }
}
