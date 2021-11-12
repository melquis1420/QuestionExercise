import './questao.dart';
import './resposta.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final List<Map<String, Object>> _perguntas = const [
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

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    //Using MAP to convert Lists
    /**
         * Use "?" to check the condition.
         * Se existe pergunta selecionada, ele execulta a ação, 
         * caso contrário, atribui Null.
         */
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada].cast()['respostas']
        : [];

    //for (String textoResp
    //    in perguntas[_perguntaSelecionada].cast()['respostas']) {
    //  respostas.add(Resposta(textoResp, _responder));
    //}
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Perguntas')),
        body: temPerguntaSelecionada
            ? Column(
                children: <Widget>[
                  //map = index and value
                  Questao(_perguntas[_perguntaSelecionada]['texto'].toString()),
                  /**
             * "..."" is used to take the respostas List and put in the Column list
             */
                  ...respostas
                      .map((t) => Resposta(t, _responder))
                      .toList(), //spread operator "..."
                ],
              )
            : Center(
                child: Text(
                  'Parabéns!',
                  style: TextStyle(fontSize: 28),
                ),
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
