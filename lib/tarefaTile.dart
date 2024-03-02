import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class TarefaTile extends StatelessWidget {
  Function(bool?)? onChanged;
  final String nome;
  final bool completa;
  Function(BuildContext?)? onDeletar;

  TarefaTile(
      {super.key,
      required this.nome,
      required this.completa,
      required this.onChanged,
      required this.onDeletar});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: onDeletar,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          // ignore: sort_child_properties_last
          child: Row(
            children: [
              Checkbox(value: completa, onChanged: onChanged), //CheckBox
              Text(
                nome,
                style: TextStyle(
                  decoration: completa
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ), // Nome da Tarefa
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
