import 'package:card_crawler/card_crawler_app.dart';
import 'package:card_crawler/gameplay/ui/scenes/level_3_scene.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Level3Scene(
            onComplete: () {
              runApp(const CardCrawlerApp());
            },
          ),
        ),
      ),
    );
  });
}
