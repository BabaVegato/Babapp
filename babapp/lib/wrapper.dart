import 'package:flutter/material.dart';
import 'package:babapp/screens/profile.dart';
import 'package:provider/provider.dart';
import 'screens/home.dart';
import 'authenticate/authenticate.dart';
import 'services/user.dart';

/*
Check à l'aide du provider la valeur de "user"
Si l'utilisateur ne s'est pas identifié, le widget renvoyé sera Authenticate()
Sinon, le widget renvoyé sera HomeScreen

L'avantage étant que le check se fait en permanence : si l'utilisateur se log out,
le Wrapper renverra immédiatement Authenticate()
*/

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
          '/account': (context) => Profile(),
        },
        debugShowCheckedModeBanner: false,
      );
    }
  }
}
