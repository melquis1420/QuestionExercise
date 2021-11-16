import './questionario.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './resultado.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual a sua cor favorita? ', //string
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Branco', 'pontuacao': 5},
        {'texto': 'Azul', 'pontuacao': 3},
        {'texto': 'Amarelo', 'pontuacao': 1},
      ], //object
    },
    {
      'texto': 'Qual o seu animal favorito?',
      'respostas': [
        {'texto': 'Dragão de comodo', 'pontuacao': 10},
        {'texto': 'Arara', 'pontuacao': 5},
        {'texto': 'Barata', 'pontuacao': 1},
        {'texto': 'Dinossauro', 'pontuacao': 8},
      ],
    },
    {
      'texto': 'Qual o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Melquis', 'pontuacao': 10},
        {'texto': 'Pedro', 'pontuacao': 1},
        {'texto': 'Thiago', 'pontuacao': 8},
        {'texto': 'João', 'pontuacao': 3},
      ]
    }
  ];

  /**
   * go to next question and add pontuation in 
   * the variable "pontuacaoTotal"
   */
  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  //reset
  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    /**
     * Another way to do:
     * for (String textoResp in perguntas[_perguntaSelecionada].cast()['respostas']) 
     * {
        respostas.add(Resposta(textoResp, _responder));
        }
     */
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Perguntas')),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ), // Estrutura
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
