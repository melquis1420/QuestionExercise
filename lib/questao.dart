import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String texto;

  //created the constructor
  Questao(this.texto);

  @override
  Widget build(BuildContext context) {
    /**
     * colocou em um container para poder 
     * aplicar a largura do texto e centraliza-lo
     */
    return Container(
      width: double.infinity, //largura- valor máximo do double
      margin: EdgeInsets.all(10),
      child: Text(
        texto,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
