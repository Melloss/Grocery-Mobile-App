import 'package:get/get.dart';
import 'package:flutter/material.dart' show EdgeInsets, Color;

void getSnackBar(String title, String message) {
  Get.snackbar(
    title,
    message,
    colorText: const Color.fromARGB(255, 80, 39, 1),
    margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    snackPosition: SnackPosition.BOTTOM,
  );
}
