import 'package:card_crawler/core/game/frame/common/game_card/effect/weapon_card_effect.dart';

import 'game_card.dart';

class WeaponGameCard extends GameCard {
  WeaponGameCard._({
    required super.id,
    required super.value,
    required super.effect,
    required super.sprite,
  }) : super(
         icon: 'assets/card_icons/weapon_32.png',
         iconSmall: 'assets/icons/weapon_16.png',
       );

  static String _spritePath(String fileName) =>
      'assets/card_sprites/weapon/$fileName';

  static final w0 = WeaponGameCard._(
    id: 0,
    value: 2,
    effect: BlueStaff(),
    sprite: _spritePath('w0.png'),
  );

  static final w1 = WeaponGameCard._(
    id: 1,
    value: 3,
    effect: MirrorBolt(),
    sprite: _spritePath('w1.png'),
  );

  static final w2 = WeaponGameCard._(
    id: 2,
    value: 4,
    effect: ArtemisBow(),
    sprite: _spritePath('w2.png'),
  );

  static final w3 = WeaponGameCard._(
    id: 3,
    value: 5,
    effect: TenaciousMallet(),
    sprite: _spritePath('w3.png'),
  );

  static final w4 = WeaponGameCard._(
    id: 4,
    value: 15,
    effect: CursedAxe(),
    sprite: _spritePath('w4.png'),
  );

  static final w5 = WeaponGameCard._(
    id: 5,
    value: 7,
    effect: IchorSickle(),
    sprite: _spritePath('w5.png'),
  );

  static final w6 = WeaponGameCard._(
    id: 6,
    value: 8,
    effect: HolyHammer(),
    sprite: _spritePath('w6.png'),
  );

  static final w7 = WeaponGameCard._(
    id: 7,
    value: 9,
    effect: WarAxe(),
    sprite: _spritePath('w7.png'),
  );

  static final w8 = WeaponGameCard._(
    id: 8,
    value: 10,
    effect: BloodlustBlade(),
    sprite: _spritePath('w8.png'),
  );
}
