import 'package:flutter/material.dart';

import 'login_screen.dart';

class HomeScreen extends StatelessWidget {

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ('Tela Inicial'),
        actions: <Widget>[
          FlatButton(
            child: Row (
              children: <Widget> [
                Text ('Sair  '),
                Icon (Icons.logout)
              ],
            ),
            padding: EdgeInsets.fromLTRB(0,0,25,0),
            textColor: Colors.white,
            onPressed: (){
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
            },
          ),
        ],
      ),
      body: Row (
        children: <Widget>[
          Container (
            child: Expanded(
              child: Container(
                height: 50,
                color: Colors.blue,
              ),
            ),
          ),
          Container (
            child: Expanded(
              child: Container(
                height: 50,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
