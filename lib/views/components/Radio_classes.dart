import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/classe.dart';

class RadioClasses extends StatelessWidget {
  final Classe clas;
  final int? selectedId;
  final void Function(int?) onSelected;

  const RadioClasses({Key? key, required this.clas, required this.selectedId, required this.onSelected,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedId == clas.id;

    return GestureDetector(
      onTap: () => onSelected(clas.id),
      child: ListTile(
        leading: Icon(
          isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
          color: isSelected ? Colors.blue : Colors.grey,
        ),
        title: Text("${clas.classe}"),
      ),
    );
  }
}