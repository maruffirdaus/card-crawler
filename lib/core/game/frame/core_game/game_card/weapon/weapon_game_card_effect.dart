import 'package:card_crawler/core/game/frame/core_game/game_card/consumable/consumable_game_card.dart';
import 'package:card_crawler/core/game/frame/core_game/game_card/equipment/equipment_game_card.dart';
import 'package:card_crawler/core/game/frame/core_game/game_card/monster/monster_game_card.dart';

import '../base/game_card_effect_type.dart';
import '../base/game_card_effect.dart';

class WeaponGameCardEffect extends GameCardEffect {
  WeaponGameCardEffect({
    required super.id,
    required super.name,
    required super.description,
    required super.type,
    required super.trigger,
  });

  static final stormSplitter = WeaponGameCardEffect(
    id: 'storm-splitter',
    name: 'Storm Splitter',
    description: 'Fighting an enemy will recover 1 HP',
    type: GameCardEffectType.onUse,
    trigger: (data) {
      data.health += 1;
    },
  );

  static final starForgedHammer = WeaponGameCardEffect(
    id: 'starforged-hammer',
    name: 'Starforged Hammer',
    description:
        'This weapon\'s durability will always recover to full when used',
    type: GameCardEffectType.onUse,
    trigger: (data) {
      data.durability = 20;
    },
  );

  static final shadowFang = WeaponGameCardEffect(
    id: 'shadow-fang',
    name: 'Shadow Fang',
    description:
        'This weapon will deal more damage the lower it\'s durability is',
    type: GameCardEffectType.onUse,
    trigger: (data) {
      if (data.durability < 9 && data.durability >= 6) {
        data.tempBuff = 3;
      } else if (data.durability < 6) {
        data.tempBuff = 5;
      }
    },
  );

  static final skullSplitter = WeaponGameCardEffect(
    id: 'skull-splitter',
    name: 'skull-splitter',
    description: 'This weapon will decrease the opponent\'s strength',
    type: GameCardEffectType.onUse,
    trigger: (data) {
      data.pickedCard?.value -= 3;
      if ((data.pickedCard?.value ?? 0) < 0) {
        data.pickedCard?.value = 0;
      }
    },
  );

  static final eternalCleaver = WeaponGameCardEffect(
    id: 'eternal-cleaver',
    name: 'Eternal Cleaver',
    description:
        'This weapon\'s durability does not decay, but it needs to recharge after every use',
    type: GameCardEffectType.onUse,
    trigger: (data) {},
  );

  static final yamatsumi = WeaponGameCardEffect(
    id: 'yamatsumi',
    name: 'Yamatsumi',
    description: 'This weapon will increase in power everytime it\'s used',
    type: GameCardEffectType.onUse,
    trigger: (data) {
      data.buff = 1;
    },
  );

  static final kokuryu = WeaponGameCardEffect(
    id: 'kokuryu',
    name: 'Kokuryu',
    description: 'Every time this weapon is used, discard a card from the deck',
    type: GameCardEffectType.onUse,
    trigger: (data) {
      data.graveyardCards.add(data.deck.removeLast());
    },
  );

  static final stiletto = WeaponGameCardEffect(
    id: 'stiletto',
    name: 'Stiletto',
    description: 'This weapon gets stronger for every 5 hp lost',
    type: GameCardEffectType.onUse,
    trigger: (data) {
      int hpLost = (4 - (data.health) / 5).toInt();
      data.tempBuff = hpLost * 3;
    },
  );

  static final morningStar = WeaponGameCardEffect(
    id: 'morning-star',
    name: 'Morning Star',
    description:
        'This weapon will copy the strength of the monster you\'re facing',
    type: GameCardEffectType.onUse,
    trigger: (data) {
      data.weaponCard!.value = data.pickedCard!.value;
    },
  );

