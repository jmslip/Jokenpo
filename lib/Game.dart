import 'dart:math';

import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  var _title = "JokenPo";
  Map<String, String> _imagesPath = Map();
  var _computer = "padrao";

  void initialize() {
    configImagesPath();
  }

  void configImagesPath() {
    _imagesPath["pedra"] = "images/pedra.png";
    _imagesPath["papel"] = "images/papel.png";
    _imagesPath["tesoura"] = "images/tesoura.png";
    _imagesPath["padrao"] = "images/padrao.png";
  }

  String getImagePath(String key) {
    return _imagesPath[key];
  }

  void iaComputador() {
    var numberRandom = Random().nextInt(max)
  }

  @override
  Widget build(BuildContext context) {
    initialize();
    return Scaffold(
      appBar: AppBar(
        title: Text(_title)
      ),
      body: Center(
        child: Container(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 32, bottom: 16),
                child: Text(
                  "Escolha do App:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  )
                )
              ),
              Image.asset(getImagePath(_computer)),
              Padding(
                  padding: EdgeInsets.only(top: 32, bottom: 16),
                  child: Text(
                      "Escolha uma opção abaixo",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      )
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){print(getImagePath("padrao"));},
                    child: Image.asset(getImagePath("pedra"), height: 95,),
                  ),
                  Image.asset("images/papel.png", height: 95,),
                  Image.asset("images/tesoura.png", height: 95,)
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
