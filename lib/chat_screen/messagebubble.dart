import 'package:flutter/material.dart';
import 'colorcheck.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(
      { this.sender,
       this.text,
       this.time,
       this.isMe,
       this.username,
      this.hexColor});
  final String sender;
  final String text;
  final String username;
  final String time;
  final int hexColor;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            time,
            style: TextStyle(
              fontSize: 11.0,
              fontWeight: FontWeight.w700,
              color: Colors.black54,
            ),
          ),
          Text(
            isMe ? 'вы' : username,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: isMe
                    ? BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        bottomLeft: Radius.circular(40.0),
                        topRight: Radius.circular(30.0),
                        bottomRight: Radius.circular(5),
                      )
                    : BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                gradient: isMe
                    ? LinearGradient(colors: [
                        Color.fromRGBO(75, 82, 112, 1),
                        Color.fromRGBO(75, 82, 112, 1)
                      ])
                    : LinearGradient(
                        colors: [Color(0xffffc658), Color(0xffffc658)])),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.white,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
