import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String texto;

  //created the constructor
  Questao(this.texto);

  @override
  Widget build(BuildContext context) {
    /**
     * placed in a container to be able to apply 
     * the width of the text and center it
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
