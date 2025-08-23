import 'package:card_crawler/core/game/frame/common/combat_effect/combat_effect_type.dart';

import '../../../common/combat_effect/combat_effect.dart';
import '../../models/core_game_data.dart';
import '../equipment/equipment_game_card_effect.dart';
import 'monster_game_card.dart';

class MonsterCardEffect extends CombatEffect {
  MonsterCardEffect({
    required super.id,
    required super.name,
    required super.description,
    required super.type,
    required Function(CoreGameData) trigger,
  }) {
    super.triggerOnCoreGame = trigger;
  }

  static final noEffect = MonsterCardEffect(
    id: 'no-effect',
    name: 'No effect',
    description:
    'No effect',
    type: CombatEffectType.onField,
    trigger: (data) {
      data.canFlee = false;
    },
  );

  static final noEscape = MonsterCardEffect(
    id: 'no-escape',
    name: 'No Escape',
    description:
        'When this card is on the dungeon field, you can\'t flee until next round.',
    type: CombatEffectType.onField,
    trigger: (data) {
      data.canFlee = false;
    },
  );

  static final scaling = MonsterCardEffect(
    id: 'scaling',
    name: 'Scaling',
    description:
        'This card\'s strength will increase by 1 for every round that have been played.',
    type: CombatEffectType.onPicked,
    trigger: (data) {
      data.buff = data.round;
    },
  );

  static final spiky = MonsterCardEffect(
    id: 'spiky',
    name: 'Spiky',
    description: 'Fighting this monster will lose you 3 health.',
    type: CombatEffectType.onPicked,
    trigger: (data) {
      data.reduceHealth(3);
    },
  );

  static final antiHeal = MonsterCardEffect(
    id: 'anti-heal',
    name: 'Anti Heal',
    description:
        'After defeating this enemy, healing potion won\'t heal you until the start of next turn.',
    type: CombatEffectType.onKill,
    trigger: (data) {
      data.hasHealed = true;
    },
  );

  static final corrosive = MonsterCardEffect(
    id: 'corrosive',
    name: 'Corrosive',
    description: 'Fighting this monster will lose you 3 durability.',
    type: CombatEffectType.onKill,
    trigger: (data) {
      data.durability -= 3;
      if (data.durability < 0) {
        data.durability = 0;
      }
    },
  );

  static final ally = MonsterCardEffect(
    id: 'ally',
    name: 'Ally',
    description:
        'After defeating this enemy, this enemy will act as your weapon.',
    type: CombatEffectType.onKill,
    trigger: (data) {
      var newWeaponCard = data.graveyardCards.removeLast();
      if (data.weaponCard != null) data.graveyardCards.add(data.weaponCard!);
      data.weaponCard = newWeaponCard;
      data.durability = 20;
      for (var card in data.equipmentCards) {
        if (card.effect == EquipmentCardEffect.kalkanBreastplate) {
          data.weaponCard?.value += 3;
        }
      }
    },
  );

  static final wrecker = MonsterCardEffect(
    id: 'wrecker',
    name: 'Wrecker',
    description: 'After defeating this enemy, your weapon will break.',
    type: CombatEffectType.onKill,
    trigger: (data) {
      if (data.weaponCard != null) {
        data.graveyardCards.add(data.weaponCard!);
        data.weaponCard = null;
        data.durability = 0;
      }
    },
  );

  static final sticky = MonsterCardEffect(
    id: 'sticky',
    name: 'Sticky',
    description:
        'Fighting this monster will make you unable to flee for the rest of this turn.',
    type: CombatEffectType.onPicked,
    trigger: (data) {
      data.canFlee = false;
    },
  );

  static final poisonous = MonsterCardEffect(
    id: 'poisonous',
    name: 'Poisonous',
    description:
        'As long as this card is on a dungeon field, you will take 1 damage each turn.',
    type: CombatEffectType.onField,
    trigger: (data) {
      data.reduceHealth(1);
    },
  );

  static final opportunist = MonsterCardEffect(
    id: 'opportunist',
    name: 'Opportunist',
    description:
        'This monster will be 5 points stronger if you don\'t have a weapon.',
    type: CombatEffectType.onPicked,
    trigger: (data) {
      if (data.weaponCard == null) {
        data.buff = 5;
      }
    },
  );

  static final mimic = MonsterCardEffect(
    id: 'mimic',
    name: 'Mimic',
    description: 'This monster\'s power will mimic the power of your weapon.',
    type: CombatEffectType.onPicked,
    trigger: (data) {
      if (data.pickedCard != null && data.weaponCard != null) {
        data.pickedCard!.value = data.weaponCard!.value;
      }
    },
  );

  static final aftermath = MonsterCardEffect(
    id: 'aftermath',
    name: 'Aftermath',
    description:
        'After killing this enemy, you will take 0.5x of this monster\'s power as damage.',
    type: CombatEffectType.onKill,
    trigger: (data) {
      data.reduceHealth((data.pickedCard!.value / 2).toInt());
    },
  );

  static final vengeful = MonsterCardEffect(
    id: 'vengeful',
    name: 'Vengeful',
    description:
        'This enemy gains half the power of the last monster you killed.',
    type: CombatEffectType.onPicked,
    trigger: (data) {
      try {
        var firstMonster = data.graveyardCards.lastWhere(
          (card) => card is MonsterGameCard,
        );
        data.buff = (firstMonster.value / 2).toInt();
      } on StateError catch (_, _) {}
    },
  );

  static final burn = MonsterCardEffect(
    id: 'burn',
    name: 'Burn',
    description:
    'This enemy will leave burn effect that reduce your hitpoint by 1 for 3 turns',
    type: CombatEffectType.onPicked,
    trigger: (data) {
      int count = 3;
      if (count != 0){
        data.reduceHealth(1);
      }
    },
  );
}
