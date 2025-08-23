import '../../types/game_card_effect_type.dart';
import '../base/game_card_effect.dart';

class WeaponGameCardEffect extends GameCardEffect {
  WeaponGameCardEffect({
    required super.id,
    required super.name,
    required super.description,
    required super.type,
    required super.trigger,
  });

  static final holyHammer = WeaponGameCardEffect(
    id: 'holy-hammer',
    name: 'Holy Hammer',
    description: 'Fighting an enemy will recover 1 HP',
    type: GameCardEffectType.onUse,
    trigger: (data) {
      data.health += 1;
    },
  );

  static final artemisBow = WeaponGameCardEffect(
    id: 'artemis-bow',
    name: 'Artemis\'s Bow',
    description:
        'This weapon\'s durability will always recover to full when used',
    type: GameCardEffectType.onUse,
    trigger: (data) {
      data.durability = 20;
    },
  );

  static final tenaciousMallet = WeaponGameCardEffect(
    id: 'tenacious-mallet',
    name: 'Tenacious Mallet',
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

  static final ichorSickle = WeaponGameCardEffect(
    id: 'ichor-sickle',
    name: 'Ichor Sickle',
    description: 'This weapon will decrease the opponent\'s strength',
    type: GameCardEffectType.onUse,
    trigger: (data) {
      data.pickedCard?.value -= 3;
      if ((data.pickedCard?.value ?? 0) < 0) {
        data.pickedCard?.value = 0;
      }
    },
  );

  static final cursedAxe = WeaponGameCardEffect(
    id: 'cursed-axe',
    name: 'Cursed Axe',
    description:
        'This weapon\'s durability does not decay, but it needs to recharge after every use',
    type: GameCardEffectType.onUse,
    trigger: (data) {},
  );

  static final bloodlustBlade = WeaponGameCardEffect(
    id: 'bloodlust-blade',
    name: 'Bloodlust Blade',
    description: 'This weapon will increase in power everytime it\'s used',
    type: GameCardEffectType.onUse,
    trigger: (data) {
      data.buff = 1;
    },
  );

  static final blueStaff = WeaponGameCardEffect(
    id: 'blue-staff',
    name: 'Blue Staff',
    description: 'Every time this weapon is used, discard a card from the deck',
    type: GameCardEffectType.onUse,
    trigger: (data) {
      data.graveyardCards.add(data.deck.removeLast());
    },
  );

  static final warAxe = WeaponGameCardEffect(
    id: 'war-axe',
    name: 'War Axe',
    description: 'This weapon gets stronger for every 5 hp lost',
    type: GameCardEffectType.onUse,
    trigger: (data) {
      int hpLost = (4 - (data.health) / 5).toInt();
      data.tempBuff = hpLost * 3;
    },
  );

  static final mirrorBolt = WeaponGameCardEffect(
    id: 'mirror-bolt',
    name: 'Mirror Bolt',
    description:
        'This weapon will copy the strength of the monster you\'re facing',
    type: GameCardEffectType.onUse,
    trigger: (data) {
      data.weaponCard!.value = data.pickedCard!.value;
    },
  );
}
