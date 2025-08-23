import '../../../common/combat_effect/combat_effect.dart';
import '../../../common/combat_effect/combat_effect_type.dart';
import '../../models/boss_fight_data.dart';

class PlayerEquipmentCardEffect extends CombatEffect {
  PlayerEquipmentCardEffect({
    required super.id,
    required super.name,
    required super.description,
    required super.type,
    required Function(BossFightData) trigger,
  }) {
    super.triggerOnBossFight = trigger;
  }

  static final lightArmor = PlayerEquipmentCardEffect(
    id: 'be0',
    name: 'Light Armor',
    description: 'Deal extra 2 damage everytime you take an extra action.',
    type: CombatEffectType.equipmentCard,
    trigger: (data) {
      if (data.bossTurnSkip > 0){
        data.reduceBossHealth((2 * data.bossDefenseMultiplier).toInt());
      }
    },
  );

  static final amethystGauntlet = PlayerEquipmentCardEffect(
    id: 'be1',
    name: 'Amethyst Gauntlet',
    description: 'You heal an additional 25% from effects.',
    type: CombatEffectType.equipmentCard,
    trigger: (data) {
      data.playerHealingMultiplier += 0.25;
      }
  );

  static final knightsBreastplate = PlayerEquipmentCardEffect(
      id: 'be2',
      name: 'Knight\'s Breastplate',
      description: 'You take 15% less damage.',
      type: CombatEffectType.equipmentCard,
      trigger: (data) {
        data.playerDefenseMultiplier -= 0.15;
      }
  );

  static final emeraldGauntlet = PlayerEquipmentCardEffect(
      id: 'be3',
      name: 'Emerald Gauntlet',
      description: 'Whenever you use a buff card, heal for 2.',
      type: CombatEffectType.equipmentCard,
      trigger: (data) {
        if (!data.playerSkipped){
          if (data.playerPickedCard!.effect.type == CombatEffectType.buff){
            data.increasePlayerHealth(2);
          }
        }
      }
  );

  static final swordsmanArmor = PlayerEquipmentCardEffect(
      id: 'be4',
      name: 'Swordsman Armor',
      description: 'You deal 15% more damage.',
      type: CombatEffectType.equipmentCard,
      trigger: (data) {
        data.playerAttackMultiplier += 0.15;
      }
  );

  static final lastLineOfDefense = PlayerEquipmentCardEffect(
      id: 'be5',
      name: 'Last Line Of Defense',
      description: 'If your turn is skipped, you take 30% less damage.',
      type: CombatEffectType.equipmentCard,
      trigger: (data) {
        if (data.playerSkipped){
          if (data.playerPickedCard!.effect.type == CombatEffectType.buff){
            data.increasePlayerHealth(2);
          }
        }
      }
  );

  //new armor for boss 2

  static final desertArmor = PlayerEquipmentCardEffect(
      id: 'be6',
      name: 'Desert Armor',
      description: 'Heals for 2 if the opponent used a heal card for their last action.',
      type: CombatEffectType.equipmentCard,
      trigger: (data) {
        if (data.bossPickedCard!.effect.type == CombatEffectType.heal){
          data.increasePlayerHealth(2);
        }
      }
  );

  static final cursedShield = PlayerEquipmentCardEffect(
      id: 'be7',
      name: 'Desert Armor',
      description: 'Deal 2 damage to the opponent if the opponent used a heal card for their last action.',
      type: CombatEffectType.equipmentCard,
      trigger: (data) {
        if (data.bossPickedCard!.effect.type == CombatEffectType.heal){
          data.reduceBossHealth(2);
        }
      }
  );

  static final maddeningShelter = PlayerEquipmentCardEffect(
      id: 'be8',
      name: 'Maddening Shelter',
      description: 'You do 25% more damage, but you take 4 damage everytime you\'re not attacking',
      type: CombatEffectType.equipmentCard,
      trigger: (data) {
        data.playerAttackMultiplier += 0.25;
        if (!data.playerSkipped){
          if (data.playerPickedCard!.effect.type != CombatEffectType.attack){
            data.reducePlayerHealth(4);
          }
        } else {
          data.reducePlayerHealth(4);
        }
      }
  );

