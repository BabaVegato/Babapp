import 'dart:math';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardProp {
  final String name;
  final String regle;
  CardProp({this.name, this.regle});
}

class HappyHour extends StatefulWidget {
  @override
  _HappyHourState createState() => _HappyHourState();
}

class _HappyHourState extends State<HappyHour> {
  bool hasToBeBuilt = true;
  var jsonResult;
  final List<String> listnames = [];
  final List<String> listregles = [];
  String cardname = '';
  List<CardProp> miniCardPropList = [];
  List<CardProp> cardPropListextern = [];
  var k = 0;

  Future<List<CardProp>> loadJson() async {
    String data = await rootBundle.loadString('assets/happyhour.json');
    jsonResult = json.decode(data);
    List<CardProp> cardPropList = [];
    for (var cards in jsonResult['cards']) {
      for (var i = 0; i < int.parse(cards['amount']); i++) {
        var newcardprop = new CardProp(
          name: cards['card'].toString(),
          regle: cards['regle'].toString(),
        );
        cardPropList.add(newcardprop);
      }
    }
    cardPropList = shuffle(cardPropList);
    cardPropListextern = cardPropList;
    for (var i = 0; i < 3; i++) {
      miniCardPropList.add(cardPropList[i]);
    }
    hasToBeBuilt = !hasToBeBuilt;
    return miniCardPropList;
  }

  Widget cartesastack(minicardPropList) {
    List<Widget> listedescartes = [];
    if (cardPropListextern.length != 0) {
      for (int i = 0; i < minicardPropList.length; i++) {
        listedescartes.add(
          Center(
            child: Dismissible(
              key: Key(k.toString()),
              onDismissed: (direction) {
                setState(() {
                  k += 1;
                  cardPropListextern.removeAt(i);
                  if (cardPropListextern.length >= 3) {
                    for (var j = 0; j < 3; j++) {
                      miniCardPropList[j] = cardPropListextern[j];
                    }
                  }
                  if (cardPropListextern.length == 2) {
                    for (var j = 0; j < 2; j++) {
                      miniCardPropList[j] = cardPropListextern[j];
                    }
                  }
                  if (cardPropListextern.length == 1) {
                    miniCardPropList = [];
                    miniCardPropList.add(cardPropListextern[0]);
                  }
                });
              },
              child: Container(
                height: 500,
                width: 300,
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.yellow,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            minicardPropList[i].name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              letterSpacing: 1.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 35.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
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
                                  minicardPropList[i].regle,
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

    if (listedescartes.length == 3) {
      var temp = listedescartes[0];
      listedescartes[0] = listedescartes[2];
      listedescartes[2] = temp;
    }
    if (listedescartes.length == 2) {
      var temp = listedescartes[0];
      listedescartes[0] = listedescartes[1];
      listedescartes[1] = temp;
    }

    return Container(
      height: 500,
      width: 300,
      child: Stack(
        children: listedescartes,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (hasToBeBuilt) {
      return new Scaffold(
        body: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 20,
            ),
            FutureBuilder(
              initialData: [
                new CardProp(
                  name: "",
                  regle: "Ça charge ...",
                )
              ],
              future: loadJson(),
              builder: (context, snapshot) {
                return Center(
                  child: cartesastack(snapshot.data),
                );
              },
            ),
          ],
        ),
      );
    } else {
      return new Scaffold(
        body: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: cartesastack(miniCardPropList),
            ),
          ],
        ),
      );
    }
  }
}

List shuffle(List items) {
  var random = new Random();

  // Go through all elements.
  for (var i = items.length - 1; i > 0; i--) {
    // Pick a pseudorandom number according to the list length
    var n = random.nextInt(i + 1);

    var temp = items[i];
    items[i] = items[n];
    items[n] = temp;
  }

  return items;
}
