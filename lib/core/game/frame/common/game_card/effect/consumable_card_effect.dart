import '../../../core_game/models/core_game_data.dart';
import 'game_card_effect.dart';

class TemporalDew extends OnPicked {
  TemporalDew()
    : super(
        'Temporal Dew',
        'Aside from healing, this potion will restore your durability, and allows you to heal and flee again this turn',
      );

  @override
  void trigger(CoreGameData data) {
    if (data.weaponCard != null) {
      data.durability = 20;
    }
    data.canFlee = true;
  }
}

class TitansShroom extends OnPicked {
  TitansShroom()
    : super(
        'Titan\'s Shrooms',
        'This Mushroom will increase your weapon\'s strength by 3 points',
      );

  @override
  void trigger(CoreGameData data) {
    if (data.weaponCard != null) {
      data.weaponCard?.value += 3;
    }
  }
}

class EmeticElixir extends OnPicked {
  EmeticElixir() : super('Emetic Elixir', 'Discard 3 cards from the deck');

  @override
  void trigger(CoreGameData data) {
    for (int i = 0; i < 3; i++) {
      if (data.deck.isNotEmpty) {
        data.graveyardCards.add(data.deck.removeLast());
      }
    }
  }
}

class BolterPotion extends OnPicked {
  BolterPotion()
    : super(
        'Bolter Potion',
        'Return the remaining cards on the field to the bottom of the deck',
      );

  @override
  void trigger(CoreGameData data) {
    data.dungeonFieldCards.shuffle();
    for (int i = 0; i < data.dungeonFieldCards.length; i++) {
      var card = data.dungeonFieldCards[i];
      data.dungeonFieldCards[i] = null;
      if (card != null) data.deck.insert(0, card);
    }
    data.refillDungeonFieldCards();
  }
}

class VolatileElixir extends OnPicked {
  VolatileElixir()
    : super(
        'Volatile Elixir',
        'Remove every card from the dungeon field, your weapon, and your accessory',
      );

  @override
  void trigger(CoreGameData data) {
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
    data.graveyardCards.addAll(data.accessoryCards);
    data.accessoryCards.clear();
  }
}

class BloodthornBrew extends OnPicked {
  BloodthornBrew()
    : super(
        'Bloodthorn Brew',
        'Drinking this potion won\'t heal you, in exchange you will set your weapon power to 30 and restore it\'s durability',
      );

  @override
  void trigger(CoreGameData data) {
    if (data.weaponCard != null) {
      data.weaponCard!.value = 30;
      data.durability = 20;
    }
  }
}

class AgedBerries extends OnPicked {
  AgedBerries()
    : super(
        'Aged Berries',
        'These Berries will heal you more for every round you\'ve played',
      );

  @override
  void trigger(CoreGameData data) {
    data.pickedCard!.value += data.round;
  }
}
