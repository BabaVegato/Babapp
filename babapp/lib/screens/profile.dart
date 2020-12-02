import 'package:flutter/material.dart';
import '../widgets/bottombar.dart';
import '../services/auth.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFCFC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              Text(
                'Profil',
                style: TextStyle(
                  letterSpacing: 1.0,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: Color(0xFF505050),
                ),
              ),
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('logout'),
                onPressed: () async {
                  await _auth.signOut();
                },
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(current: 3),
    );
  }
}
