import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:whatsapp_clone/utils/app_theme.dart';

class ToastManager extends ChangeNotifier {
  late Fluttertoast _fToast;

  //Making ErrorManager Singleton
  static final ToastManager _instance = ToastManager._internal();

  factory ToastManager() {
    return _instance;
  }

  ToastManager._internal() {
    _fToast = Fluttertoast();
  }

  void successToast(String message) {
    Fluttertoast.showToast(
        msg: "$message",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void errorToast(String message) {
    Fluttertoast.showToast(
        msg: "$message",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void notificationToast(String message) {
    Fluttertoast.showToast(
        msg: "$message",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppTheme.nearlyBlue,
        textColor: Colors.white,
        fontSize: 16.0);

    @override
    void dispose() {
      // TODO: implement dispose
      super.dispose();
    }

/*  void clearToastQueue() {
    customToast.removeQueuedCustomToasts();
  }

  //
  void removeToast() {
    customToast.removeCustomToast();
  }*/
  }
}
