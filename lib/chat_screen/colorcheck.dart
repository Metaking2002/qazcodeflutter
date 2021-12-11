import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'backend.dart';
import 'dart:async';

class ColorCheck {
  final backend = Backend();
  int hexColor;


  Future<int> getMessageColor({String loggedInUserEmail}) async {


      // Generate random color for the user's messages
      bool isCheckPositive = false;
      while (isCheckPositive == false) {
        hexColor = (math.Random().nextDouble() * 0xFFFFFF).toInt() << 0;
        // If already used, generate another one
        isCheckPositive = !(await checkForDuplicates(hexColor: hexColor));
      }
    return hexColor;
  }

  Future<bool> checkForDuplicates({int hexColor}) async {
    bool isDuplicated = false;
    var messages = await backend.getAllMessages();
    for (var message in messages.docs) {
      int hexColorMessage = message.get('hexColor');
      if (hexColorMessage == hexColor) {
        isDuplicated = true;
        break;
      }
    }
    return isDuplicated;
  }
}