import 'package:card_crawler/app_route.dart';
import 'package:card_crawler/gameplay/ui/gameplay_screen.dart';
import 'package:card_crawler/main_menu/ui/main_menu_screen.dart';
import 'package:flutter/material.dart';

import 'gameplay/ui/scenes/level_1_scene.dart';

class CardCrawlerApp extends StatelessWidget {
  const CardCrawlerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Crawler',
      theme: ThemeData(
        fontFamily: 'ConcertOne',
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.black,
          selectionColor: Colors.black.withValues(alpha: 0.4),
          selectionHandleColor: Colors.black,
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2.0),
          ),
          floatingLabelStyle: TextStyle(color: Colors.black),
        ),
      ),

    initialRoute: AppRoute.mainMenu.path,
      routes: {
        AppRoute.mainMenu.path: (context) => MainMenuScreen(),
        AppRoute.gameplay.path: (context) => GameplayScreen(),
      },
    );
  }
}
