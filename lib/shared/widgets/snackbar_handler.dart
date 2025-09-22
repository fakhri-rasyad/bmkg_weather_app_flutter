import 'package:flutter/material.dart';

class SnackbarHandlerHandler {
  static void showSnackbarHandler(String message, BuildContext ctx) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 3),
    );
    ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
  }
}
