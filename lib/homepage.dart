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
  bool isIncome = false;

  final List<dynamic> transacoes = [];

  void pageNovaTransacao() {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: ((context, setState) {
            //Retornando minha página
            return NovaTransacao(
              controllerNome: nomeTransacao,
              controllerValor: valorTransacao,
              onPressed: criarNovaTransacao,
              children: [
                const Text('Despesa'),
                Switch(
                  value: isIncome,
                  onChanged: (value) {
                    setState(() {
                      isIncome = !isIncome;
                    });
                  },
                ),
                const Text('Ganhos'),
              ],
            );
          }),
        );
      },
    );
  }

  validarInputs() {
    if (valorTransacao.text == '' || nomeTransacao.text == '') {
      return false;
    } else {
      return true;
    }
  }

  void criarNovaTransacao() {
    if (validarInputs() == true) {
      setState(() {
        transacoes.add([
          nomeTransacao.text,
          isIncome,
          double.tryParse(valorTransacao.text)
        ]);
      });
    }
    //Limpando os inputs
    nomeTransacao.clear();
    valorTransacao.clear();
    isIncome = false;

    Navigator.of(context).pop();
  }

  double calcularReceita() {
    double totalIncome = 0;
    for (int i = 0; i < transacoes.length; i++) {
      if (transacoes[i][1] == true) {
        totalIncome += transacoes[i][2];
      }
    }
    return totalIncome;
  }

  double calcularDespesas() {
    double totalExpanse = 0;
    for (int i = 0; i < transacoes.length; i++) {
      if (transacoes[i][1] == false) {
        totalExpanse += transacoes[i][2];
      }
    }
    return totalExpanse;
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
                children: const [
                  Text(
                    'Olá, Usuário!',
                    style: TextStyle(fontSize: 36),
                  ),
                ],
              ),
            ),
            TopCard(
              balance: 'R\$ ${calcularReceita() - calcularDespesas()}',
              receitas: calcularReceita(),
              despesas: calcularDespesas(),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: transacoes.length,
                itemBuilder: ((context, index) {
                  return Transacoes(
                    nomeTransacao: transacoes[index][0],
                    receitaOuDespesa: transacoes[index][1],
                    quantia: transacoes[index][2],
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
        child: const Icon(Icons.add),
      ),
    );
  }
}
