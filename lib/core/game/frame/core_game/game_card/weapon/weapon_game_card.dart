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

  static final stormSplitter = WeaponGameCard._(
    id: 0,
    value: 5,
    effect: WeaponGameCardEffect.stormSplitter,
    sprite: _spritePath('battle_axe.png'),
  );

  static final starForgedHammer = WeaponGameCard._(
    id: 1,
    value: 3,
    effect: WeaponGameCardEffect.starForgedHammer,
    sprite: _spritePath('battle_hammer.png'),
  );

  static final shadowFang = WeaponGameCard._(
    id: 2,
    value: 7,
    effect: WeaponGameCardEffect.shadowFang,
    sprite: _spritePath('butcher_knife.png'),
  );

  static final skullSplitter = WeaponGameCard._(
    id: 3,
    value: 6,
    effect: WeaponGameCardEffect.skullSplitter,
    sprite: _spritePath('greatsword.png'),
  );

  static final eternalCleaver = WeaponGameCard._(
    id: 4,
    value: 5,
    effect: WeaponGameCardEffect.eternalCleaver,
    sprite: _spritePath('greatsword_2.png'),
  );

  static final yamatsumi = WeaponGameCard._(
    id: 5,
    value: 3,
    effect: WeaponGameCardEffect.yamatsumi,
    sprite: _spritePath('katana.png'),
  );

  static final kokuryu = WeaponGameCard._(
    id: 6,
    value: 6,
    effect: WeaponGameCardEffect.kokuryu,
    sprite: _spritePath('katana_2.png'),
  );

  static final stiletto = WeaponGameCard._(
    id: 7,
    value: 3,
    effect: WeaponGameCardEffect.stiletto,
    sprite: _spritePath('knife.png'),
  );

  static final morningStar = WeaponGameCard._(
    id: 8,
    value: 2,
    effect: WeaponGameCardEffect.morningStar,
    sprite: _spritePath('mace.png'),
  );

  static final bladedNunchaku = WeaponGameCard._(
    id: 9,
    value: 2,
    effect: WeaponGameCardEffect.bladedNunchaku,
    sprite: _spritePath('nunchucks.png'),
  );

  static final excalibur = WeaponGameCard._(
    id: 0,
    value: 2,
    effect: WeaponGameCardEffect.excalibur,
    sprite: _spritePath('rapier.png'),
  );

  static final espadaLarga = WeaponGameCard._(
    id: 0,
    value: 2,
    effect: WeaponGameCardEffect.espadaLarga,
    sprite: _spritePath('rapier_2.png'),
  );

  static final shamshir = WeaponGameCard._(
    id: 0,
    value: 2,
    effect: WeaponGameCardEffect.shamshir,
    sprite: _spritePath('scimitar.png'),
  );

  static final kris = WeaponGameCard._(
    id: 0,
    value: 2,
    effect: WeaponGameCardEffect.kris,
    sprite: _spritePath('scimitar_2.png'),
  );

  static final deathCrescent = WeaponGameCard._(
    id: 0,
    value: 2,
    effect: WeaponGameCardEffect.deathCrescent,
    sprite: _spritePath('scythe.png'),
  );

  static final khopesh = WeaponGameCard._(
    id: 0,
    value: 2,
    effect: WeaponGameCardEffect.khopesh,
    sprite: _spritePath('sickle.png'),
  );

  static final fangOfRiton = WeaponGameCard._(
    id: 0,
    value: 2,
    effect: WeaponGameCardEffect.fangOfRiton,
    sprite: _spritePath('spear.png'),
  );

  static final shepherdStaff = WeaponGameCard._(
    id: 0,
    value: 2,
    effect: WeaponGameCardEffect.shepherdStaff,
    sprite: _spritePath('staff.png'),
  );

  static final gladius = WeaponGameCard._(
    id: 0,
    value: 2,
    effect: WeaponGameCardEffect.gladius,
    sprite: _spritePath('sword.png'),
  );

  static final doomSpire = WeaponGameCard._(
    id: 0,
    value: 2,
    effect: WeaponGameCardEffect.doomSpire,
    sprite: _spritePath('sword_2.png'),
  );

  static final poseidonFang = WeaponGameCard._(
    id: 0,
    value: 2,
    effect: WeaponGameCardEffect.poseidonFang,
    sprite: _spritePath('trident.png'),
  );

  static final entries = [
    stormSplitter,
    starForgedHammer,
    shadowFang,
    skullSplitter,
    eternalCleaver,
    yamatsumi,
    kokuryu,
    stiletto,
    morningStar,
    bladedNunchaku,
    excalibur,
    espadaLarga,
    shamshir,
    kris,
    deathCrescent,
    khopesh,
    fangOfRiton,
    shepherdStaff,
    gladius,
    doomSpire,
    poseidonFang,
  ];
}
