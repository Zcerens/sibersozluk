import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Veri extends StatefulWidget {
  // const Veri({Key? key, required this.title}) : super(key: key);

  //final String title;

  @override
  State<Veri> createState() => _VeriState();
}

class _VeriState extends State<Veri> {
  late DatabaseReference _dbref;
  String databasejson = '';
  String databasejson2 = '';

  _realdb_once() {
    _dbref.once().then((DatabaseEvent databaseEvent) {
      print(" read once - " + databaseEvent.snapshot.value.toString());
      setState(() {
        databasejson = databaseEvent.snapshot.value.toString();
      });
    });
  }

  _readdb_question() {
    _dbref
        .child("1")
        .child("AÇIKLAMA")
        .child("1")
        .once()
        .then((DatabaseEvent databaseEvent) {
      print(" read once - " + databaseEvent.snapshot.value.toString());
      setState(() {
        databasejson = databaseEvent.snapshot.value.toString();
      });
    });
  }

  _readdb_answer() {
    _dbref
        .child("0")
        .child("TERİM")
        .child("1")
        .once()
        .then((DatabaseEvent databaseEvent) {
      print(" read once - " + databaseEvent.snapshot.value.toString());
      setState(() {
        databasejson2 = databaseEvent.snapshot.value.toString();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _dbref = FirebaseDatabase.instance.reference();

    _realdb_once();
    _readdb_question();
    _readdb_answer();
    //List<String> userData = List<String>.from(_readdb_onechild());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TITLE"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Question: $databasejson',
                style: TextStyle(fontWeight: FontWeight.normal)),
            Text('Answer: $databasejson2',
                style: TextStyle(fontWeight: FontWeight.normal)),
            // buildText('New Age is: $newAge'),
            // buildText('New Age is: $newAge2'),
            // buildText('New Status is: $status'),
          ],
        ),
      ),
    );
  }
}
