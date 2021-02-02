import 'package:demo/screens/loginscreen.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  static final String id = 'signupscreen';
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formkey = GlobalKey<FormState>();
  String _name, _email, _password;
  _submit() {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      print(_email);
      print(_name);
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
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (input) =>
                      input.trim().isEmpty ? 'Please enter a valid name' : null,
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
                    'SignUp',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 250.0,
                child: FlatButton(
                  onPressed: () => Navigator.pop(context),
                  color: Colors.blue,
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Back To Login',
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
