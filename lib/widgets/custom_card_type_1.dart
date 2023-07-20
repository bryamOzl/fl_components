import 'package:flutter/material.dart';

import 'package:fl_components/theme/app_theme.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.photo_album_outlined,
              color: AppTheme.primary,
            ),
            title: Text('Soy un tittulo'),
            subtitle: Text(
                'Hajskj dahjkhdks kajs hdkaj shdkahsdk aksd hajhdkjah kjdha skjd aksjhdk jahdkja kashjdkajhsd kashdkjsah kashjdkjahsdka kashdkjahsk'),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Ok'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
