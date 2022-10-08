import 'package:flutter/material.dart';

class NovaTransacao extends StatelessWidget {
  VoidCallback onPressed;
  TextEditingController controllerValor;
  TextEditingController controllerNome;
  //List<Widget> children;
  Switch botaoSwitch;

  NovaTransacao({
    required this.controllerValor,
    required this.controllerNome,
    required this.onPressed,
    //required this.children
    required this.botaoSwitch,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Nova Transação'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            //Escolher tipo de transação
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Despesa'),
                botaoSwitch,
                const Text('Receita'),
              ],
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Valor',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              controller: controllerValor,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Nome da Transação',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              controller: controllerNome,
            ),
            const SizedBox(
              height: 20,
            ),

            //Botões cancelar e adicionar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancelar'),
                ),
                ElevatedButton(
                  onPressed: onPressed,
                  child: const Text('Adicionar'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
