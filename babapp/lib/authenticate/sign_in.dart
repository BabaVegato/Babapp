import 'package:flutter/material.dart';
import '../services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Text(
                  'Identifiez-vous',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 20.0),
                          TextFormField(
                            validator: (val) =>
                                val.isEmpty ? 'Entre un email' : null,
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            validator: (val) => val.length < 6
                                ? 'Entre un mot de passe de plus de 6 caractères'
                                : null,
                            obscureText: true,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                          ),
                          SizedBox(height: 20.0),
                          RaisedButton(
                            color: Colors.green[400],
                            child: Text(
                              'Sign in',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                dynamic result = await _auth.signInWithemail(
                                    email, password);
                                if (result == null) {
                                  setState(() => error =
                                      'Impossible de se connecter avec ces informations');
                                }
                              }
                            },
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            error,
                            style: TextStyle(color: Colors.red, fontSize: 14.0),
                          ),
                          FlatButton.icon(
                            icon: Icon(Icons.person),
                            label: Text('Register'),
                            onPressed: () {
                              widget.toggleView();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
