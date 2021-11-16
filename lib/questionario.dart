import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  Questionario({
    //constructor
    //required is used when parametes must be passed.
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    //Using MAP to convert Lists
    /**
         * Use "?" to check the condition.
         * Se existe pergunta selecionada, ele execulta a ação, 
         * caso contrário, atribui Null.
         */
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : null;

    return Column(
      children: <Widget>[
        //map = index and value
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        /**
             * "..."" is used to take the respostas List and put in the Column list
             */
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'].toString(),
            () => quandoResponder(int.parse(resp['pontuacao'].toString())),
          );
        }).toList(), //spread operator "..."
      ],
    );
  }
}
