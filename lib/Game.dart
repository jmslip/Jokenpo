import 'dart:math';
import 'package:flutter/material.dart';
import 'package:jokenpo/JokenPoEnum.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  var _title = "JokenPo";

  Map<int, String> _imagesPath = Map();
  var _computer = JokenPoEnum.PADRAO.index;

  List _textResultList = List();
  var _textResult = 3; // Valor padrao

  var _userChoise;

  void initialize() {
    configTextResult();
    configImagesPath();
  }

  void configTextResult() {
    setState(() {
      _textResultList.insert(0, "Você venceu! :)");
      _textResultList.insert(1, "Você perdeu :(");
      _textResultList.insert(2, "Empatou!");
      _textResultList.insert(3, "Escola uma opção abaixo");
    });
  }

  void configImagesPath() {
    setState(() {
      _imagesPath[0] = "images/pedra.png";
      _imagesPath[1] = "images/papel.png";
      _imagesPath[2] = "images/tesoura.png";
      _imagesPath[3] = "images/padrao.png";
    });
  }

  String getImagePath(int key) {
    if (_imagesPath != null) {
      return _imagesPath[key];
    } else {
      return "images/padrao.png";
    }

  }

  void iaComputer(int userChoise) {
    var numberRandom = Random().nextInt(_imagesPath.length - 1);
    setState(() {
      _computer = numberRandom;
      _userChoise = userChoise;
      _textResult = calculateResult();
    });
  }

  String getTextResult(int key) {
    return _textResultList.elementAt(key);
  }

  int calculateResult() {
    if (_userChoise == _computer) {
      return 2;
    } else if (_userChoise == JokenPoEnum.PEDRA.index) {
      if (_computer == JokenPoEnum.TESOURA.index) {
        return 0;
      } else {
        return 1;
      }
    } else if (_userChoise == JokenPoEnum.PAPEL.index) {
      if (_computer == JokenPoEnum.PEDRA.index) {
        return 0;
      } else {
        return 1;
      }
    } else {
      if (_computer == JokenPoEnum.PAPEL.index) {
        return 0;
      } else {
        return 1;
      }
    }
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
                      getTextResult(_textResult),
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
                    onTap: () => iaComputer(JokenPoEnum.PEDRA.index),
                    child: Image.asset(getImagePath(JokenPoEnum.PEDRA.index), height: 95,),
                  ),
                  GestureDetector(
                    onTap: () => iaComputer(JokenPoEnum.PAPEL.index),
                    child: Image.asset(getImagePath(JokenPoEnum.PAPEL.index), height: 95,),
                  ),
                  GestureDetector(
                    onTap: () => iaComputer(JokenPoEnum.TESOURA.index),
                    child: Image.asset(getImagePath(JokenPoEnum.TESOURA.index), height: 95,)
                  ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
