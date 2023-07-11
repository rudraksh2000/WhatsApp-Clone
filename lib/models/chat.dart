// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Chat {
  String chatMessage;
  String type;
  String date;
  String senderId;
  Chat({
    required this.chatMessage,
    required this.type,
    required this.date,
    required this.senderId,
  });

  Chat copyWith({
    String? chatMessage,
    String? type,
    String? date,
    String? senderId,
  }) {
    return Chat(
      chatMessage: chatMessage ?? this.chatMessage,
      type: type ?? this.type,
      date: date ?? this.date,
      senderId: senderId ?? this.senderId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'chatMessage': chatMessage,
      'type': type,
      'date': date,
      'senderId': senderId,
    };
  }

  factory Chat.fromMap(Map<String, dynamic> map) {
    return Chat(
      chatMessage: map['chatMessage'] as String,
      type: map['type'] as String,
      date: map['date'] as String,
      senderId: map['senderId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Chat.fromJson(String source) =>
      Chat.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Chat(chatMessage: $chatMessage, type: $type, date: $date, senderId: $senderId)';
  }

  @override
  bool operator ==(covariant Chat other) {
    if (identical(this, other)) return true;

    return other.chatMessage == chatMessage &&
        other.type == type &&
        other.date == date &&
        other.senderId == senderId;
  }

  @override
  int get hashCode {
    return chatMessage.hashCode ^
        type.hashCode ^
        date.hashCode ^
        senderId.hashCode;
  }
}
