import 'package:flutter/material.dart';

//"st" + ctrl + espaço para criar a classe.

class Resultado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Parabéns!',
        style: TextStyle(fontSize: 28),
      ),
    );
  }
}
