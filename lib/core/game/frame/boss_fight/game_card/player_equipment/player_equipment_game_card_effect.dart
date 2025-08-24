import '../base/boss_fight_game_card_effect_type.dart';
import '../base/boss_fight_game_card_effect.dart';

class PlayerEquipmentGameCardEffect extends BossFightGameCardEffect {
  PlayerEquipmentGameCardEffect({
    required super.id,
    required super.name,
    required super.description,
    required super.type,
    required super.trigger,
  });

  static final lightArmor = PlayerEquipmentGameCardEffect(
    id: 'be0',
    name: 'Light Armor',
    description:
        'Deal 4 damage whenever you take a 3rd or more action before the boss moves.',
    type: BossFightGameCardEffectType.equipmentCard,
    trigger: (data) {
      if (data.bossTurnSkip > 0) {
        data.reduceBossHealth((2 * data.bossDefenseMultiplier).toInt());
      }
    },
  );

  static final amethystGauntlet = PlayerEquipmentGameCardEffect(
    id: 'be1',
    name: 'Amethyst Gauntlet',
    description: 'You heal an additional 25% from effects.',
    type: BossFightGameCardEffectType.equipmentCard,
    trigger: (data) {
      data.playerHealingMultiplier += 0.25;
    },
  );

  static final knightsBreastplate = PlayerEquipmentGameCardEffect(
    id: 'be2',
    name: 'Knight\'s Breastplate',
    description: 'You take 15% less damage.',
    type: BossFightGameCardEffectType.equipmentCard,
    trigger: (data) {
      data.playerDefenseMultiplier -= 0.15;
    },
  );

  static final emeraldGauntlet = PlayerEquipmentGameCardEffect(
    id: 'be3',
    name: 'Emerald Gauntlet',
    description: 'Whenever you use a buff card, heal for 2.',
    type: BossFightGameCardEffectType.equipmentCard,
    trigger: (data) {
      if (!data.playerSkipped) {
        if (data.playerPickedCard!.effect.type ==
            BossFightGameCardEffectType.buff) {
          data.increasePlayerHealth(2);
        }
      }
    },
  );

  static final swordsmanArmor = PlayerEquipmentGameCardEffect(
    id: 'be4',
    name: 'Swordsman Armor',
    description: 'You deal 15% more damage.',
    type: BossFightGameCardEffectType.equipmentCard,
    trigger: (data) {
      data.playerAttackMultiplier += 0.15;
    },
  );

  static final superiorArmor = PlayerEquipmentGameCardEffect(
    id: 'be5',
    name: 'Superior Armor',
    description: 'If your turn is skipped, you take 30% less damage.',
    type: BossFightGameCardEffectType.equipmentCard,
    trigger: (data) {
      if (data.playerSkipped) {
        if (data.playerPickedCard!.effect.type ==
            BossFightGameCardEffectType.buff) {
          data.increasePlayerHealth(2);
        }
      }
    },
  );

  //new armor for boss 2

  static final desertArmor = PlayerEquipmentGameCardEffect(
    id: 'be6',
    name: 'Desert Armor',
    description:
        'Heals for 2 if the opponent used a heal card for their last action.',
    type: BossFightGameCardEffectType.equipmentCard,
    trigger: (data) {
      if (data.bossPickedCard!.effect.type ==
          BossFightGameCardEffectType.heal) {
        data.increasePlayerHealth(2);
      }
    },
  );

  static final cursedShield = PlayerEquipmentGameCardEffect(
    id: 'be7',
    name: 'Desert Armor',
    description:
        'Deal 2 damage to the opponent if the opponent used a heal card for their last action.',
    type: BossFightGameCardEffectType.equipmentCard,
    trigger: (data) {
      if (data.bossPickedCard!.effect.type ==
          BossFightGameCardEffectType.heal) {
        data.reduceBossHealth(2);
      }
    },
  );

  static final maddeningShelter = PlayerEquipmentGameCardEffect(
    id: 'be8',
    name: 'Maddening Shelter',
    description:
        'You do 25% more damage, but you take 3 damage everytime you\'re not attacking',
    type: BossFightGameCardEffectType.equipmentCard,
    trigger: (data) {
      data.playerAttackMultiplier += 0.25;
      if (!data.playerSkipped) {
        if (data.playerPickedCard!.effect.type !=
            BossFightGameCardEffectType.attack) {
          data.reducePlayerHealth(3);
        }
      } else {
        data.reducePlayerHealth(3);
      }
    },
  );

  static final vulnerabilityExposer = PlayerEquipmentGameCardEffect(
    id: 'be9',
    name: 'Vulnerability Exposer',
    description:
        'You and the opponent will take 25% more damage whenever turn is skipped',
    type: BossFightGameCardEffectType.equipmentCard,
    trigger: (data) {
      if (data.playerSkipped || data.bossSkipped) {
        data.playerDefenseMultiplier -= 0.25;
        data.bossDefenseMultiplier -= 0.25;
      }
    },
  );

