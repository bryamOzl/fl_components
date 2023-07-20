import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  void displayDialogIOS(BuildContext context) {
    showCupertinoDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('Titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Este es el contenido de la alerta'),
              SizedBox(height: 10.0),
              FlutterLogo(size: 100),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancelar',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  void displayDialogAndroid(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 5.0,
          title: Text('Titulo'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Este es el contenido de la alerta'),
              SizedBox(height: 10.0),
              FlutterLogo(size: 100),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          //  style: ElevatedButton.styleFrom(
          //    primary: Colors.red,
          //    shape: const StadiumBorder(),
          //    elevation: 0
          //  ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Text('Mostrar alerta', style: TextStyle(fontSize: 16)),
          ),
          onPressed: () => !Platform.isAndroid
              ? displayDialogAndroid(context)
              : displayDialogIOS(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // backgroundColor: AppTheme.primary,
        child: Icon(Icons.close),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
