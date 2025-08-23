import '../../types/game_card_effect_type.dart';
import '../base/game_card_effect.dart';

class ConsumableGameCardEffect extends GameCardEffect {
  ConsumableGameCardEffect({
    required super.id,
    required super.name,
    required super.description,
    required super.type,
    required super.trigger,
  });

  static final temporalDew = ConsumableGameCardEffect(
    id: 'temporal-dew',
    name: 'Temporal Dew',
    description:
        'Aside from healing, this potion will restore your durability, and allows you to heal and flee again this turn',
    type: GameCardEffectType.onPicked,
    trigger: (data) {
      if (data.weaponCard != null) {
        data.durability = 20;
      }
      data.canFlee = true;
    },
  );

  static final titansShroom = ConsumableGameCardEffect(
    id: 'titan-shrooms',
    name: 'Titan\'s Shrooms',
    description:
        'This Mushroom will increase your weapon\'s strength by 3 points',
    type: GameCardEffectType.onPicked,
    trigger: (data) {
      if (data.weaponCard != null) {
        data.weaponCard?.value += 3;
      }
    },
  );

  static final emeticElixir = ConsumableGameCardEffect(
    id: 'emetic-elixir',
    name: 'Emetic Elixir',
    description: 'Discard 3 cards from the deck',
    type: GameCardEffectType.onPicked,
    trigger: (data) {
      for (int i = 0; i < 3; i++) {
        if (data.deck.isNotEmpty) {
          data.graveyardCards.add(data.deck.removeLast());
        }
      }
    },
  );

  static final bolterPotion = ConsumableGameCardEffect(
    id: 'bolter-potion',
    name: 'Bolter Potion',
    description:
        'Return the remaining cards on the field to the bottom of the deck',
    type: GameCardEffectType.onPicked,
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

  static final volatileElixir = ConsumableGameCardEffect(
    id: 'volatile-elixir',
    name: 'Volatile Elixir',
    description:
        'Remove every card from the dungeon field, your weapon, and your equipment',
    type: GameCardEffectType.onPicked,
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

  static final bloodthornBrew = ConsumableGameCardEffect(
    id: 'bloodthorn-brew',
    name: 'Bloodthorn Brew',
    description:
        'Drinking this potion won\'t heal you, in exchange you will set your weapon power to 30 and restore it\'s durability',
    type: GameCardEffectType.onPicked,
    trigger: (data) {
      if (data.weaponCard != null) {
        data.weaponCard!.value = 30;
        data.durability = 20;
      }
    },
  );

  static final agedBerries = ConsumableGameCardEffect(
    id: 'aged-berries',
    name: 'Aged Berries',
    description:
        'These Berries will heal you more for every round you\'ve played',
    type: GameCardEffectType.onPicked,
    trigger: (data) {
      data.pickedCard!.value += data.round;
    },
  );
}
