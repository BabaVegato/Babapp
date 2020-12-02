import 'package:flutter/material.dart';
import 'package:babapp/screens/home.dart';
import 'package:babapp/screens/profile.dart';

/*

*/

class BottomBar extends StatefulWidget {
  final int current;
  const BottomBar({Key key, this.current}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  //current_Index identifie sur quel bouton de la BottonBar on est
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green[400],
        currentIndex: widget.current,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Accueil'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favoris'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profil'),
          ),
        ],
        onTap: (index) {
          setState(() {
            switch (index) {
              case 0:
                if (widget.current != 0)
                  Navigator.push(
                    context,
                    customPageRouteBuilder(Home()),
                  );
                break;
              case 1:
                if (widget.current != 1)
                  Navigator.push(
                    context,
                    customPageRouteBuilder(Home()),
                  );
                break;
              case 3:
                if (widget.current != 3)
                  Navigator.push(
                    context,
                    customPageRouteBuilder(Profile()),
                  );
                break;
              default:
              //Navigator.pushNamed(context, '/');
            }
            //_currentIndex = index;
          });
        });
  }
}

PageRouteBuilder customPageRouteBuilder(Widget pageToGo) {
  return PageRouteBuilder(
    transitionDuration: Duration(seconds: 0),
    transitionsBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secanimation,
      Widget child,
    ) {
      return ScaleTransition(
        alignment: Alignment.center,
        scale: animation,
        child: child,
      );
    },
    pageBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secanimation,
    ) {
      return pageToGo;
    },
  );
}
