import 'effect/accessory_card_effect.dart';
import 'game_card.dart';

class AccessoryGameCard extends GameCard {
  AccessoryGameCard._({
    required super.id,
    required super.value,
    required super.effect,
    required super.sprite,
  }) : super(
         icon: 'assets/card_icons/accessory_32.png',
         iconSmall: 'assets/card_icons/accessory_16.png',
       );

  static String _spritePath(String fileName) =>
      'assets/card_sprites/accessory/$fileName';

  static final a0 = AccessoryGameCard._(
    id: 9,
    value: 0,
    effect: SpectreBoots(),
    sprite: _spritePath('a0.png'),
  );

  static final a1 = AccessoryGameCard._(
    id: 10,
    value: 0,
    effect: PowerBreastplate(),
    sprite: _spritePath('a1.png'),
  );

  static final a2 = AccessoryGameCard._(
    id: 11,
    value: 0,
    effect: CommanderHelmet(),
    sprite: _spritePath('a2.png'),
  );

  static final a3 = AccessoryGameCard._(
    id: 12,
    value: 0,
    effect: RingOfMending(),
    sprite: _spritePath('a3.png'),
  );

  static final a4 = AccessoryGameCard._(
    id: 13,
    value: 0,
    effect: HealingAmulet(),
    sprite: _spritePath('a4.png'),
  );

  static final a5 = AccessoryGameCard._(
    id: 14,
    value: 0,
    effect: HeroCape(),
    sprite: _spritePath('a5.png'),
  );

  static final a6 = AccessoryGameCard._(
    id: 15,
    value: 0,
    effect: EmperorCrown(),
    sprite: _spritePath('a6.png'),
  );

  static final entries = [a0, a1, a2, a3, a4, a5, a6];
}
