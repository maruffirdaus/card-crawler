import '../../core_game/models/core_game_data.dart';

abstract class CombatEffect {
  CombatEffect(this.name, this.description);

  String name;
  String description;

  void trigger(CoreGameData data);
}

abstract class OnField extends CombatEffect {
  OnField(super.name, super.desc);
}

abstract class OnPicked extends CombatEffect {
  OnPicked(super.name, super.desc);
}

abstract class OnUse extends CombatEffect {
  OnUse(super.name, super.desc);
}

abstract class OnKill extends CombatEffect {
  OnKill(super.name, super.desc);
}
