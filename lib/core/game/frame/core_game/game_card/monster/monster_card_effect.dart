import '../base/game_card_effect_type.dart';
import '../base/game_card_effect.dart';
import '../equipment/equipment_game_card_effect.dart';
import 'monster_game_card.dart';

class MonsterGameCardEffect extends GameCardEffect {
  MonsterGameCardEffect({
    required super.id,
    required super.name,
    required super.description,
    required super.type,
    required super.trigger,
  });

  static final noEscape = MonsterGameCardEffect(
    id: 'no-escape',
    name: 'No Escape',
    description:
        'When this card is on the dungeon field, you can\'t flee until next round.',
    type: GameCardEffectType.onField,
    trigger: (data) {
      data.canFlee = false;
    },
  );

  static final scaling = MonsterGameCardEffect(
    id: 'scaling',
    name: 'Scaling',
    description:
        'This card\'s strength will increase by 1 for every round that have been played.',
    type: GameCardEffectType.onPicked,
    trigger: (data) {
      data.buff = data.round;
    },
  );

  static final spiky = MonsterGameCardEffect(
    id: 'spiky',
    name: 'Spiky',
    description: 'Fighting this monster will lose you 3 health.',
    type: GameCardEffectType.onPicked,
    trigger: (data) {
      data.reduceHealth(3);
    },
  );

  static final antiHeal = MonsterGameCardEffect(
    id: 'anti-heal',
    name: 'Anti Heal',
    description:
        'After defeating this enemy, healing potion won\'t heal you until the start of next turn.',
    type: GameCardEffectType.onKill,
    trigger: (data) {
      data.hasHealed = true;
    },
  );

  static final corrosive = MonsterGameCardEffect(
    id: 'corrosive',
    name: 'Corrosive',
    description: 'Fighting this monster will lose you 3 durability.',
    type: GameCardEffectType.onKill,
    trigger: (data) {
      data.durability -= 3;
      if (data.durability < 0) {
        data.durability = 0;
      }
    },
  );

  static final ally = MonsterGameCardEffect(
    id: 'ally',
    name: 'Ally',
    description:
        'After defeating this enemy, this enemy will act as your weapon.',
    type: GameCardEffectType.onKill,
    trigger: (data) {
      var newWeaponCard = data.graveyardCards.removeLast();
      if (data.weaponCard != null) data.graveyardCards.add(data.weaponCard!);
      data.weaponCard = newWeaponCard;
      data.durability = 20;
      for (var card in data.equipmentCards) {
        if (card.effect == EquipmentGameCardEffect.kalkanBreastplate) {
          data.weaponCard?.value += 3;
        }
      }
    },
  );

  static final wrecker = MonsterGameCardEffect(
    id: 'wrecker',
    name: 'Wrecker',
    description: 'After defeating this enemy, your weapon will break.',
    type: GameCardEffectType.onKill,
    trigger: (data) {
      if (data.weaponCard != null) {
        data.graveyardCards.add(data.weaponCard!);
        data.weaponCard = null;
        data.durability = 0;
      }
    },
  );

  static final sticky = MonsterGameCardEffect(
    id: 'sticky',
    name: 'Sticky',
    description:
        'Fighting this monster will make you unable to flee for the rest of this turn.',
    type: GameCardEffectType.onPicked,
    trigger: (data) {
      data.canFlee = false;
    },
  );

  static final poisonous = MonsterGameCardEffect(
    id: 'poisonous',
    name: 'Poisonous',
    description:
        'As long as this card is on a dungeon field, you will take 1 damage each turn.',
    type: GameCardEffectType.onField,
    trigger: (data) {
      data.reduceHealth(1);
    },
  );

  static final opportunist = MonsterGameCardEffect(
    id: 'opportunist',
    name: 'Opportunist',
    description:
        'This monster will be 5 points stronger if you don\'t have a weapon.',
    type: GameCardEffectType.onPicked,
    trigger: (data) {
      if (data.weaponCard == null) {
        data.buff = 5;
      }
    },
  );

  static final mimic = MonsterGameCardEffect(
    id: 'mimic',
    name: 'Mimic',
    description: 'This monster\'s power will mimic the power of your weapon.',
    type: GameCardEffectType.onPicked,
    trigger: (data) {
      if (data.pickedCard != null && data.weaponCard != null) {
        data.pickedCard!.value = data.weaponCard!.value;
      }
    },
  );

  static final aftermath = MonsterGameCardEffect(
    id: 'aftermath',
    name: 'Aftermath',
    description:
        'After killing this enemy, you will take 0.5x of this monster\'s power as damage.',
    type: GameCardEffectType.onKill,
    trigger: (data) {
      data.reduceHealth((data.pickedCard!.value / 2).toInt());
    },
  );

  static final vengeful = MonsterGameCardEffect(
    id: 'vengeful',
    name: 'Vengeful',
    description:
        'This enemy gains half the power of the last monster you killed.',
    type: GameCardEffectType.onPicked,
    trigger: (data) {
      try {
        var firstMonster = data.graveyardCards.lastWhere(
          (card) => card is MonsterGameCard,
        );
        data.buff = (firstMonster.value / 2).toInt();
      } on StateError catch (_, _) {}
    },
  );

  static final burn = MonsterGameCardEffect(
    id: 'burn',
    name: 'Burn',
    description:
    'This enemy will leave burn effect that reduce your hitpoint by 1 for 3 turns',
    type: GameCardEffectType.onPicked,
    trigger: (data) {
      if (data.hasEquipment('lorica-segmentata')) {
        return; // skip burn
      }else if(data.hasEquipment('ruby-wyrmbark-breastplate')){
        data.health += 2;
      }
      // Set burn for 3 turns
      data.burnCounter = 3;
    },
  );
}
