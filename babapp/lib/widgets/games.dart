import 'package:flutter/material.dart';
import 'bottombar.dart';
import '../screens/WelcomeToGame.dart';

class Game {
  final String title;
  final String players;
  final String author;
  final String regles;
  final String imageUrl;

  const Game(
      {this.title, this.author, this.regles, this.players, this.imageUrl});
}

class DisplayGame extends StatelessWidget {
  DisplayGame({Game game})
      : game = game,
        super(key: ObjectKey(game));
  final Game game;

  @override
  Widget build(BuildContext context) {
    double itemHeight = 120.0;
    double itemWidth = 120.0;
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          customPageRouteBuilder(WelcomeToGame(game: game)),
        )
      },
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                top: 5.0, right: 10.0, bottom: 5.0, left: 10.0),
            child: Container(
              height: itemHeight,
              width: itemWidth,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage(game.imageUrl),
                  fit: BoxFit.fill,
                ),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      color: Colors.grey[300],
                      offset: Offset(4.0, 4.0)),
                ],
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Text(game.players,
                style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                  decorationColor: Color(0xFF9B9B9B),
                  letterSpacing: 0.15,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Text(game.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  decorationColor: Color(0xFF505050),
                  letterSpacing: 0.15,
                )),
          ),
        ],
      ),
    );
  }
}

class DisplayGameList extends StatefulWidget {
  DisplayGameList({Key key, this.games}) : super(key: key);
  final List<DisplayGame> games;

  @override
  _DisplaygameListState createState() => _DisplaygameListState();
}

class _DisplaygameListState extends State<DisplayGameList> {
  /*
  faire un setState ??
  */

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
