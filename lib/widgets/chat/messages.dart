import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/controllers/users_manager.dart';
import 'package:whatsapp_clone/widgets/chat/chat_bubble.dart';

class Messages extends StatelessWidget {
  final String userId;
  const Messages({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final senderId =
        Provider.of<UsersManager>(context, listen: false).currentUserId;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(senderId)
          .collection("messages")
          .doc(userId)
          .collection("chats")
          .orderBy('date', descending: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text("No chats"),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text("Something went wrong"),
          );
        }
        final loadedChat = snapshot.data!.docs;
        return ListView.builder(
          itemCount: loadedChat.length,
          reverse: true,
          itemBuilder: (ctx, index) {
            if (loadedChat[index].data()['senderId'] == senderId) {
              return ChatBubble(
                isCurrentUser: true,
                chatText: loadedChat[index].data()['chatMessage'],
              );
            } else {
              return ChatBubble(
                isCurrentUser: false,
                chatText: loadedChat[index].data()['chatMessage'],
              );
            }
          },
        );
      },
    );
  }
}
