import '../game_card/base/boss_fight_game_card.dart';

class BossFightData {
  BossFightData({
    List<BossFightGameCard>? deck,
    List<BossFightGameCard>? bossActions,
    List<BossFightGameCard?>? fieldCards,
    List<BossFightGameCard>? equipmentCards,
    this.playerPickedCard,
    this.bossPickedCard,
    this.playerHealth = 40,
    this.playerMaxHealth = 40,
    this.bossHealth = 45,
    this.bossMaxHealth = 45,
    this.everbloom = 0,
    this.metallica = 0,
    this.singularity = 0,
    this.eldritchContract = 0,
    this.pandorasBox = 3,
    this.playerAttackMultiplier = 1,
    this.playerDefenseMultiplier = 1,
    this.playerHealingMultiplier = 1,
    this.playerBaseAttackMultiplier = 1,
    this.playerBaseDefenseMultiplier = 1,
    this.playerBaseHealingMultiplier = 1,
    this.bossAttackMultiplier = 1,
    this.bossDefenseMultiplier = 1,
    this.bossHealingMultiplier = 1,
    this.bossBaseAttackMultiplier = 1,
    this.bossBaseDefenseMultiplier = 1,
    this.bossBaseHealingMultiplier = 1,
    this.playerTurnSkip = 0,
    this.bossTurnSkip = 0,
    this.canRefresh = true,
    this.playerSkipped = false,
    this.bossSkipped = false,
    this.singularityOn = false,
    this.eldritchContractOn = false,
    this.gorillaRally = false,
    this.gorillaTactic = false,
  }) {
    this.deck = deck ?? List.empty(growable: true);
    this.bossActions = bossActions ?? List.empty(growable: true);
    this.fieldCards = fieldCards ?? List.filled(4, null);
    this.equipmentCards = equipmentCards ?? List.empty(growable: true);
  }

  List<BossFightGameCard> deck = List.empty(growable: true);
  List<BossFightGameCard> bossActions = List.empty(growable: true);
  List<BossFightGameCard?> fieldCards = List.filled(4, null);
  List<BossFightGameCard> equipmentCards = List.empty(growable: true);
  BossFightGameCard? playerPickedCard;
  BossFightGameCard? bossPickedCard;
  int playerHealth;
  int playerMaxHealth;
  int bossHealth;
  int bossMaxHealth;
  int playerTurnSkip;
  int bossTurnSkip;
  int everbloom;
  int metallica;
  int singularity;
  int eldritchContract;
  int pandorasBox;
  double playerAttackMultiplier;
  double playerDefenseMultiplier;
  double playerHealingMultiplier;
  double playerBaseAttackMultiplier;
  double playerBaseDefenseMultiplier;
  double playerBaseHealingMultiplier;
  double bossAttackMultiplier;
  double bossDefenseMultiplier;
  double bossHealingMultiplier;
  double bossBaseAttackMultiplier;
  double bossBaseDefenseMultiplier;
  double bossBaseHealingMultiplier;
  bool canRefresh;
  bool playerSkipped;
  bool bossSkipped;
  bool singularityOn;
  bool eldritchContractOn;
  bool gorillaRally;
  bool gorillaTactic;

  int playerDamageCalculator(int damage) {
    return ((damage * playerAttackMultiplier * bossDefenseMultiplier).toInt());
  }

  int bossDamageCalculator(int damage) {
    return ((damage * bossAttackMultiplier * playerDefenseMultiplier).toInt());
  }

  void reducePlayerHealth(int damage) {
    playerHealth = (playerHealth <= damage) ? 0 : playerHealth - damage;
  }

  void reduceBossHealth(int damage) {
    bossHealth = (bossHealth <= damage) ? 0 : bossHealth - damage;
  }

  void increasePlayerHealth(int heal) {
    playerHealth =
        (playerHealth + (heal * playerHealingMultiplier).toInt() > 40)
        ? 40
        : playerHealth + (heal * playerHealingMultiplier).toInt();
  }

  void increaseBossHealth(int heal) {
    bossHealth =
        (bossHealth + (heal * bossHealingMultiplier).toInt() > bossMaxHealth)
        ? bossMaxHealth
        : bossHealth + (heal * bossHealingMultiplier).toInt();
  }

  void refillFieldCards() {
    for (int i = 0; i < fieldCards.length; i++) {
      if (fieldCards[i] == null && deck.isNotEmpty) {
        fieldCards[i] = deck.removeLast();
      }
    }
  }

  void refresh() {
    fieldCards.shuffle();
    for (int i = 0; i < fieldCards.length; i++) {
      fieldCards[i] = null;
    }
    refillFieldCards();
  }
}
