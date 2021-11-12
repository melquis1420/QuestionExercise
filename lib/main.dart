import './questao.dart';
import './resposta.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> perguntas = [
      {
        'texto': 'Qual a sua cor favorita? ', //string
        'respostas': ['Preto', 'Branco', 'Azul', 'Amarelo'], //object
      },
      {
        'texto': 'Qual o seu animal favorito?',
        'respostas': ['Dragão de comodo', 'Arara', 'Barata', 'Dinossauro']
      },
      {
        'texto': 'Qual o seu instrutor favorito?',
        'respostas': ['Echo', 'Pedro', 'Thiago', 'João']
      }
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Perguntas')),
        body: Column(
          children: <Widget>[
            Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
            Resposta('Resposta 1', _responder),
            Resposta('Resposta 2', _responder),
            Resposta('Resposta 3', _responder),
          ],
        ),
      ), // Estrutura
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
