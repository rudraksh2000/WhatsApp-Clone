import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsapp_clone/controllers/toast_manager.dart';
import 'package:whatsapp_clone/models/auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late CollectionReference _authCollection;

  AuthService() {
    _authCollection = FirebaseFirestore.instance.collection('users');
  }

  Future<String> generateNewAuthId() async {
    return _authCollection.doc().id;
  }

  Future<String?> signIn({
    required String emailId,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailId,
        password: password,
      );
      ToastManager().successToast("Successfully Signed In");
      return 'Signed In';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ToastManager().errorToast("No User Found!!!");
        return 'No User Found.';
      } else if (e.code == 'wrong-password') {
        ToastManager().errorToast("Wrong password!");
        return 'Wrong password!';
      } else {
        ToastManager().errorToast(e.message.toString());
        return e.message;
      }
    } catch (e) {
      return 'Error, Please try again later!';
    }
  }

  Future<String?> signUp({required Auth auth}) async {
    UserCredential authResult = await _auth.createUserWithEmailAndPassword(
        email: auth.userEmail, password: auth.userPassword);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(auth.userId)
        .set(auth.toMap())
        .then((value) {
      ToastManager().successToast("Succesfully added");
      return "Success";
    }).catchError((e) {
      ToastManager().errorToast("Failed to register user!!!");
      return "Error";
    });
    return null;
  }
}
