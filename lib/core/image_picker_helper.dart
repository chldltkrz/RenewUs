import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

class PickImageResult {
  final String filename;
  final String mimeType;
  final Uint8List bytes;
  PickImageResult({
    required this.filename,
    required this.mimeType,
    required this.bytes,
  });
}

class ImagePickerHelper {
  // imagepicker로 사진불러와서 mime패키지로 mimetype읽은후 함께 돌려줘야 하기 때문에

  static Future<PickImageResult?> pickImage() async {
    final imagePicker = ImagePicker();
    final xFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      final bytes = await xFile.readAsBytes();
      final filename = xFile.name;
      // 파일 바이트 데이터 구조를 파싱해서 마임타입을 리턴해줌
      final mimeType = lookupMimeType(xFile.path, headerBytes: bytes);
      if (mimeType == null) {
        return null;
      }
      return PickImageResult(
        filename: filename,
        mimeType: mimeType,
        bytes: bytes,
      );
    }
    return null;
  }
}
