import 'package:flutter/material.dart';
import 'package:flutter_application/Botoes.dart';

class CaixaDialogo extends StatelessWidget {

  final controller;
  VoidCallback onSalvar;
  VoidCallback onCancelar;

  CaixaDialogo({
    super.key,
    required this.controller,
    required this.onSalvar,
    required this.onCancelar,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.green[400],
        content: Container(
          height: 120,
          child: Column(
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Adicione uma nova Tarefa!",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Botoes(texto: "Salvar", onPressed: onSalvar),
                  const SizedBox(
                    width: 6,
                  ),
                  Botoes(texto: "Cancelar", onPressed: onCancelar),
                ],
              ),
            ],
          ),
        ));
  }
}
