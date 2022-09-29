import 'package:flutter/material.dart';

class TopCard extends StatelessWidget {
  final String balance;

  TopCard({required this.balance});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        color: Colors.grey[200],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Carteira', style: TextStyle(fontSize: 24)),
              Text(balance, style: TextStyle(fontSize: 30)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_upward,
                        color: Colors.green,
                      ),
                      Column(
                        children: [
                          Text('Ganhos'),
                          Text('R\$500'),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_downward,
                        color: Colors.red,
                      ),
                      Column(
                        children: [
                          Text('Despesas'),
                          Text('R\$200'),
                        ],
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
