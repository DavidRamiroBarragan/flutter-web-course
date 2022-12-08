import 'package:flutter/material.dart';

class NotificationsService {
  static GlobalKey<ScaffoldMessengerState> notificationKey = GlobalKey();

  static showSnackBarError(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red.withOpacity(0.8),
    );

    notificationKey.currentState!.showSnackBar(snackBar);
  }

  static showSnackBarSuccess(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.green.withOpacity(0.8),
    );

    notificationKey.currentState!.showSnackBar(snackBar);
  }
}
