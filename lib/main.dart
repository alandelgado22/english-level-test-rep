import 'package:flutter/material.dart';
import 'screens/input_screen.dart';
import 'package:emailjs/emailjs.dart' as emailjs;
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() {
  dotenv.load(fileName: ".env");
  emailjs.init(
    const emailjs.Options(
      publicKey: 'D4KNNO_67cy9aKy51',
      privateKey: '5iIffRCgGrelRsyZmeIQj', // Paste here
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'English Level Test',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const InputScreen(),
    );
  }
}