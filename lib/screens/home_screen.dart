import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';


class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DoeSangue'),
        actions: <Widget>[
          FlatButton(
            child: Row(
              children: <Widget>[Text('Sair  '), Icon(Icons.logout)],
            ),
            padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 80,
                child: Container(
                  color: Colors.grey[50],
                  child: SizedBox(
                    height: 80,
                    child: Image.asset("assets/logo.png"),
                  ),
                ),
              ),
              Column(
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    textDirection: TextDirection.ltr,
                    children: [
                      Container(
                        child: Text(
                          "Bem-Vindo, ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red[800],
                              fontSize: 20),
                        ),
                      ),
                      Container(
                        child: Text(
                          "Isabela",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Text(
                      "Sua pontuação é 200 pontos                   ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 10),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                child: Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    height: 50,
                    color: Colors.red[700],
                    child: Column(
                      children: [
                        Text(
                          "Última Doação",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "28/11/2020",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    height: 50,
                    color: Colors.red[800],
                    child: Column(
                      children: [
                        Text(
                          "Próxima Doação",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "25/01/2021",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                  "Estoque de Sangue Atual",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red[800],
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                alignment: AlignmentDirectional.center,
                height: 205,
                child: GridView.count(
                  scrollDirection: Axis.horizontal,
                  crossAxisCount: 2 ,
                  children: List.generate(opcoes.length,(index){
                    return Container(
                      child: OpcaoCard(opcao: opcoes[index]),
                      );
                  }),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
class Opcao {
  const Opcao({this.caminhoimg});
  final String caminhoimg;

}
const List<Opcao> opcoes = const <Opcao>[
  const Opcao(caminhoimg: "assets/g356.png"),
  const Opcao(caminhoimg: "assets/g726.png"),
  const Opcao(caminhoimg: "assets/g496.png"),
  const Opcao(caminhoimg: "assets/g800.png"),
  const Opcao(caminhoimg: "assets/g644.png"),
  const Opcao(caminhoimg: "assets/g866.png"),
  const Opcao(caminhoimg: "assets/g570.png"),
  const Opcao(caminhoimg: "assets/g940.png"),
];


class OpcaoCard extends StatelessWidget {
  const OpcaoCard({Key key, this.opcao}) : super(key: key);
  final Opcao opcao;
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
        color: Colors.white38,
        child: Center(
          child: Image.asset(opcao.caminhoimg),
        )
    );
  }
}
