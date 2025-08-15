import 'dart:math';

import '../../../common/game_card/consumable_game_card.dart';
import '../../../common/game_card/monster_game_card.dart';
import '../../../common/game_card/weapon_game_card.dart';
import '../../models/core_game_data.dart';
import 'game_card_effect.dart';

abstract class AccessoryCardEffect extends GameCardEffect {
  AccessoryCardEffect(super.name, super.desc);
}

class PowerBreastplate extends AccessoryCardEffect {
  PowerBreastplate()
    : super(
        'Breastplate of Power',
        'When fighting with this accessory equipped, the enemy\'s strength will be lowered by 3',
      );

  @override
  void trigger(CoreGameData data) {
    if (data.pickedCard is MonsterGameCard) {
      data.pickedCard?.value -= 3;
      if ((data.pickedCard?.value ?? 0) < 0) {
        data.pickedCard?.value = 0;
      }
    }
  }
}

class HealingAmulet extends AccessoryCardEffect {
  HealingAmulet()
    : super(
        'Healing Amulet',
        'When having this accessory equipped, you will heal 1 point of HP every turn, and you can always heal from potions, but all potions heal are halved',
      );

  @override
  void trigger(CoreGameData data) {
    data.health += 1;
    if (data.pickedCard is ConsumableGameCard) {
      data.pickedCard?.value = (data.pickedCard?.value ?? 0 / 2) as int;
    }
  }
}

class RingOfMending extends AccessoryCardEffect {
  RingOfMending()
    : super(
        'Ring Of Mending',
        'When having this accessory equipped, your weapon\'s durability will recover by 3 every turn',
      );

  @override
  void trigger(CoreGameData data) {
    if (data.weaponCard != null) {
      data.durability += 3;
    }
  }
}

class HeroCape extends AccessoryCardEffect {
  HeroCape()
    : super(
        'Hero\'s Cape',
        'When you get a new weapon with this accessory equipped, that weapon\'s strength is increased by 3',
      );

  @override
  void trigger(CoreGameData data) {
    if (data.pickedCard is WeaponGameCard) {
      data.pickedCard?.value += 3;
    }
  }
}

class CommanderHelmet extends AccessoryCardEffect {
  CommanderHelmet()
    : super(
        'Commander\'s Helmet',
        'When having this accessory equipped, there\'s a 30% chance of enemy you fight to lose all their strength before the fight',
      );

  @override
  void trigger(CoreGameData data) {
    if (data.pickedCard is MonsterGameCard) {
      var rng = Random();
      if (rng.nextInt(100) < 30) {
        data.pickedCard?.value = 0;
      }
    }
  }
}

class SpectreBoots extends AccessoryCardEffect {
  SpectreBoots()
    : super(
        'Spectre Boots',
        'When having this accessory equipped, you can always flee',
      );

  @override
  void trigger(CoreGameData data) {}
}

class EmperorCrown extends AccessoryCardEffect {
  EmperorCrown()
    : super(
        'Emperor\'s Crown',
        'When having this accessory equipped, weapon and consumable you pickup will have +5 value, but monster will have +2 value, this accessory will dissappear after 5 use',
      );

  @override
  void trigger(CoreGameData data) {
    if (data.pickedCard is WeaponGameCard ||
        data.pickedCard is ConsumableGameCard) {
      data.pickedCard?.value += 5;
    } else if (data.pickedCard is MonsterGameCard) {
      data.pickedCard?.value += 2;
    }
    data.emperorCounter++;
    if (data.emperorCounter >= 4) {
      for (int i = 0; i < data.accessoryCards.length; i++) {
        if (data.accessoryCards[i].effect is EmperorCrown) {
          data.graveyardCards.add(data.accessoryCards[i]);
          data.accessoryCards.remove(data.accessoryCards[i]);
        }
      }
    }
  }
}
