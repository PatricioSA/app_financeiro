import 'dart:js';

import 'package:app_financeiro/add_transacao_page.dart';
import 'package:app_financeiro/util/top_card.dart';
import 'package:flutter/material.dart';
import 'package:app_financeiro/util/transacoes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          TopCard(
            balance: 'R\$5,000',
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: ((context, index) {
                return Transacoes(
                  nomeTransacao: 'Teste',
                  tipoTransacao: 'gasto',
                  quantia: '100',
                );
              }),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context) {
            return NovaTransacao();
          });
        },
        backgroundColor: Colors.grey,
        child: Icon(Icons.add),
      ),
    );
  }
}
