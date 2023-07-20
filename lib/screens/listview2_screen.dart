import 'package:flutter/material.dart';

class Listview2Screen extends StatelessWidget {
  final options = const [
    'Megaman',
    'Metal Gear',
    'Super Smash',
    'Final Fantasy',
  ];

  const Listview2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Lstview Tipo 2')),
      ),
      body: ListView.separated(
        itemCount: options.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(options[index]),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.indigo,
          ),
          onTap: () {
            final game = options[index];
            print(game);
          },
        ),
        separatorBuilder: (_, __) => Divider(),
      ),
    );
  }
}
