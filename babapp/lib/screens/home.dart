import 'package:flutter/material.dart';
import '../widgets/gameCarousel.dart';
import '../widgets/bottombar.dart';

/*
TO DO:
  - Dé-commenter le carousel "Recommandé pour vous"
    lorsque les algos de suggestions seront opérationnels
*/

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFCFC),
      body: SafeArea(
        child: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 30.0, bottom: 25.0),
            child: Text(
              'Accueil',
              style: TextStyle(
                letterSpacing: 1.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Color(0xFF505050),
              ),
            ),
          ),
          /*
            En cours de lecture
            */
          Padding(
            padding: const EdgeInsets.only(left: 30.0, bottom: 20.0),
            child: Text(
              'En cours de lecture',
              style: TextStyle(
                letterSpacing: 1.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                color: Color(0xFF505050),
              ),
            ),
          ),
          BookCarousel(),
          SizedBox(height: 30.0),
          /*
            Dernières parutions
            */
          Padding(
            padding: const EdgeInsets.only(left: 30.0, bottom: 20.0),
            child: Text(
              'Dernières parutions',
              style: TextStyle(
                letterSpacing: 1.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                color: Color(0xFF505050),
              ),
            ),
          ),
          BookCarousel(),
        ]),
      ),
      bottomNavigationBar: BottomBar(current: 0),
    );
  }
}
