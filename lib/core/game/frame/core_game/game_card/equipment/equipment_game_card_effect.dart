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

  static final maximilianPlate = EquipmentGameCardEffect(
    id: 'maximilian-plate',
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

  static final jackOfPlate = EquipmentGameCardEffect(
    id: 'jack-of-plate',
    name: 'Jack of Plate',
    description:
    'When having this equipment equipped, your weapon\'s durability will recover by 3 every turn',
    type: GameCardEffectType.equipmentCard,
    trigger: (data) {
      if (data.weaponCard != null) {
        data.durability += 3;
      }
    },
  );

  static final kalkanBreastplate = EquipmentGameCardEffect(
    id: 'kalkan-breastplate',
    name: 'Kalkan Breastplate',
    description:
    'When you get a new weapon with this equipment equipped, that weapon\'s strength is increased by 3',
    type: GameCardEffectType.equipmentCard,
    trigger: (data) {
      if (data.pickedCard is WeaponGameCard) {
        data.pickedCard?.value += 3;
      }
    },
  );

  static final armorOfAchilles = EquipmentGameCardEffect(
    id: 'armor-of-achilles',
    name: 'Armor of Achilles',
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

  static final celestialAegis = EquipmentGameCardEffect(
    id: 'celestial-aegis',
    name: 'Celestial Aegis',
    description: 'When having this equipment equipped, you can always flee',
    type: GameCardEffectType.equipmentCard,
    trigger: (data) {},
  );

  static final sunBlessedAegis = EquipmentGameCardEffect(
    id: 'sunblessed-aegis',
    name: 'Sunblessed Aegis',
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

  static final stormPlateOfTempest = EquipmentGameCardEffect(
    id: 'storm-plate-of-tempest',
    name: 'Celestial Aegis',
    description: 'When having this equipment equipped, Heal for 2 health every turn',
    type: GameCardEffectType.equipmentCard,
    trigger: (data) {
      data.health += 2;
    },
  );

  static final gambeson = EquipmentGameCardEffect(
    id: 'gambeson',
    name: 'Gambeson',
    description: 'When having this equipment equipped, heal for 8 hit points if your current hit points is below 10, otherwise heal 4 hit points',
    type: GameCardEffectType.equipmentCard,
    trigger: (data) {
      if (data.health < 10){
        data.health += 8;
      }else{
        data.health += 4;
      }
    },
  );

  static final gambelash = EquipmentGameCardEffect(
    id: 'gambelash',
    name: 'Gambelash',
    description: 'When having this equipment equipped, reduce weapon durability by 8, but heal 8 health',
    type: GameCardEffectType.equipmentCard,
    trigger: (data) {
      if(data.pickedCard is WeaponGameCard){
        data.pickedCard?.value -= 8;
        data.health += 8;
      }
    },
  );

  static final hussitePlate = EquipmentGameCardEffect(
    id: 'hussite-plate',
    name: 'Hussite Plate',
    description: 'When having this equipment equipped, if you take any consumables or weapon, equipment durability will increased by 2',
    type: GameCardEffectType.equipmentCard,
    trigger: (data) {
      if(data.pickedCard is ConsumableGameCard || data.pickedCard is WeaponGameCard){
        data.durability += 2;
      }
    },
  );

  static final spiritForgedMail = EquipmentGameCardEffect(
    id: 'spirit-forged-mail',
    name: 'Spirit Forged Mail',
    description: 'When having this equipment equipped, you can\'t get poisoned',
    type: GameCardEffectType.equipmentCard,
    trigger: (data) { //cant get poisoned
    },
  );

  static final stormBreakerCuirass = EquipmentGameCardEffect(
    id: 'stormbreaker-cuirass',
    name: 'Storm breaker Cuirass',
    description: 'When having this equipment equipped, you can\'t get corrosion',
    type: GameCardEffectType.equipmentCard,
    trigger: (data) {}, //cant get corrosion
  );

  static final loricaSegmentata = EquipmentGameCardEffect(
    id: 'lorica-segmentata',
    name: 'Lorica Segmentata',
    description: 'When having this equipment equipped, you can\'t get burned',
    type: GameCardEffectType.equipmentCard,
    trigger: (data) {}, //cant get burned
  );

  static final pectoralArmor = EquipmentGameCardEffect(
    id: 'pectoralArmor',
    name: 'Pectoral Armor',
    description: 'When having this equipment equipped, if weapon durability is above 5, it will heal for 5 health, otherwise it will increase durability by 3',
    type: GameCardEffectType.equipmentCard,
    trigger: (data) {
      if (data.pickedCard is WeaponGameCard) {
        final weapon = data.pickedCard as WeaponGameCard;
        if (weapon.value >= 5) {
          data.health += 5;
        } else {
          data.durability += 5;
        }
      }
    },
  );

  static final lamellarArmor = EquipmentGameCardEffect(
    id: 'lamellar-armor',
    name: 'Lamellar Armor',
    description: 'When having this equipment equipped, if you take consumables, you will gain 1 more health',
    type: GameCardEffectType.equipmentCard,
    trigger: (data) {
      if(data.pickedCard is ConsumableGameCard){
        data.health += 1;
      }
    },
  );

  static final oYoroi = EquipmentGameCardEffect(
    id: 'o-yoroi',
    name: 'O-Yoroi',
    description: 'When having this equipment equipped, you reduce health by 2, but increase weapon durability by 10',
    type: GameCardEffectType.equipmentCard,
    trigger: (data) {
      if(data.pickedCard is MonsterGameCard){
        data.durability += 5;
        data.health -= 1;
      }
    },
  );

  static final verdantBreastplate = EquipmentGameCardEffect(
    id: 'verdant-breastplate',
    name: 'Verdant Breastplate',
    description: 'When having this equipment equipped, you can always flee',
    type: GameCardEffectType.equipmentCard,
    trigger: (data) {
      data.health += 1;
    },
  );

  static final forestWardenArmor = EquipmentGameCardEffect(
    id: 'forest-warden-armor',
    name: 'Forestwarden Armor',
    description: 'When having this equipment equipped, you can always flee',
    type: GameCardEffectType.equipmentCard,
    trigger: (data) {
      if (data.health < 5){
        data.health += 5;
      }
    },
  );

  static final easternGuardianPlate = EquipmentGameCardEffect(
    id: 'eastern-guardian-plate',
    name: 'Eastern Guardian Plate',
    description: 'When having this equipment equipped, the damage you get will be capped to 5 health',
    type: GameCardEffectType.equipmentCard,
    trigger: (data) {},
  );

  static final rubyWyrmbarkBreastplate = EquipmentGameCardEffect(
    id: 'ruby-wyrmbark-breastplate',
    name: 'Ruby Wyrmbark Breastplate',
    description: 'When having this equipment equipped, burn effect heals you for 2 health',
    type: GameCardEffectType.equipmentCard,
    trigger: (data) {
    },
  );
}
