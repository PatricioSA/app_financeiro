import 'package:flutter/material.dart';

class Transacoes extends StatelessWidget {
  final String nomeTransacao;
  final bool receitaOuDespesa;
  final double quantia;

  const Transacoes({
    super.key,
    required this.nomeTransacao,
    required this.receitaOuDespesa,
    required this.quantia,
  });

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
            '${receitaOuDespesa == false ? '- ' : '+ '}R\$$quantia',
            style: TextStyle(
                color: receitaOuDespesa == false ? Colors.red : Colors.green),
          ),
        ],
      ),
    );
  }
}
