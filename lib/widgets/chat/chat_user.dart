import 'package:flutter/material.dart';

class ChatUser extends StatelessWidget {
  const ChatUser({super.key, required this.userName});
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(userName),
    );
  }
}
