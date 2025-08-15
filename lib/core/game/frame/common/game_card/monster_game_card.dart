import 'package:card_crawler/core/game/frame/core_game/types/game_card_effect/monster_card_effect.dart';

import 'game_card.dart';

class MonsterGameCard extends GameCard {
  MonsterGameCard._({
    required super.id,
    required super.value,
    required super.effect,
    required super.sprite,
  }) : super(
         icon: 'assets/card_icons/monster_32.png',
         iconSmall: 'assets/icons/monster_16.png',
       );

  static String _spritePath(String fileName) =>
      'assets/card_sprites/monster/$fileName';

  static final m0 = MonsterGameCard._(
    id: 23,
    value: 2,
    effect: Sticky(),
    sprite: _spritePath('m0.png'),
  );

  static final m1 = MonsterGameCard._(
    id: 24,
    value: 2,
    effect: Sticky(),
    sprite: _spritePath('m1.png'),
  );

  static final m2 = MonsterGameCard._(
    id: 25,
    value: 3,
    effect: Ally(),
    sprite: _spritePath('m2.png'),
  );

  static final m3 = MonsterGameCard._(
    id: 26,
    value: 3,
    effect: Ally(),
    sprite: _spritePath('m3.png'),
  );

  static final m4 = MonsterGameCard._(
    id: 27,
    value: 4,
    effect: Corrosive(),
    sprite: _spritePath('m4.png'),
  );

  static final m5 = MonsterGameCard._(
    id: 28,
    value: 4,
    effect: Corrosive(),
    sprite: _spritePath('m5.png'),
  );

  static final m6 = MonsterGameCard._(
    id: 29,
    value: 5,
    effect: Scaling(),
    sprite: _spritePath('m6.png'),
  );

  static final m7 = MonsterGameCard._(
    id: 30,
    value: 5,
    effect: Scaling(),
    sprite: _spritePath('m7.png'),
  );

  static final m8 = MonsterGameCard._(
    id: 31,
    value: 6,
    effect: Aftermath(),
    sprite: _spritePath('m8.png'),
  );

  static final m9 = MonsterGameCard._(
    id: 32,
    value: 6,
    effect: Aftermath(),
    sprite: _spritePath('m9.png'),
  );

  static final m10 = MonsterGameCard._(
    id: 33,
    value: 7,
    effect: Vengeful(),
    sprite: _spritePath('m10.png'),
  );

  static final m11 = MonsterGameCard._(
    id: 34,
    value: 7,
    effect: Vengeful(),
    sprite: _spritePath('m11.png'),
  );

  static final m12 = MonsterGameCard._(
    id: 35,
    value: 8,
    effect: Mimic(),
    sprite: _spritePath('m12.png'),
  );

  static final m13 = MonsterGameCard._(
    id: 36,
    value: 8,
    effect: Mimic(),
    sprite: _spritePath('m13.png'),
  );

  static final m14 = MonsterGameCard._(
    id: 37,
    value: 9,
    effect: Poisonous(),
    sprite: _spritePath('m14.png'),
  );

  static final m15 = MonsterGameCard._(
    id: 38,
    value: 9,
    effect: Poisonous(),
    sprite: _spritePath('m15.png'),
  );

  static final m16 = MonsterGameCard._(
    id: 39,
    value: 10,
    effect: Opportunist(),
    sprite: _spritePath('m16.png'),
  );

  static final m17 = MonsterGameCard._(
    id: 40,
    value: 10,
    effect: Opportunist(),
    sprite: _spritePath('m17.png'),
  );

  static final m18 = MonsterGameCard._(
    id: 41,
    value: 11,
    effect: Wrecker(),
    sprite: _spritePath('m18.png'),
  );

  static final m19 = MonsterGameCard._(
    id: 42,
    value: 11,
    effect: Wrecker(),
    sprite: _spritePath('m19.png'),
  );

  static final m20 = MonsterGameCard._(
    id: 43,
    value: 12,
    effect: Spiky(),
    sprite: _spritePath('m20.png'),
  );

  static final m21 = MonsterGameCard._(
    id: 44,
    value: 12,
    effect: Spiky(),
    sprite: _spritePath('m21.png'),
  );

  static final m22 = MonsterGameCard._(
    id: 45,
    value: 13,
    effect: AntiHeal(),
    sprite: _spritePath('m22.png'),
  );

  static final m23 = MonsterGameCard._(
    id: 46,
    value: 13,
    effect: AntiHeal(),
    sprite: _spritePath('m23.png'),
  );

  static final m24 = MonsterGameCard._(
    id: 47,
    value: 14,
    effect: NoEscape(),
    sprite: _spritePath('m24.png'),
  );

  static final m25 = MonsterGameCard._(
    id: 48,
    value: 14,
    effect: NoEscape(),
    sprite: _spritePath('m25.png'),
  );

  static final entries = [
    m0,
    m1,
    m2,
    m3,
    m4,
    m5,
    m6,
    m7,
    m8,
    m9,
    m10,
    m11,
    m12,
    m13,
    m14,
    m15,
    m16,
    m17,
    m18,
    m19,
    m20,
    m21,
    m22,
    m23,
    m24,
    m25,
  ];
}
