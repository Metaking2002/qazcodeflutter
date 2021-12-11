import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  hoverColor: Colors.red,
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Введите свое сообщение здесь...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
 color: Colors.white,
  borderRadius: BorderRadius.all(Radius.circular(40)),
  boxShadow: [
  BoxShadow(
  color: Colors.black87,
  blurRadius: 60.0, // has the effect of softening the shadow
  spreadRadius: 0.0, // has the effect of extending the shadow
  offset: Offset(
    0.0, // horizontal, move right 10
    30.0, // vertical, move down 10
  ),
)
],
);
