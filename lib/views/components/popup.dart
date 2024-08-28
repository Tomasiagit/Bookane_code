
import 'package:flutter/material.dart';

class PopUp extends StatelessWidget {
  const PopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Logout'),
          content: const Text('Tem certeza que pretende sair da aplicação?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'Sair'),
              child: const Text('Sair'),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}
