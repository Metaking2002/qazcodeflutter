import 'package:flutter/material.dart';
import 'messagebubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'colorcheck.dart';
import 'package:qazaccode/all_screens/bottomnavbar.dart';
class MessagesStream extends StatelessWidget {
  MessagesStream({@required this.loggedInUserEmail});
  final _firestore = Firestore.instance;
  final String loggedInUserEmail;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:
      _firestore.collection('students').document(studentSchoolString).collection('messages').orderBy('timeStamp').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data.documents.reversed;
        List<MessageBubble> messageBubbles = [];
        for (var message in messages) {
          final messageText = message.get('text');
          final messageSenderEmail = message.get('sender');
          final messageUsername = message.get('username');
          final messageColor = ColorCheck().getMessageColor(loggedInUserEmail: message.get('sender'));
          final messageTime = message.get('timeStamp');
          // Get message time in readable format
          DateTime date = DateTime.fromMillisecondsSinceEpoch(messageTime);
          final format = DateFormat('HH:mm');
          final messTime = format.format(date);
          // Pass data to messageBubble
          final messageBubble = MessageBubble(
            sender: messageSenderEmail,
            text: messageText,
            username: messageUsername,
            time: messTime,
            isMe: (loggedInUserEmail == messageSenderEmail),
          );
          messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            reverse: true, // makes listView stick to the bottom of the view
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}