  static final bladedNunchaku = WeaponGameCardEffect(
    id: 'bladed-nunchaku',
    name: 'bladed Nunchaku',
    description:
        'This weapon will increase its durability if you choose equipment',
    type: GameCardEffectType.onUse,
    trigger: (data) {
      if (data.pickedCard is EquipmentGameCard) {
        data.durability += 2;
      }
    },
  );

  static final excalibur = WeaponGameCardEffect(
    id: 'excalibur',
    name: 'Excalibur',
    description:
        'This weapon will increase health by 2 after you slay an enemy',
    type: GameCardEffectType.onUse,
    trigger: (data) {
      if (data.pickedCard is MonsterGameCard) {
        data.health += 2;
      }
    },
  );

  static final espadaLarga = WeaponGameCardEffect(
    id: 'espada-larga',
    name: 'Espada Larga',
    description: 'Every turn, this weapon will increase durability',
    type: GameCardEffectType.onUse,
    trigger: (data) {
      data.durability += 1;
    },
  );

  static final shamshir = WeaponGameCardEffect(
    id: 'shamshir',
    name: 'Shamshir',
    description: 'This weapon will give 1 temp buff',
    type: GameCardEffectType.onUse,
    trigger: (data) {
      data.tempBuff = 1;
    },
  );

  static final kris = WeaponGameCardEffect(
    id: 'kris',
    name: 'kris',
    description:
        'This weapon will increase health by 2 if u have below 2 health, and increase durability 5 otherwise',
    type: GameCardEffectType.onUse,
    trigger: (data) {
      if (data.health < 10 && data.pickedCard is MonsterGameCard) {
        data.health += 2;
      }
      if (data.health >= 10 && data.pickedCard is MonsterGameCard) {
        data.durability += 5;
      }
    },
  );

  static final deathCrescent = WeaponGameCardEffect(
    id: 'death-crescent',
    name: 'Death’s Crescent',
    description: 'This weapon will add durability by 2 if you take consumables',
    type: GameCardEffectType.onUse,
    trigger: (data) {
      if (data.pickedCard is ConsumableGameCard) {
        data.durability += 2;
      }
    },
  );

  static final khopesh = WeaponGameCardEffect(
    id: 'khopesh',
    name: 'Khopesh',
    description:
        'This weapon will heal for 2 and reduce durability by 1 every turn',
    type: GameCardEffectType.onUse,
    trigger: (data) {
      data.health += 2;
      data.durability -= 1;
    },
  );

  static final fangOfRiton = WeaponGameCardEffect(
    id: 'fang-of-riton',
    name: 'Fang Of Riton',
    description:
        'This weapon will add 3 durability the more you take more equipments',
    type: GameCardEffectType.onUse,
    trigger: (data) {
      if (data.pickedCard is EquipmentGameCard) {
        data.durability += 3;
      }
    },
  );

  static final shepherdStaff = WeaponGameCardEffect(
    id: 'shepherd-staff',
    name: 'Shepherd Staff',
    description: 'This weapon will add durability by 1 every turn',
    type: GameCardEffectType.onUse,
    trigger: (data) {
      data.durability += 1;
    },
  );

  static final gladius = WeaponGameCardEffect(
    id: 'gladius',
    name: 'Gladius',
    description:
        'This weapon will add 5 durability if you have less than 5, but add health by 1 otherwise',
    type: GameCardEffectType.onUse,
    trigger: (data) {
      if (data.durability < 5) {
        data.durability += 3;
      }
      if (data.durability >= 5) {
        data.health += 1;
      }
    },
  );

  static final doomSpire = WeaponGameCardEffect(
    id: 'doom-spire',
    name: 'Doom Spire',
    description: 'This weapon will reduce hp by 1 but add your durability by 3',
    type: GameCardEffectType.onUse,
    trigger: (data) {
      data.health -= 1;
      data.durability += 3;
    },
  );

  static final poseidonFang = WeaponGameCardEffect(
    id: 'poseidon-fang',
    name: 'Poseidon Fang',
    description: 'This weapon will mitigate freeze effect',
    type: GameCardEffectType.onUse,
    trigger: (data) {},
  );
}
