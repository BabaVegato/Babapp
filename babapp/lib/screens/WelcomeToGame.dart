import 'dart:ui';
import 'package:babapp/games/HappyHour/happyhour.dart';
import 'package:babapp/widgets/games.dart';
import 'package:flutter/material.dart';
import '../widgets/games.dart';
import '../widgets/bottombar.dart';

class WelcomeToGame extends StatefulWidget {
  WelcomeToGame({Game game})
      : game = game,
        super(key: ObjectKey(game));
  final Game game;
  @override
  _WelcomeToGameState createState() => _WelcomeToGameState();
}

class _WelcomeToGameState extends State<WelcomeToGame> {
  @override
  Widget build(BuildContext context) {
    double boxheight = MediaQuery.of(context).size.height - 100;
    double boxwidth = MediaQuery.of(context).size.width - 50;
    String author = widget.game.author == null ? '' : widget.game.author;
    String regles = widget.game.regles == null ? '' : widget.game.regles;

    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: SafeArea(
        child: Center(
          child: Container(
            height: boxheight,
            width: boxwidth,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    // Partie haute de la page
                    Stack(
                      children: [
                        // Image
                        Container(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Container(
                              color: Colors.white.withOpacity(0.3),
                            ),
                          ),
                          height: 150,
                          width: boxwidth,
                          decoration: new BoxDecoration(
                            image: new DecorationImage(
                              image: new AssetImage(widget.game.imageUrl),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 5,
                                  color: Colors.grey[300],
                                  offset: Offset(4.0, 4.0)),
                            ],
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.zero,
                                bottomRight: Radius.zero),
                          ),
                        ),
                        // Boutons
                        ButtonBar(
                          alignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(
                                Icons.arrow_back,
                              ),
                            ),
                            IconButton(
                              onPressed: () => {},
                              icon: Icon(
                                Icons.add_comment,
                              ),
                            ),
                          ],
                        ),
                        //Auteur
                        Positioned(
                          bottom: 50,
                          left: 15,
                          child: Row(
                            children: [
                              Text(
                                author,
                                style: TextStyle(
                                  letterSpacing: 1.0,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        //Titre
                        Positioned(
                          bottom: 10,
                          left: 15,
                          child: Row(
                            children: [
                              Text(
                                widget.game.title,
                                style: TextStyle(
                                  letterSpacing: 1.0,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35.0,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // Résumé du livre
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 50,
                          bottom: 10,
                          right: 30,
                          left: 30,
                        ),
                        child: Scrollbar(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text(
                              regles,
                              style: TextStyle(
                                letterSpacing: 1.0,
                                fontSize: 20.0,
                                color: Color(0xFF505050),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Bouton "Débuter la lecture"
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: RaisedButton(
                          elevation: 0,
                          onPressed: () => {
                            Navigator.push(
                              context,
                              customPageRouteBuilder(HappyHour()),
                            )
                          },
                          color: Colors.green[400],
                          child: new Text(
                            "    Commencer le jeu !    ",
                            style: TextStyle(
                              letterSpacing: 1.0,
                              fontFamily: 'Roboto',
                              fontSize: 15.0,
                            ),
                          ),
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