  static final unholyAura = PlayerEquipmentGameCardEffect(
    id: 'be10',
    name: 'Unholy Aura',
    description: 'You and the opponent healing capability is halved.',
    type: BossFightGameCardEffectType.equipmentCard,
    trigger: (data) {
      data.playerHealingMultiplier -= 0.5;
      data.bossHealingMultiplier -= 0.5;
    },
  );

  static final vampiricStrength = PlayerEquipmentGameCardEffect(
    id: 'be11',
    name: 'Vampiric Strength',
    description:
        'You recover 5 health everytime you attack, but you take 3 damage when not attacking.',
    type: BossFightGameCardEffectType.equipmentCard,
    trigger: (data) {
      if (!data.playerSkipped) {
        if (data.playerPickedCard!.effect.type !=
            BossFightGameCardEffectType.attack) {
          data.reducePlayerHealth(3);
        } else {
          data.increasePlayerHealth(5);
        }
      } else {
        data.reducePlayerHealth(3);
      }
    },
  );

  //new equipment for boss 3

  static final midasTouch = PlayerEquipmentGameCardEffect(
    id: 'be12',
    name: 'Midas\'s Touch',
    description:
        'When attacking an enemy, do an extra 7 damage unaffected by modifiers, but they permanently take 10% less damage everytime you attack.',
    type: BossFightGameCardEffectType.equipmentCard,
    trigger: (data) {
      if (!data.playerSkipped) {
        if (data.playerPickedCard!.effect.type ==
            BossFightGameCardEffectType.attack) {
          data.reduceBossHealth(7);
          data.bossBaseDefenseMultiplier += 0.1;
        }
      }
    },
  );

  static final timelessPiece = PlayerEquipmentGameCardEffect(
    id: 'be13',
    name: 'Timeless Piece',
    description:
        'Whenever you or the opponent\'s turn is skipped, deal 2 damage to yourself and 3 damage to the opponent.',
    type: BossFightGameCardEffectType.equipmentCard,
    trigger: (data) {
      if (data.playerSkipped || data.bossSkipped) {
        data.reducePlayerHealth(2);
        data.reduceBossHealth(3);
      }
    },
  );

  static final icarusWings = PlayerEquipmentGameCardEffect(
    id: 'be14',
    name: 'Icarus\'s Wings',
    description: 'You deal 20% more damage, but takes 20% more damage',
    type: BossFightGameCardEffectType.equipmentCard,
    trigger: (data) {
      data.playerAttackMultiplier += 0.2;
      data.playerDefenseMultiplier += 0.2;
    },
  );

  static final pandorasBox = PlayerEquipmentGameCardEffect(
    id: 'be15',
    name: 'Pandora\'s Box',
    description:
        'Activates 3 different effect over 3 turns, after that this equipment will destroy itself.',
    type: BossFightGameCardEffectType.equipmentCard,
    trigger: (data) {
      if (data.pandorasBox == 3) {
        data.reducePlayerHealth(7);
        data.reduceBossHealth(7);
        data.pandorasBox--;
      } else if (data.pandorasBox == 2) {
        data.playerDefenseMultiplier += 2;
        data.bossDefenseMultiplier += 2;
        data.pandorasBox--;
      } else if (data.pandorasBox == 1) {
        data.increasePlayerHealth(15);
        data.pandorasBox--;
      } else if (data.pandorasBox == 0) {
        for (int i = 0; i < data.playerEquipmentCards.length; i++) {
          if (data.playerEquipmentCards[i].effect.id == 'be15') {
            data.playerEquipmentCards.remove(data.playerEquipmentCards[i]);
          }
        }
      }
    },
  );

  static final monkeysGloves = PlayerEquipmentGameCardEffect(
    id: 'be16',
    name: 'Monkey\'s Gloves',
    description: 'When refreshing your hand, deals 5 damage to the opponent.',
    type: BossFightGameCardEffectType.equipmentCard,
    trigger: (data) {
      if (data.monkeyPawOn) {
        data.reduceBossHealth(5);
        data.monkeyPawOn = false;
      }
    },
  );

  static final conquerersArmor = PlayerEquipmentGameCardEffect(
    id: 'be17',
    name: 'Conquerer\'s Armor',
    description: 'You take 30% less damage, but deal 15% less attack.',
    type: BossFightGameCardEffectType.equipmentCard,
    trigger: (data) {
      data.playerDefenseMultiplier -= 0.30;
      data.playerAttackMultiplier -= 0.15;
    },
  );
}
