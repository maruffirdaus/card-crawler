import '../game_card/base/game_card.dart';

class CoreGameData {
  CoreGameData({
    List<GameCard>? deck,
    List<GameCard?>? dungeonFieldCards,
    this.weaponCard,
    List<GameCard>? equipmentCards,
    List<GameCard>? graveyardCards,
    this.pickedCard,
    this.level = 1,
    this.round = 1,
    this.health = 20,
    this.durability = 0,
    this.buff = 0,
    this.tempBuff = 0,
    this.multiplier = 1,
    this.equipmentBuff = 0,
    this.cursedAxeCounter = 0,
    this.cursedAxeDurability = 0,
    this.emperorCounter = 0,
    this.hasHealed = false,
    this.canFlee = true,
  }) {
    this.deck = deck ?? List.empty(growable: true);
    this.dungeonFieldCards = dungeonFieldCards ?? List.filled(4, null);
    this.graveyardCards = graveyardCards ?? List.empty(growable: true);
    this.equipmentCards = equipmentCards ?? List.empty(growable: true);
  }

  List<GameCard> deck = List.empty(growable: true);
  List<GameCard?> dungeonFieldCards = List.filled(4, null);
  GameCard? weaponCard;
  List<GameCard> equipmentCards = List.empty(growable: true);
  List<GameCard> graveyardCards = List.empty(growable: true);
  GameCard? pickedCard;
  int level;
  int round;
  int health;
  int durability;
  int buff;
  int tempBuff;
  int multiplier;
  int equipmentBuff;
  int cursedAxeCounter;
  int cursedAxeDurability;
  int emperorCounter;
  bool hasHealed;
  bool canFlee;

  void removeCardFromDungeonField(int index) {
    dungeonFieldCards[index] = null;
  }

  bool isDungeonFieldCardsLow() {
    return dungeonFieldCards.where((card) => card != null).length <= 1;
  }

  void refillDungeonFieldCards() {
    for (int i = 0; i < dungeonFieldCards.length; i++) {
      if (dungeonFieldCards[i] == null && deck.isNotEmpty) {
        dungeonFieldCards[i] = deck.removeLast();
      }
    }
  }

  bool isDungeonFieldCardsEmpty() =>
      dungeonFieldCards.every((card) => card == null);

  void reduceHealth(int damage) {
    health = (health <= damage) ? 0 : health - damage;
  }
}
