import 'package:flutter/material.dart';

class Listview1Screen extends StatelessWidget {
  final options = const [
    'Megaman',
    'Metal Gear',
    'Super Smash',
    'Final Fantasy',
  ];

  const Listview1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lstview Tipo 1'),
      ),
      body: ListView(
        children: [
          /// transformo cada uno de los elementos de la lista
          /// a un widget =>return implicito
          /// ... operador spread extrae cada unoi de los elementos de la lista y los muestra en forma de widget
          ...options
              .map(
                (game) => ListTile(
                  title: Text(game),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                ),
              )
              .toList()
        ],
      ),
    );
  }
}
