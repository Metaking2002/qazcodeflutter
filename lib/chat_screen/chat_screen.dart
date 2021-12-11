import 'package:flutter/material.dart';
import 'constants.dart';
import 'actionbtn.dart';
import 'colorcheck.dart';
import 'package:qazaccode/all_screens/myaccount.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'messagebubble.dart';
import 'messagestream.dart';
import 'backend.dart';
import 'dart:core';
import 'package:qazaccode/login/auth.dart';
class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // messageTextController to take care of erasing messages text after send
  final messageTextController = TextEditingController();
  final backend = Backend();
  final colorCheck = ColorCheck();
  String messageText;
  int hexColor;
  Color color;
@override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(messageText);
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: Text('️Общий чат',style: TextStyle(
          fontSize: width / 20,
          fontFamily: 'Montserrat',
          color: Colors.white,
        ),),
        backgroundColor: Color.fromRGBO(75, 82, 112, 1),
      ),
      body: Scaffold(
        backgroundColor: Color(0xfff1f3f6),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessagesStream(loggedInUserEmail: curentUser.email),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: kMessageContainerDecoration,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: messageTextController,
                        onChanged: (value) {
                          messageText = value;
                        },
                        decoration: kMessageTextFieldDecoration,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        messageTextController.clear();
                        Map<String, dynamic> messageInstance = {
                          'text': messageText,
                          'sender': curentUser.email,
                          'username': nameMyAccount,
                          'hexColor': hexColor,
                          'timeStamp': DateTime.now().millisecondsSinceEpoch,
                        };
                        backend.addMessage(messageInstance: messageInstance);
                      },
                      child: Icon(Icons.send,color: Color.fromRGBO(75, 82, 112, 1)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}