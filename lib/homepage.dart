import 'package:app_financeiro/top_card.dart';
import 'package:flutter/material.dart';
import 'package:app_financeiro/transacoes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopCard(balance: 'R\$5,000',),

          Expanded(child: ListView()),
        ],
      )
    );
  }
}
