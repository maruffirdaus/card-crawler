import 'package:card_crawler/app_route.dart';
import 'package:card_crawler/core/foundation/ui/extensions/build_context_extensions.dart';
import 'package:card_crawler/core/foundation/ui/widgets/menu_container.dart';
import 'package:card_crawler/core/foundation/ui/widgets/menu_item.dart';
import 'package:card_crawler/main_menu/ui/widgets/popup/credits_popup.dart';
import 'package:flutter/material.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  bool isCreditsPopupVisible = false;

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Card Crawler',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48.0 * context.uiScale(),
                  ),
                ),
                MenuContainer(
                  children: [
                    MenuItem(
                      title: 'NEW GAME',
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoute.gameplay.path);
                      },
                    ),
                    MenuItem(title: 'CONTINUE', onPressed: null),
                    MenuItem(
                      title: 'CREDITS',
                      onPressed: () {
                        setState(() {
                          isCreditsPopupVisible = true;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (isCreditsPopupVisible)
            CreditsPopup(
              onDismiss: () {
                setState(() {
                  isCreditsPopupVisible = false;
                });
              },
            ),
        ],
      ),
    );
  }
}
