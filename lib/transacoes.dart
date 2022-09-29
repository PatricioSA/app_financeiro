import 'package:flutter/material.dart';

class Transacoes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 50,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey[100]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Nome da transacao'),
          Text('R\$ 100'),
        ],
      ),
    );
  }
}