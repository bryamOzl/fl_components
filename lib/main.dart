import 'package:flutter/material.dart';

import 'package:fl_components/router/app_routes.dart';
import 'package:fl_components/theme/app_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      // theme: AppTheme.lightTheme,
      theme: AppTheme.lightTheme,
    );
  }
}
