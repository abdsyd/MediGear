import 'package:flutter/material.dart';
import 'package:get/get.dart';

GetSnackBar mySnackBar({required String messageText}) {
  return GetSnackBar(
    messageText: Text(
      messageText,
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.grey.shade400,
    duration: const Duration(milliseconds: 800),
    borderRadius: 30,
    maxWidth: 150,
    margin: const EdgeInsets.only(bottom: 50),
  );
}