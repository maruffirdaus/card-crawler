import 'dart:math';

import '../base/game_card_effect_type.dart';
import '../base/game_card_effect.dart';
import '../consumable/consumable_game_card.dart';
import '../monster/monster_game_card.dart';
import '../weapon/weapon_game_card.dart';

class EquipmentGameCardEffect extends GameCardEffect {
  EquipmentGameCardEffect({
    required super.id,
    required super.name,
    required super.description,
    required super.type,
    required super.trigger,
  });

  static final powerBreastplate = EquipmentGameCardEffect(
    id: 'power-breastplate',
    name: 'Breastplate of Power',
    description:
        'When fighting with this equipment equipped, the enemy\'s strength will be lowered by 3',
    type: GameCardEffectType.equipmentCard,
    trigger: (data) {
      if (data.pickedCard is MonsterGameCard) {
        data.pickedCard?.value -= 3;
        if ((data.pickedCard?.value ?? 0) < 0) {
          data.pickedCard?.value = 0;
        }
      }
    },
  );

  static final healingAmulet = EquipmentGameCardEffect(
    id: 'healing-amulet',
    name: 'Healing Amulet',
    description:
        'When having this equipment equipped, you will heal 1 point of HP every turn, and you can always heal from potions, but all potions heal are halved',
    type: GameCardEffectType.equipmentCard,
    trigger: (data) {
      data.health += 1;
      if (data.pickedCard is ConsumableGameCard) {
        data.pickedCard?.value = (data.pickedCard?.value ?? 0 / 2) as int;
      }
    },
  );

  static final ringOfMending = EquipmentGameCardEffect(
    id: 'ring-of-mending',
    name: 'Ring Of Mending',
    description:
        'When having this equipment equipped, your weapon\'s durability will recover by 3 every turn',
    type: GameCardEffectType.equipmentCard,
    trigger: (data) {
      if (data.weaponCard != null) {
        data.durability += 3;
      }
    },
  );

  static final heroCape = EquipmentGameCardEffect(
    id: 'hero-cape',
    name: 'Hero\'s Cape',
    description:
        'When you get a new weapon with this equipment equipped, that weapon\'s strength is increased by 3',
    type: GameCardEffectType.equipmentCard,
    trigger: (data) {
      if (data.pickedCard is WeaponGameCard) {
        data.pickedCard?.value += 3;
      }
    },
  );

  static final commanderHelmet = EquipmentGameCardEffect(
    id: 'commander-helmet',
    name: 'Commander\'s Helmet',
    description:
        'When having this equipment equipped, there\'s a 30% chance of enemy you fight to lose all their strength before the fight',
    type: GameCardEffectType.equipmentCard,
    trigger: (data) {
      if (data.pickedCard is MonsterGameCard) {
        var rng = Random();
        if (rng.nextInt(100) < 30) {
          data.pickedCard?.value = 0;
        }
      }
    },
  );

  static final spectreBoots = EquipmentGameCardEffect(
    id: 'spectre-boots',
    name: 'Spectre Boots',
    description: 'When having this equipment equipped, you can always flee',
    type: GameCardEffectType.equipmentCard,
    trigger: (data) {},
  );

  static final emperorCrown = EquipmentGameCardEffect(
    id: 'emperor-crown',
    name: 'Emperor\'s Crown',
    description:
        'When having this equipment equipped, weapon and consumable you pickup will have +5 value, but monster will have +2 value, this equipment will disappear after 5 use',
    type: GameCardEffectType.equipmentCard,
    trigger: (data) {
      if (data.pickedCard is WeaponGameCard ||
          data.pickedCard is ConsumableGameCard) {
        data.pickedCard?.value += 5;
      } else if (data.pickedCard is MonsterGameCard) {
        data.pickedCard?.value += 2;
      }
      data.emperorCounter++;
      if (data.emperorCounter >= 4) {
        for (int i = 0; i < data.equipmentCards.length; i++) {
          if (data.equipmentCards[i].effect.id == 'emperor-crown') {
            data.graveyardCards.add(data.equipmentCards[i]);
            data.equipmentCards.remove(data.equipmentCards[i]);
          }
        }
      }
    },
  );
}