  static final vulnerabilityExposer = PlayerEquipmentCardEffect(
      id: 'be9',
      name: 'Vulnerability Exposer',
      description: 'You and the opponent will take 25% more damage whenever turn is skipped',
      type: CombatEffectType.equipmentCard,
      trigger: (data) {
        if (data.playerSkipped || data.bossSkipped){
          data.playerDefenseMultiplier -= 0.25;
          data.bossDefenseMultiplier -= 0.25;
        }
      }
  );

  static final unholyAura = PlayerEquipmentCardEffect(
      id: 'be10',
      name: 'Unholy Aura',
      description: 'You and the opponent healing capability is halved.',
      type: CombatEffectType.equipmentCard,
      trigger: (data) {
        data.playerHealingMultiplier -= 0.5;
        data.bossHealingMultiplier -= 0.5;
      }
  );

  static final vampiricStrength = PlayerEquipmentCardEffect(
      id: 'be11',
      name: 'Vampiric Strength',
      description: 'You recover 5 health everytime you attack, but you take 3 damage when not attacking.',
      type: CombatEffectType.equipmentCard,
      trigger: (data) {
        if (!data.playerSkipped){
          if (data.playerPickedCard!.effect.type != CombatEffectType.attack){
            data.reducePlayerHealth(3);
          } else {
            data.increasePlayerHealth(5);
          }
        } else {
          data.reducePlayerHealth(3);
        }
      }
  );

  //new equipment for boss 3

  static final midasTouch = PlayerEquipmentCardEffect(
      id: 'be12',
      name: 'Midas\'s Touch',
      description: 'When attacking an enemy, do an extra 7 damage unaffected by modifiers, but they permanently take 10% less damage everytime you attack.',
      type: CombatEffectType.equipmentCard,
      trigger: (data) {
        if (!data.playerSkipped){
          if (data.playerPickedCard!.effect.type == CombatEffectType.attack){
            data.reduceBossHealth(7);
            data.bossBaseDefenseMultiplier += 0.1;
          }
        }
      }
  );

  static final timelessPiece = PlayerEquipmentCardEffect(
      id: 'be13',
      name: 'Timeless Piece',
      description: 'Whenever you or the opponent\'s turn is skipped, deal 2 damage to yourself and 3 damage to the opponent.',
      type: CombatEffectType.equipmentCard,
      trigger: (data) {
        if (data.playerSkipped || data.bossSkipped){
          data.reducePlayerHealth(2);
          data.reduceBossHealth(3);
        }
      }
  );

  static final icarusWings = PlayerEquipmentCardEffect(
      id: 'be14',
      name: 'Icarus\'s Wings',
      description: 'You deal 20% more damage, but takes 20% more damage',
      type: CombatEffectType.equipmentCard,
      trigger: (data) {
        data.playerAttackMultiplier += 0.2;
        data.playerDefenseMultiplier += 0.2;
      }
  );

  static final pandorasBox = PlayerEquipmentCardEffect(
      id: 'be15',
      name: 'Pandora\'s Box',
      description: 'Activates 3 different effect over 3 turns, after that this equipment will destroy itself.',
      type: CombatEffectType.equipmentCard,
      trigger: (data) {
        if (data.pandorasBox == 3){
          data.reducePlayerHealth(7);
          data.reduceBossHealth(7);
          data.pandorasBox--;
        } else if (data.pandorasBox == 2){
          data.playerDefenseMultiplier += 2;
          data.bossDefenseMultiplier += 2;
          data.pandorasBox--;
        } else if (data.pandorasBox == 1){
          data.increasePlayerHealth(15);
          data.pandorasBox--;
        } else if (data.pandorasBox == 0){
          for (int i = 0; i < data.equipmentCards.length; i++) {
            if (data.equipmentCards[i].effect.id == 'be15') {
              data.equipmentCards.remove(data.equipmentCards[i]);
            }
          }
        }
      }
  );

  static final monkeysGloves = PlayerEquipmentCardEffect(
      id: 'be16',
      name: 'Monkey\'s Gloves',
      description: 'You are always allowed to refresh your hand.',
      type: CombatEffectType.equipmentCard,
      trigger: (data) {
        data.canRefresh = true;
      }
  );

  static final conquerersArmor = PlayerEquipmentCardEffect(
      id: 'be17',
      name: 'Conquerer\'s Armor',
      description: 'You take 30% less damage, but deal 15% less attack.',
      type: CombatEffectType.equipmentCard,
      trigger: (data) {
        data.playerDefenseMultiplier -= 0.30;
        data.playerAttackMultiplier -= 0.15;
      }
  );
}
