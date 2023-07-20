import 'package:flutter/material.dart';

import 'package:fl_components/screens/screens.dart';
import 'package:fl_components/models/models.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    /*  MenuOption(
      route: 'home',
      icon: Icons.home,
      name: 'Home Screen',
      screen: const HomeScreen(),
    ), */
    MenuOption(
      route: 'listview1',
      icon: Icons.list,
      name: 'Listview tipo 1',
      screen: const Listview1Screen(),
    ),
    MenuOption(
      route: 'listview2',
      icon: Icons.list_sharp,
      name: 'Listview tipo 2',
      screen: const Listview2Screen(),
    ),
    MenuOption(
      route: 'alert',
      icon: Icons.warning,
      name: 'Alertas - Alerts',
      screen: const AlertScreen(),
    ),
    MenuOption(
      route: 'card',
      icon: Icons.card_membership,
      name: 'Tarjetas - Card',
      screen: const CardScreen(),
    ),
    MenuOption(
      route: 'avatar',
      icon: Icons.supervised_user_circle_outlined,
      name: 'Circle Avatar',
      screen: const AvatarScreen(),
    ),
    MenuOption(
      route: 'animated',
      icon: Icons.animation,
      name: 'Animation Container',
      screen: const AnimatedScreen(),
    ),
    MenuOption(
      route: 'inputs',
      icon: Icons.input_outlined,
      name: 'Text Inputs',
      screen: const InputsScreen(),
    ),
    MenuOption(
      route: 'slider',
      icon: Icons.slideshow_rounded,
      name: 'Slider && Checks',
      screen: const SliderScreen(),
    ),
    MenuOption(
      route: 'listviwebuilder',
      icon: Icons.build_circle_outlined,
      name: 'InfiniteScrol & Pull to refresh',
      screen: const ListviewBuilderScreen(),
    ),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (BuildContext context) => HomeScreen()});
    for (var option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }
    return appRoutes;
  }

  // static Map<String, Widget Function(BuildContext)> routes = {
  //   'home': (BuildContext context) => HomeScreen(),
  //   'listview1': (BuildContext context) => Listview1Screen(),
  //   'listview2': (BuildContext context) => Listview2Screen(),
  //   'alert': (BuildContext context) => AlertScreen(),
  //   'card': (BuildContext context) => CardScreen(),
  // };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const AlertScreen(),
    );
  }
}
