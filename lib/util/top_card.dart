import 'package:flutter/material.dart';

class TopCard extends StatelessWidget {
  final String balance;
  final double receitas;
  final double despesas;

  const TopCard({
    super.key,
    required this.balance,
    required this.receitas,
    required this.despesas,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.blue),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Carteira', style: TextStyle(fontSize: 26)),

              //Valor total em carteira
              Text(balance, style: const TextStyle(fontSize: 30)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.arrow_upward,
                        color: Colors.green,
                      ),
                      Column(
                        children: [
                          const Text(
                            'Receitas',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            receitas.toString(),
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.arrow_downward,
                        color: Colors.red,
                      ),
                      Column(
                        children: [
                          const Text(
                            'Despesas',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            despesas.toString(),
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
