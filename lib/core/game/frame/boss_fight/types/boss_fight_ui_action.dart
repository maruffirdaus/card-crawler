import 'boss_fight_game_card_location.dart';

sealed class BossFightUiAction {}

class TapCard extends BossFightUiAction {
  TapCard({required this.location, required this.index});

  BossFightGameCardLocation location;
  int index;
}

class ShowPlayerEquipments extends BossFightUiAction {}

class ShowBossActions extends BossFightUiAction {}

class Pause extends BossFightUiAction {}

class DismissPopup extends BossFightUiAction {}
