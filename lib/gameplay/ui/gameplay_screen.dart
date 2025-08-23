import 'package:card_crawler/gameplay/provider/gameplay_provider.dart';
import 'package:card_crawler/gameplay/ui/scenes/level_1_scene.dart';
import 'package:card_crawler/gameplay/ui/scenes/level_2_scene.dart';
import 'package:card_crawler/gameplay/ui/scenes/level_3_scene.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameplayScreen extends StatefulWidget {
  const GameplayScreen({super.key});

  @override
  State<GameplayScreen> createState() => _GameplayScreenState();
}

class _GameplayScreenState extends State<GameplayScreen> {
  late GameplayProvider _provider;

  @override
  void initState() {
    super.initState();
    _provider = GameplayProvider();
    _provider.init(maxLevel: 3);
  }

  @override
  void dispose() {
    _provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameplayProvider>.value(
      value: _provider,
      child: _GameplayScreenContent(),
    );
  }
}

class _GameplayScreenContent extends StatelessWidget {
  const _GameplayScreenContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<GameplayProvider>(
        builder: (context, provider, child) => switch (provider.currentLevel) {
          1 => Level1Scene(
            onComplete: () {
              provider.isGameplayFinished()
                  ? Navigator.of(context).pop()
                  : provider.nextLevel();
            },
          ),
          2 => Level2Scene(
            onComplete: () {
              provider.isGameplayFinished()
                  ? Navigator.of(context).pop()
                  : provider.nextLevel();
            },
          ),
          3 => Level3Scene(
            onComplete: () {
              provider.isGameplayFinished()
                  ? Navigator.of(context).pop()
                  : provider.nextLevel();
            },
          ),
          _ => Container(),
        },
      ),
    );
  }
}
