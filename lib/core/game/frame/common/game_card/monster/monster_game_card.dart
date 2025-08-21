import 'package:card_crawler/core/game/frame/common/game_card/monster/monster_card_effect.dart';

import '../base/game_card.dart';

class MonsterGameCard extends GameCard {
  MonsterGameCard._({
    required super.id,
    required super.value,
    required super.effect,
    required super.sprite,
  }) : super(
         icon: 'assets/card_icons/monster_32.png',
         iconSmall: 'assets/card_icons/monster_16.png',
       );

  static String _spritePath(String fileName) =>
      'assets/card_sprites/monster/$fileName';

  static final aghoy = MonsterGameCard._(
    id: 0,
    value: 15,
    effect: MonsterCardEffect.aftermath,
    sprite: _spritePath('aghoy.png'),
  );

  static final amaranhig = MonsterGameCard._(
    id: 0,
    value: 15,
    effect: MonsterCardEffect.aftermath,
    sprite: _spritePath('amaranhig.png'),
  );

  static final amomongo = MonsterGameCard._(
    id: 0,
    value: 15,
    effect: MonsterCardEffect.aftermath,
    sprite: _spritePath('amomongo.png'),
  );

  static final boar = MonsterGameCard._(
    id: 0,
    value: 15,
    effect: MonsterCardEffect.aftermath,
    sprite: _spritePath('boar.png'),
  );

  static final boar2 = MonsterGameCard._(
    id: 0,
    value: 15,
    effect: MonsterCardEffect.aftermath,
    sprite: _spritePath('boar_2.png'),
  );

  static final bungisngis = MonsterGameCard._(
    id: 0,
    value: 15,
    effect: MonsterCardEffect.aftermath,
    sprite: _spritePath('bungisngis.png'),
  );

  static final busaw = MonsterGameCard._(
    id: 0,
    value: 15,
    effect: MonsterCardEffect.aftermath,
    sprite: _spritePath('busaw.png'),
  );

  static final buwaya = MonsterGameCard._(
    id: 0,
    value: 15,
    effect: MonsterCardEffect.aftermath,
    sprite: _spritePath('buwaya.png'),
  );

  static final chicken = MonsterGameCard._(
    id: 0,
    value: 15,
    effect: MonsterCardEffect.aftermath,
    sprite: _spritePath('chicken.png'),
  );

  static final dwendeBlue = MonsterGameCard._(
    id: 0,
    value: 15,
    effect: MonsterCardEffect.aftermath,
    sprite: _spritePath('dwende_blue.png'),
  );

  static final dwendeOrange = MonsterGameCard._(
    id: 0,
    value: 15,
    effect: MonsterCardEffect.aftermath,
    sprite: _spritePath('dwende_orange.png'),
  );

  static final dwendeRed = MonsterGameCard._(
    id: 0,
    value: 15,
    effect: MonsterCardEffect.aftermath,
    sprite: _spritePath('dwende_red.png'),
  );

  static final dwendeYellow = MonsterGameCard._(
    id: 0,
    value: 15,
    effect: MonsterCardEffect.aftermath,
    sprite: _spritePath('dwende_yellow.png'),
  );

  static final ekEk = MonsterGameCard._(
    id: 0,
    value: 15,
    effect: MonsterCardEffect.aftermath,
    sprite: _spritePath('ek_ek.png'),
  );

  static final evilDwende = MonsterGameCard._(
    id: 0,
    value: 15,
    effect: MonsterCardEffect.aftermath,
    sprite: _spritePath('evil_dwende.png'),
  );

  static final kapre = MonsterGameCard._(
    id: 0,
    value: 15,
    effect: MonsterCardEffect.aftermath,
    sprite: _spritePath('kapre.png'),
  );

  static final kolyog = MonsterGameCard._(
    id: 0,
    value: 15,
    effect: MonsterCardEffect.aftermath,
    sprite: _spritePath('kolyog.png'),
  );

  static final malakat = MonsterGameCard._(
    id: 0,
    value: 15,
    effect: MonsterCardEffect.aftermath,
    sprite: _spritePath('malakat.png'),
  );

  static final manananggal = MonsterGameCard._(
    id: 0,
    value: 15,
    effect: MonsterCardEffect.aftermath,
    sprite: _spritePath('manananggal.png'),
  );

  static final nunoSaPunso = MonsterGameCard._(
    id: 0,
    value: 15,
    effect: MonsterCardEffect.aftermath,
    sprite: _spritePath('nuno_sa_punso.png'),
  );

  static final rooster = MonsterGameCard._(
    id: 0,
    value: 15,
    effect: MonsterCardEffect.aftermath,
    sprite: _spritePath('rooster.png'),
  );

  static final santelmo = MonsterGameCard._(
    id: 0,
    value: 15,
    effect: MonsterCardEffect.aftermath,
    sprite: _spritePath('santelmo.png'),
  );

  static final sigbin = MonsterGameCard._(
    id: 0,
    value: 15,
    effect: MonsterCardEffect.aftermath,
    sprite: _spritePath('sigbin.png'),
  );

  static final sirena = MonsterGameCard._(
    id: 0,
    value: 15,
    effect: MonsterCardEffect.aftermath,
    sprite: _spritePath('sirena.png'),
  );

  static final syokoy = MonsterGameCard._(
    id: 0,
    value: 15,
    effect: MonsterCardEffect.aftermath,
    sprite: _spritePath('syokoy.png'),
  );

  static final taongTuod = MonsterGameCard._(
    id: 0,
    value: 15,
    effect: MonsterCardEffect.aftermath,
    sprite: _spritePath('taong_tuod.png'),
  );

  static final tiburones = MonsterGameCard._(
    id: 0,
    value: 15,
    effect: MonsterCardEffect.aftermath,
    sprite: _spritePath('tiburones.png'),
  );

  static final tikbalang = MonsterGameCard._(
    id: 0,
    value: 15,
    effect: MonsterCardEffect.aftermath,
    sprite: _spritePath('tikbalang.png'),
  );

  static final tiyanak = MonsterGameCard._(
    id: 0,
    value: 15,
    effect: MonsterCardEffect.aftermath,
    sprite: _spritePath('tiyanak.png'),
  );

  static final witch = MonsterGameCard._(
    id: 0,
    value: 15,
    effect: MonsterCardEffect.aftermath,
    sprite: _spritePath('witch.png'),
  );

  static final entries = [
    aghoy,
    amaranhig,
    amomongo,
    boar,
    boar2,
    bungisngis,
    busaw,
    buwaya,
    chicken,
    dwendeBlue,
    dwendeOrange,
    dwendeRed,
    dwendeYellow,
    ekEk,
    evilDwende,
    kapre,
    kolyog,
    malakat,
    manananggal,
    nunoSaPunso,
    rooster,
    santelmo,
    sigbin,
    sirena,
    syokoy,
    taongTuod,
    tiburones,
    tikbalang,
    tiyanak,
    witch
  ];
}
