import 'package:card_crawler/constant/game_card_type.dart';
import 'package:card_crawler/model/game_data.dart';

import 'effect.dart';

class TemporalDew extends OnPicked {
  TemporalDew()
      : super(
    'Temporal Dew',
    'Aside from healing, this potion will restore your durability, and allows you to heal and flee again this turn',
  );

  @override
  void trigger(GameData data) {
    data.durability = 15;
    data.canFlee = true;
  }
}

class TitansDrop extends OnPicked {
  TitansDrop()
      : super(
    'Titan\'s Drop',
    'This potion will increase your weapon\'s strength by 3 points',
  );

  @override
  void trigger(GameData data) {
    data.buff = 3;
  }
}

class GamblersTears extends OnPicked {
  GamblersTears()
      : super(
    'Gambler\'s Tears',
    'Discard 3 cards from the deck',
  );

  @override
  void trigger(GameData data) {
    for (int i = 0; i < 3; i++) {
      if (data.deck.isNotEmpty) {
        data.graveyard.add(data.deck.removeLast());
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
  void trigger(GameData data) {
    data.dungeonField.shuffle();
    for (int i = 0; i < data.dungeonField.length; i++) {
      var card = data.dungeonField[i];
      data.dungeonField[i] = null;
      if (card != null) data.deck.insert(0, card);
    }
    data.refillDungeonField();
  }
}

class VolatileElixir extends OnPicked {
  VolatileElixir()
      : super(
    'Volatile Elixir',
    'Remove every card from the dungeon field, your weapon, and your accessories',
  );

  @override
  void trigger(GameData data) {
    for (int i = 0; i < data.dungeonField.length; i++){
      if (data.dungeonField[i] != null){
        data.graveyard.add(data.dungeonField[i]!);
      }
    }
    data.graveyard.add(data.weapon!);
    data.durability = 0;
    for (int i = 0; i < data.accessories.length; i++){
      data.graveyard.add(data.accessories[i]);
    }
  }
}

class BloodthornBrew extends OnPicked {
  BloodthornBrew()
      : super(
    'Bloodthorn Brew',
    'Drinking this potion won\'t heal you, in exchange you will set your weapon power to 30 and restore it\'s durability',
  );

  @override
  void trigger(GameData data) {
    data.weapon!.value = 30;
    data.durability = 15;
  }
}

class FineWine extends OnPicked {
  FineWine()
      : super(
    'Fine Wine',
    'This potion will heal you more for every round you\'ve played',
  );

  @override
  void trigger(GameData data) {
    data.pickedCard!.value += data.round;
  }
}