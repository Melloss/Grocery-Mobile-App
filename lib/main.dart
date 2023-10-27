import 'package:flutter/material.dart';

class GloceryApp extends StatelessWidget {
  const GloceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Glocery Mobile App',
    );
  }
}

main() {
  runApp(const GloceryApp());
}
