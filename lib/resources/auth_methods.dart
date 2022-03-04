import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram/resources/storage_methods.dart';

class AuthMethod {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpMethod({
    required String email,
    required String username,
    required String password,
    required String bio,
    required Uint8List file,
  }) async {
    String res = 'Some error occurred';
    try {
      if (email.isNotEmpty ||
          username.isNotEmpty ||
          password.isNotEmpty ||
          bio.isNotEmpty) {
        //sign up
        UserCredential userCredential = await _firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);
        //upload avatar
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);
        //add collection to firestore
        print(userCredential.user!.uid);
        await _firestore.collection('user').doc(userCredential.user!.uid).set({
          'username': username,
          'email': email,
          'password': password,
          'uid': userCredential.user!.uid,
          'bio': bio,
          'follower': [],
          'following': [],
          'photoUrl': photoUrl,
        });
        res = 'success';
      }
    } catch (error) {
      res = error.toString();
    }
    print(res);
    return res;
  }
}
