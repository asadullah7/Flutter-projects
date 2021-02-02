import 'package:demo/screens/signupscreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static final String id = 'loginscreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  String _email, _password;
  _submit() {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      print(_email);
      print(_password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'Instagram',
          style: TextStyle(fontFamily: 'Billabong', fontSize: 50.0),
        ),
        Form(
          key: _formkey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (input) => !input.contains('@')
                      ? 'please enter a valid email'
                      : null,
                  onSaved: (input) => _email = input,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  validator: (input) => input.length < 6
                      ? 'Password must be at least 6 characters'
                      : null,
                  onSaved: (input) => _password = input,
                  obscureText: true,
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 250.0,
                child: FlatButton(
                  onPressed: _submit,
                  color: Colors.blue,
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 250.0,
                child: FlatButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, SignupScreen.id),
                  color: Colors.blue,
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'SignUp',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    )));
  }
}
