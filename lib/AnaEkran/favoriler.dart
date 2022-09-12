import 'package:flutter/material.dart';

class FavorilerPage extends StatefulWidget {
  String kelime, aciklama;
  FavorilerPage({required this.aciklama, required this.kelime});

  @override
  State<FavorilerPage> createState() => _FavorilerPageState();
}

class _FavorilerPageState extends State<FavorilerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [Text(widget.kelime)],
      )),
    );
  }
}
