import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  // Get a non-default Storage bucket
  final _storage = FirebaseStorage.instanceFor(
      bucket: "gs://whatsappclone-da388.appspot.com");

  StorageService();

  Future<String> getUserProfileImage({
    required String userId,
    required File fileName,
  }) async {
    try {
      log("Uploading proflie image...");
      var destination = "Users/$userId";
      log(destination);
      await _storage.ref(destination).putFile(fileName);
      final ref = _storage.ref().child(destination);
      var url = ref.getDownloadURL();
      log(url.toString());
      return url;
    } on FirebaseException catch (e) {
      log(e.message ?? '');
      return e.message ?? '';
    }
  }
}
