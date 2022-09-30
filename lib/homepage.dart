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
  TextEditingController valorTransacao = TextEditingController();
  TextEditingController nomeTransacao = TextEditingController();

  List<dynamic> _transacoes = [
    ['Transação 1', 'ganhos', 200],
  ];

  void pageNovaTransacao() {
    showDialog(
      context: context,
      builder: (context) {
        return NovaTransacao(
          controllerNome: nomeTransacao,
          controllerValor: valorTransacao,
          onPressed: criarNovaTransacao,
        );
      },
    );
  }

  void criarNovaTransacao() {
    setState(() {
      _transacoes.add([
        nomeTransacao.text,
        'despesa',
        double.tryParse(valorTransacao.text)
      ]);
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            //Texto de boas-vindas
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Olá, Usuário!',
                    style: TextStyle(fontSize: 36),
                  ),
                ],
              ),
            ),
            TopCard(
              balance: 'R\$5,000',
              ganhos: 600,
              despesas: 100,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _transacoes.length,
                itemBuilder: ((context, index) {
                  return Transacoes(
                    nomeTransacao: _transacoes[index][0],
                    tipoTransacao: _transacoes[index][1],
                    quantia: _transacoes[index][2],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pageNovaTransacao,
        backgroundColor: Colors.grey,
        child: Icon(Icons.add),
      ),
    );
  }
}
