import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final ImagePicker _picker = ImagePicker();
// Pick an image
  final XFile? image = await _picker.pickImage(source: source);
  if (image != null) {
    return image.readAsBytes();
  }
  print('No Image Selected');
}
