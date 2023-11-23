import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nov21/firebase_options.dart';
import 'package:nov21/get_count_value_builder_view.dart';
import 'package:nov21/get_count_value_view.dart';
import 'package:nov21/save_user_view.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GetCountValueBuilderView(),
    );
  }
}
