import 'package:flutter/widgets.dart';
import 'package:whatsapp_clone/models/auth.dart';
import 'package:whatsapp_clone/models/users.dart';
import 'package:whatsapp_clone/services/users_service.dart';

class UsersManager with ChangeNotifier {
  late UsersService usersService;
  late String currentUserId;
  late Users? data = null;

  UsersManager() {
    usersService = UsersService();
    currentUserId = "";
  }

  Future<void> getUserDetails(String userEmail, String userPassword) async {
    data = await usersService.getUsersDetails(userEmail, userPassword);
    currentUserId = data!.user.userId;
    notifyListeners();
  }

  Future<List<Users>> getAllUsers(String userEmail, String userPassword) async {
    return await usersService.getAllUsersDetails(userEmail, userPassword);
  }

  Users? get userData => data;

  String get userId => currentUserId;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    data = null;
    currentUserId = "";
  }
}
