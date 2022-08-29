import 'package:flutter/material.dart';
import 'package:sibersozluk/word_find.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meta OzCe',
      theme: ThemeData(),
      home: WordFind(),
    );
  }
}
