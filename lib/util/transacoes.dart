import 'package:flutter/material.dart';

class Transacoes extends StatelessWidget {
  final String nomeTransacao;
  final bool incomeOrExpanse;
  final double quantia;

  Transacoes(
      {required this.nomeTransacao,
      required this.incomeOrExpanse,
      required this.quantia});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(nomeTransacao),
          Text(
            '${incomeOrExpanse == false ? '- ' : '+ '}R\$$quantia',
            style: TextStyle(
                color: incomeOrExpanse == false ? Colors.red : Colors.green),
          ),
        ],
      ),
    );
  }
}
