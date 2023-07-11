import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/controllers/messages_manager.dart';
import 'package:whatsapp_clone/controllers/users_manager.dart';
import 'package:whatsapp_clone/models/auth.dart';
import 'package:whatsapp_clone/screens/chat_screen.dart';
import 'package:whatsapp_clone/utils/app_theme.dart';

class ChatUser extends StatefulWidget {
  const ChatUser({super.key, required this.user});
  final Auth user;

  @override
  State<ChatUser> createState() => _ChatUserState();
}

class _ChatUserState extends State<ChatUser> {
  @override
  Widget build(BuildContext context) {
    final senderId =
        Provider.of<UsersManager>(context, listen: false).currentUserId;
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ChatScreen.routeName, arguments: widget.user);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(widget.user.userProfileImage),
            radius: 30,
          ),
          title: Text(widget.user.userName),
          //streambuilder
          subtitle: FutureBuilder(
              future: Provider.of<MessagesManager>(context, listen: false)
                  .getLastMessage(
                widget.user.userId,
                senderId,
              ),
              builder: (ctx, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text('');
                  ;
                } else if (snapshot.hasError) {
                  return const Text('');
                }
                final String data = snapshot.data!;
                final lastChatSenderId =
                    Provider.of<MessagesManager>(context, listen: false)
                        .getLastSenderId();
                if (lastChatSenderId == senderId) {
                  return Text('\u{21C9}$data');
                }
                return Text(data);
              }),
          hoverColor: AppTheme.darkGrey,
        ),
      ),
    );
  }
}
