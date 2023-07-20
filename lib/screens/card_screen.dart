import 'package:flutter/material.dart';

import 'package:fl_components/widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarjeta'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        children: [
          CustomCardType1(),
          const SizedBox(height: 10.0),
          CustomCardType2(
            imageUrl:
                'https://photographylife.com/wp-content/uploads/2017/01/What-is-landscape-photography.jpg',
          ),
          const SizedBox(height: 20.0),
          CustomCardType2(
            imageUrl:
                'https://cdn1.epicgames.com/ue/product/Screenshot/04-1920x1080-d39d5f7af4e17b162383cdf38ce97858.jpg?resize=1&w=1920',
            name: null,
          ),
          const SizedBox(height: 20.0),
          CustomCardType2(
            imageUrl:
                'https://photographylife.com/wp-content/uploads/2016/06/Mass.jpg',
            name: 'Un hermoso paisaje',
          ),
          const SizedBox(height: 100.0),
        ],
      ),
    );
  }
}
