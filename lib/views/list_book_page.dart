import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ListBookPage extends StatefulWidget {
  static const String routeName = '/ListBookPage';
  const ListBookPage({super.key});

  @override
  State<ListBookPage> createState() => ListBookPageState();
}

class ListBookPageState extends State<ListBookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(),
      ),
    );
  }
}
