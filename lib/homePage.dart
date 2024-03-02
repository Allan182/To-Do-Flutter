import 'package:flutter/material.dart';
import 'package:flutter_application/tarefaTile.dart';
import 'package:flutter_application/CaixaDialogo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();

  List tarefinhas = [
    ["Dever Prog 1.", false],
    ["Dever Prog 2.", false],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      tarefinhas[index][1] = !tarefinhas[index][1];
    });
  }

  void criarNovaTarefa() {
    showDialog(
        context: context,
        builder: ((context) {
          return CaixaDialogo(
            controller: controller,
            onCancelar: () => Navigator.of(context).pop(),
            onSalvar: salvarTarefa,
          );
        }));
  }

  void salvarTarefa() {
    setState(() {
      tarefinhas.add([controller.text, false]);
      controller.clear();
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
        backgroundColor: Colors.green[400],
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: tarefinhas.length,
          itemBuilder: (context, index) {
            return TarefaTile(
              nome: tarefinhas[index][0],
              completa: tarefinhas[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              onDeletar: ((p0) {}),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          criarNovaTarefa(),
        },
        backgroundColor: Colors.green,
        child: const Icon(
          color: Colors.white,
          Icons.add,
        ),
      ),
    ); // Scaffold
  }
}
