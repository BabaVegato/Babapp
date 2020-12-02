import 'package:flutter/material.dart';
import '../widgets/games.dart';

class BookCarousel extends StatefulWidget {
  @override
  _BookCarouselState createState() => _BookCarouselState();
}

class _BookCarouselState extends State<BookCarousel> {
  final double itemHeight = 150.0;
  final double itemWidth = 150.0;
  final List<Game> books = [
    Game(
        players: "Autant de joueurs qu'il faut",
        title: 'Happy Hour',
        author: "Inspiré du jeu ''Happy Hour''",
        regles:
            "Insulter, pointer du doigt et le non respect des autres règles implique de boire une gorgée. Le téléphone passe et indique ce que le joueur concerné doit faire. Le concerné effectue l'action, puis passe le portable dans les aiguilles d'une montre.",
        imageUrl: 'assets/beer.jpg'),
    Game(
        players: '4 joueurs',
        title: 'Jenga speed',
        imageUrl: 'assets/jenga.jpg'),
    Game(
        players: 'Deux équipes',
        title: 'Quizz à rebours',
        imageUrl: 'assets/clock.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Column(
        children: <Widget>[
          Container(
            height: 240.0,
            color: Color(0xFFFCFCFC),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: books.length,
                itemBuilder: (BuildContext context, int index) {
                  Game game = books[index];
                  return DisplayGame(
                    game: game,
                  );
                }),
          )
        ],
      ),
    );
  }
}
