import 'package:card_crawler/app_route.dart';
import 'package:card_crawler/core/foundation/widgets/menu_container.dart';
import 'package:card_crawler/core/foundation/widgets/menu_item.dart';
import 'package:flutter/material.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/backgrounds/forest.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: MenuContainer(
              children: [
                MenuItem(
                  title: 'NEW GAME',
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoute.gameplay.path);
                  },
                ),
                MenuItem(title: 'CONTINUE', onPressed: null),
                MenuItem(title: 'CREDITS', onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
