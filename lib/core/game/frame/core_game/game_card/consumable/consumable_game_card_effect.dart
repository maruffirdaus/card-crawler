import 'package:card_crawler/core/game/frame/core_game/models/core_game_data.dart';

import '../../../common/combat_effect/combat_effect.dart';
import '../../../common/combat_effect/combat_effect_type.dart';

class ConsumableCardEffect extends CombatEffect {
  ConsumableCardEffect({
    required super.id,
    required super.name,
    required super.description,
    required super.type,
    required Function(CoreGameData) trigger,
  }) {
    super.triggerOnCoreGame = trigger;
  }

  static final temporalDew = ConsumableCardEffect(
    id: 'temporal-dew',
    name: 'Temporal Dew',
    description:
        'Aside from healing, this potion will restore your durability, and allows you to heal and flee again this turn',
    type: CombatEffectType.onPicked,
    trigger: (data) {
      if (data.weaponCard != null) {
        data.durability = 20;
      }
      data.canFlee = true;
    },
  );

  static final titansShroom = ConsumableCardEffect(
    id: 'titan-shrooms',
    name: 'Titan\'s Shrooms',
    description:
        'This Mushroom will increase your weapon\'s strength by 3 points',
    type: CombatEffectType.onPicked,
    trigger: (data) {
      if (data.weaponCard != null) {
        data.weaponCard?.value += 3;
      }
    },
  );

  static final emeticElixir = ConsumableCardEffect(
    id: 'emetic-elixir',
    name: 'Emetic Elixir',
    description: 'Discard 3 cards from the deck',
    type: CombatEffectType.onPicked,
    trigger: (data) {
      for (int i = 0; i < 3; i++) {
        if (data.deck.isNotEmpty) {
          data.graveyardCards.add(data.deck.removeLast());
        }
      }
    },
  );

  static final bolterPotion = ConsumableCardEffect(
    id: 'bolter-potion',
    name: 'Bolter Potion',
    description:
        'Return the remaining cards on the field to the bottom of the deck',
    type: CombatEffectType.onPicked,
    trigger: (data) {
      data.dungeonFieldCards.shuffle();
      for (int i = 0; i < data.dungeonFieldCards.length; i++) {
        var card = data.dungeonFieldCards[i];
        data.dungeonFieldCards[i] = null;
        if (card != null) data.deck.insert(0, card);
      }
      data.refillDungeonFieldCards();
    },
  );

  static final volatileElixir = ConsumableCardEffect(
    id: 'volatile-elixir',
    name: 'Volatile Elixir',
    description:
        'Remove every card from the dungeon field, your weapon, and your equipment',
    type: CombatEffectType.onPicked,
    trigger: (data) {
      for (int i = 0; i < data.dungeonFieldCards.length; i++) {
        if (data.dungeonFieldCards[i] != null) {
          data.graveyardCards.add(data.dungeonFieldCards[i]!);
          data.dungeonFieldCards[i] = null;
        }
      }
      if (data.weaponCard != null) {
        data.graveyardCards.add(data.weaponCard!);
        data.durability = 0;
        data.weaponCard = null;
      }
      data.graveyardCards.addAll(data.equipmentCards);
      data.equipmentCards.clear();
    },
  );

  static final bloodthornBrew = ConsumableCardEffect(
    id: 'bloodthorn-brew',
    name: 'Bloodthorn Brew',
    description:
        'Drinking this potion won\'t heal you, in exchange you will set your weapon power to 30 and restore it\'s durability',
    type: CombatEffectType.onPicked,
    trigger: (data) {
      if (data.weaponCard != null) {
        data.weaponCard!.value = 30;
        data.durability = 20;
      }
    },
  );

  static final agedBerries = ConsumableCardEffect(
    id: 'aged-berries',
    name: 'Aged Berries',
    description:
        'These Berries will heal you more for every round you\'ve played',
    type: CombatEffectType.onPicked,
    trigger: (data) {
      data.pickedCard!.value += data.round;
    },
  );
}
