import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sibersozluk/AnaEkran/homepage.dart';
import 'package:sibersozluk/word_find.dart';

class Navigation extends StatefulWidget {
  int index;
  Navigation({this.index = 0});

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentIndex = 0;
  final screens = [HomePage(), WordFind()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'SİBER GÜVENLİK KELİME SÖZLÜĞÜ',
          style: GoogleFonts.kanit(
              //fontStyle: FontStyle.italic,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
        centerTitle: true,
      ),
      body: screens[widget.index],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue, Colors.white60])),
        child: CurvedNavigationBar(
            index: widget.index,
            backgroundColor: Colors.white,
            animationCurve: Curves.easeOutCubic,
            color: Colors.blue.shade800,
            animationDuration: const Duration(milliseconds: 600),
            onTap: (index) => setState(() {
                  widget.index = index;
                }),
            items: const [
              Icon(
                Icons.home,
                color: Colors.white,
              ),
              Icon(
                Icons.videogame_asset,
                color: Colors.white,
              ),
              Icon(
                Icons.favorite,
                color: Colors.white,
              )
            ]),
      ),
    );
  }
}
