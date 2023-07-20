import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100;
  bool _sliderEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders && checks'),
      ),
      body: Column(
        children: [
          /// Depende a la plataforma se adapta .adaptative
          Slider.adaptive(
            min: 50,
            max: 400,
            activeColor: AppTheme.primary,
            // divisions: 10,
            value: _sliderValue,
            onChanged: !_sliderEnabled
                ? null
                : (value) {
                    print(value);
                    _sliderValue = value;
                    setState(() {});
                  },
          ),

          // Checkbox(
          //   value: _sliderEnabled,
          //   onChanged: (value) {
          //     _sliderEnabled = value ?? true;
          //     setState(() {});
          //   },
          // ),

          // Switch(
          //     value: _sliderEnabled,
          //     onChanged: (value) => setState(() {
          //           _sliderEnabled = value;
          //         })),

          CheckboxListTile(
            activeColor: AppTheme.primary,
            title: const Text('Habilitar Slider'),
            value: _sliderEnabled,
            onChanged: (value) => setState(
              () {
                _sliderEnabled = value ?? true;
              },
            ),
          ),

          SwitchListTile.adaptive(
            activeColor: AppTheme.primary,
            title: const Text('Habilitar Slider'),
            value: _sliderEnabled,
            onChanged: (value) => setState(
              () {
                _sliderEnabled = value;
              },
            ),
          ),

          const AboutListTile(),

          Expanded(
            child: SingleChildScrollView(
              child: Image(
                image: NetworkImage(
                    'https://cdn.pixabay.com/photo/2020/07/06/17/51/batman-5377804_1280.png'),
                fit: BoxFit.contain,
                width: _sliderValue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
