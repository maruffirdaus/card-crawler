import 'dart:math';

import 'package:card_crawler/core/game/frame/common/combat_effect/combat_effect_type.dart';

import '../../combat_effect/combat_effect.dart';
import '../consumable/consumable_game_card.dart';
import '../monster/monster_game_card.dart';
import '../weapon/weapon_game_card.dart';

class AccessoryCardEffect extends CombatEffect {
  AccessoryCardEffect({
    required super.id,
    required super.name,
    required super.description,
    required super.type,
    required super.trigger,
  });

  static final powerBreastplate = AccessoryCardEffect(
    id: 'power-breastplate',
    name: 'Breastplate of Power',
    description:
        'When fighting with this accessory equipped, the enemy\'s strength will be lowered by 3',
    type: CombatEffectType.accessoryCard,
    trigger: (data) {
      if (data.pickedCard is MonsterGameCard) {
        data.pickedCard?.value -= 3;
        if ((data.pickedCard?.value ?? 0) < 0) {
          data.pickedCard?.value = 0;
        }
      }
    },
  );

  static final healingAmulet = AccessoryCardEffect(
    id: 'healing-amulet',
    name: 'Healing Amulet',
    description:
        'When having this accessory equipped, you will heal 1 point of HP every turn, and you can always heal from potions, but all potions heal are halved',
    type: CombatEffectType.accessoryCard,
    trigger: (data) {
      data.health += 1;
      if (data.pickedCard is ConsumableGameCard) {
        data.pickedCard?.value = (data.pickedCard?.value ?? 0 / 2) as int;
      }
    },
  );

  static final ringOfMending = AccessoryCardEffect(
    id: 'ring-of-mending',
    name: 'Ring Of Mending',
    description:
        'When having this accessory equipped, your weapon\'s durability will recover by 3 every turn',
    type: CombatEffectType.accessoryCard,
    trigger: (data) {
      if (data.weaponCard != null) {
        data.durability += 3;
      }
    },
  );

  static final heroCape = AccessoryCardEffect(
    id: 'hero-cape',
    name: 'Hero\'s Cape',
    description:
        'When you get a new weapon with this accessory equipped, that weapon\'s strength is increased by 3',
    type: CombatEffectType.accessoryCard,
    trigger: (data) {
      if (data.pickedCard is WeaponGameCard) {
        data.pickedCard?.value += 3;
      }
    },
  );

  static final commanderHelmet = AccessoryCardEffect(
    id: 'commander-helmet',
    name: 'Commander\'s Helmet',
    description:
        'When having this accessory equipped, there\'s a 30% chance of enemy you fight to lose all their strength before the fight',
    type: CombatEffectType.accessoryCard,
    trigger: (data) {
      if (data.pickedCard is MonsterGameCard) {
        var rng = Random();
        if (rng.nextInt(100) < 30) {
          data.pickedCard?.value = 0;
        }
      }
    },
  );

  static final spectreBoots = AccessoryCardEffect(
    id: 'spectre-boots',
    name: 'Spectre Boots',
    description: 'When having this accessory equipped, you can always flee',
    type: CombatEffectType.accessoryCard,
    trigger: (data) {},
  );

  static final emperorCrown = AccessoryCardEffect(
    id: 'emperor-crown',
    name: 'Emperor\'s Crown',
    description:
        'When having this accessory equipped, weapon and consumable you pickup will have +5 value, but monster will have +2 value, this accessory will disappear after 5 use',
    type: CombatEffectType.accessoryCard,
    trigger: (data) {
      if (data.pickedCard is WeaponGameCard ||
          data.pickedCard is ConsumableGameCard) {
        data.pickedCard?.value += 5;
      } else if (data.pickedCard is MonsterGameCard) {
        data.pickedCard?.value += 2;
      }
      data.emperorCounter++;
      if (data.emperorCounter >= 4) {
        for (int i = 0; i < data.accessoryCards.length; i++) {
          if (data.accessoryCards[i].effect.id == 'emperor-crown') {
            data.graveyardCards.add(data.accessoryCards[i]);
            data.accessoryCards.remove(data.accessoryCards[i]);
          }
        }
      }
    },
  );
}
