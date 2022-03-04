import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StorageMethods {
  final _storage = FirebaseStorage.instance;
  final _auth = FirebaseAuth.instance;

  //add image to firebase storage
  Future<String> uploadImageToStorage(
      String child, Uint8List file, bool isPost) async {
    Reference ref = _storage.ref().child(child).child(_auth.currentUser!.uid);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
