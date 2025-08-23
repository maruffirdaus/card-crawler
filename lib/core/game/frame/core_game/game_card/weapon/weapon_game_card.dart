import 'package:card_crawler/core/game/frame/core_game/game_card/weapon/weapon_card_effect.dart';

import '../base/game_card.dart';

class WeaponGameCard extends GameCard {
  WeaponGameCard._({
    required super.id,
    required super.value,
    required super.effect,
    required super.sprite,
  }) : super(
         icon: 'assets/card_icons/weapon_32.png',
         iconSmall: 'assets/card_icons/weapon_16.png',
       );

  static String _spritePath(String fileName) =>
      'assets/card_sprites/weapon/$fileName';

  static final battleAxe = WeaponGameCard._(
    id: 0,
    value: 2,
    effect: WeaponCardEffect.bloodlustBlade,
    sprite: _spritePath('battle_axe.png'),
  );

  static final battleHammer = WeaponGameCard._(
    id: 0,
    value: 2,
    effect: WeaponCardEffect.bloodlustBlade,
    sprite: _spritePath('battle_hammer.png'),
  );

  static final butcherKnife = WeaponGameCard._(
    id: 0,
    value: 2,
    effect: WeaponCardEffect.bloodlustBlade,
    sprite: _spritePath('butcher_knife.png'),
  );

  static final greatsword = WeaponGameCard._(
    id: 0,
    value: 2,
    effect: WeaponCardEffect.bloodlustBlade,
    sprite: _spritePath('greatsword.png'),
  );

  static final greatsword2 = WeaponGameCard._(
    id: 0,
    value: 2,
    effect: WeaponCardEffect.bloodlustBlade,
    sprite: _spritePath('greatsword_2.png'),
  );

  static final katana = WeaponGameCard._(
    id: 0,
    value: 2,
    effect: WeaponCardEffect.bloodlustBlade,
    sprite: _spritePath('katana.png'),
  );

  static final katana2 = WeaponGameCard._(
    id: 0,
    value: 2,
    effect: WeaponCardEffect.bloodlustBlade,
    sprite: _spritePath('katana_2.png'),
  );

  static final knife = WeaponGameCard._(
    id: 0,
    value: 2,
    effect: WeaponCardEffect.bloodlustBlade,
    sprite: _spritePath('knife.png'),
  );

  static final mace = WeaponGameCard._(
    id: 0,
    value: 2,
    effect: WeaponCardEffect.bloodlustBlade,
    sprite: _spritePath('mace.png'),
  );

  static final nunchucks = WeaponGameCard._(
    id: 0,
    value: 2,
    effect: WeaponCardEffect.bloodlustBlade,
    sprite: _spritePath('nunchucks.png'),
  );

  static final rapier = WeaponGameCard._(
    id: 0,
    value: 2,
    effect: WeaponCardEffect.bloodlustBlade,
    sprite: _spritePath('rapier.png'),
  );

  static final rapier2 = WeaponGameCard._(
    id: 0,
    value: 2,
    effect: WeaponCardEffect.bloodlustBlade,
    sprite: _spritePath('rapier_2.png'),
  );

  static final scimitar = WeaponGameCard._(
    id: 0,
    value: 2,
    effect: WeaponCardEffect.bloodlustBlade,
    sprite: _spritePath('scimitar.png'),
  );

  static final scimitar2 = WeaponGameCard._(
    id: 0,
    value: 2,
    effect: WeaponCardEffect.bloodlustBlade,
    sprite: _spritePath('scimitar_2.png'),
  );

  static final scythe = WeaponGameCard._(
    id: 0,
    value: 2,
    effect: WeaponCardEffect.bloodlustBlade,
    sprite: _spritePath('scythe.png'),
  );

  static final sickle = WeaponGameCard._(
    id: 0,
    value: 2,
    effect: WeaponCardEffect.bloodlustBlade,
    sprite: _spritePath('sickle.png'),
  );

  static final spear = WeaponGameCard._(
    id: 0,
    value: 2,
    effect: WeaponCardEffect.bloodlustBlade,
    sprite: _spritePath('spear.png'),
  );

  static final staff = WeaponGameCard._(
    id: 0,
    value: 2,
    effect: WeaponCardEffect.bloodlustBlade,
    sprite: _spritePath('staff.png'),
  );

  static final sword = WeaponGameCard._(
    id: 0,
    value: 2,
    effect: WeaponCardEffect.bloodlustBlade,
    sprite: _spritePath('sword.png'),
  );

  static final sword2 = WeaponGameCard._(
    id: 0,
    value: 2,
    effect: WeaponCardEffect.bloodlustBlade,
    sprite: _spritePath('sword_2.png'),
  );

  static final trident = WeaponGameCard._(
    id: 0,
    value: 2,
    effect: WeaponCardEffect.bloodlustBlade,
    sprite: _spritePath('trident.png'),
  );

  static final entries = [
    battleAxe,
    battleHammer,
    butcherKnife,
    greatsword,
    greatsword2,
    katana,
    katana2,
    knife,
    mace,
    nunchucks,
    rapier,
    rapier2,
    scimitar,
    scimitar2,
    scythe,
    sickle,
    spear,
    staff,
    sword,
    sword2,
    trident,
  ];
}
