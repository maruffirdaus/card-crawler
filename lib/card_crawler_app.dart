import 'package:card_crawler/level_1/level_1_scene.dart';
import 'package:flutter/material.dart';

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
      home: Scaffold(body: Level1Scene()),
    );
  }
}
