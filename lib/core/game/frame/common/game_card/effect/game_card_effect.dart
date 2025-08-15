import '../../../core_game/models/core_game_data.dart';

abstract class GameCardEffect {
  GameCardEffect(this.name, this.description);

  String name;
  String description;

  void trigger(CoreGameData data);
}

abstract class OnField extends GameCardEffect {
  OnField(super.name, super.desc);
}

abstract class OnPicked extends GameCardEffect {
  OnPicked(super.name, super.desc);
}

abstract class OnUse extends GameCardEffect {
  OnUse(super.name, super.desc);
}

abstract class OnKill extends GameCardEffect {
  OnKill(super.name, super.desc);
}
