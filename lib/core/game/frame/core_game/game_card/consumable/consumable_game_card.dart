import 'package:card_crawler/core/game/frame/core_game/game_card/consumable/consumable_game_card_effect.dart';

import '../base/game_card.dart';

class ConsumableGameCard extends GameCard {
  ConsumableGameCard._({
    required super.id,
    required super.value,
    required super.effect,
    required super.sprite,
  }) : super(
         icon: 'assets/card_icons/consumable_32.png',
         iconSmall: 'assets/card_icons/consumable_16.png',
       );

  static String _spritePath(String fileName) =>
      'assets/card_sprites/consumable/$fileName';

  static final c0 = ConsumableGameCard._(
    id: 16,
    value: 0,
    effect: ConsumableCardEffect.bloodthornBrew,
    sprite: _spritePath('c0.png'),
  );

  static final c1 = ConsumableGameCard._(
    id: 17,
    value: 0,
    effect: ConsumableCardEffect.titansShroom,
    sprite: _spritePath('c0.png'),
  );

  static final c2 = ConsumableGameCard._(
    id: 18,
    value: 8,
    effect: ConsumableCardEffect.temporalDew,
    sprite: _spritePath('c3.png'),
  );

  static final c3 = ConsumableGameCard._(
    id: 19,
    value: 8,
    effect: ConsumableCardEffect.emeticElixir,
    sprite: _spritePath('c4.png'),
  );

  static final c4 = ConsumableGameCard._(
    id: 20,
    value: 9,
    effect: ConsumableCardEffect.bolterPotion,
    sprite: _spritePath('c3.png'),
  );

  static final c5 = ConsumableGameCard._(
    id: 21,
    value: 9,
    effect: ConsumableCardEffect.agedBerries,
    sprite: _spritePath('c1.png'),
  );

  static final c6 = ConsumableGameCard._(
    id: 22,
    value: 10,
    effect: ConsumableCardEffect.volatileElixir,
    sprite: _spritePath('c6.png'),
  );

  static final entries = [c0, c1, c2, c3, c4, c5, c6];
}
