import 'game_card_location.dart';

sealed class CoreGameUiAction {}

class TapCard extends CoreGameUiAction {
  TapCard({required this.location, required this.index});

  GameCardLocation location;
  int index;
}

class ShowGraveyard extends CoreGameUiAction {}

class Pause extends CoreGameUiAction {}

class DismissPopup extends CoreGameUiAction {}
