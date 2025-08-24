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

  static final ashDraught = ConsumableGameCard._(
    id: 16,
    value: 0,
    effect: ConsumableGameCardEffect.bloodthornBrew,
    sprite: _spritePath('c0.png'),
  );

  static final greyMatterPotion = ConsumableGameCard._(
    id: 17,
    value: 0,
    effect: ConsumableGameCardEffect.titansShroom,
    sprite: _spritePath('c1.png'),
  );

  static final etherGreyTonic = ConsumableGameCard._(
    id: 18,
    value: 8,
    effect: ConsumableGameCardEffect.temporalDew,
    sprite: _spritePath('c2.png'),
  );

  static final vitalisPotion = ConsumableGameCard._(
    id: 19,
    value: 8,
    effect: ConsumableGameCardEffect.emeticElixir,
    sprite: _spritePath('c3.png'),
  );

  static final goldenTonic = ConsumableGameCard._(
    id: 20,
    value: 9,
    effect: ConsumableGameCardEffect.bolterPotion,
    sprite: _spritePath('c4.png'),
  );

  static final solEssence = ConsumableGameCard._(
    id: 21,
    value: 9,
    effect: ConsumableGameCardEffect.agedBerries,
    sprite: _spritePath('c5.png'),
  );

  static final gildedElixir = ConsumableGameCard._(
    id: 22,
    value: 10,
    effect: ConsumableGameCardEffect.volatileElixir,
    sprite: _spritePath('c6.png'),
  );

  static final verdantElixir = ConsumableGameCard._(
    id: 22,
    value: 10,
    effect: ConsumableGameCardEffect.temporalDew,
    sprite: _spritePath('c7.png'),
  );

  static final vineBrew = ConsumableGameCard._(
    id: 22,
    value: 10,
    effect: ConsumableGameCardEffect.emeticElixir,
    sprite: _spritePath('c8.png'),
  );

  static final purgeBrew = ConsumableGameCard._(
    id: 22,
    value: 10,
    effect: ConsumableGameCardEffect.volatileElixir,
    sprite: _spritePath('c9.png'),
  );

  static final indigoSerum = ConsumableGameCard._(
    id: 22,
    value: 10,
    effect: ConsumableGameCardEffect.bolterPotion,
    sprite: _spritePath('c10.png'),
  );

  static final azureElixir = ConsumableGameCard._(
    id: 22,
    value: 10,
    effect: ConsumableGameCardEffect.agedBerries,
    sprite: _spritePath('c11.png'),
  );

  static final oceanMist = ConsumableGameCard._(
    id: 22,
    value: 10,
    effect: ConsumableGameCardEffect.titansShroom,
    sprite: _spritePath('c12.png'),
  );

  static final venomBrew = ConsumableGameCard._(
    id: 22,
    value: 10,
    effect: ConsumableGameCardEffect.volatileElixir,
    sprite: _spritePath('c13.png'),
  );

  static final arcanaElixir = ConsumableGameCard._(
    id: 22,
    value: 10,
    effect: ConsumableGameCardEffect.bloodthornBrew,
    sprite: _spritePath('c14.png'),
  );

  static final lavenderEssence = ConsumableGameCard._(
    id: 22,
    value: 10,
    effect: ConsumableGameCardEffect.emeticElixir,
    sprite: _spritePath('c15.png'),
  );

  static final enigmaTonic = ConsumableGameCard._(
    id: 22,
    value: 10,
    effect: ConsumableGameCardEffect.temporalDew,
    sprite: _spritePath('c16.png'),
  );

  static final crimsonSerum = ConsumableGameCard._(
    id: 22,
    value: 10,
    effect: ConsumableGameCardEffect.bloodthornBrew,
    sprite: _spritePath('c17.png'),
  );

  static final fireVeinTonic = ConsumableGameCard._(
    id: 22,
    value: 10,
    effect: ConsumableGameCardEffect.bloodthornBrew,
    sprite: _spritePath('c18.png'),
  );

  static final stoneHideElixir = ConsumableGameCard._(
    id: 22,
    value: 10,
    effect: ConsumableGameCardEffect.titansShroom,
    sprite: _spritePath('c19.png'),
  );

  static final ivoryDraught = ConsumableGameCard._(
    id: 22,
    value: 10,
    effect: ConsumableGameCardEffect.temporalDew,
    sprite: _spritePath('c20.png'),
  );

  static final entriesSnowy = [
    ashDraught,
    greyMatterPotion,
    etherGreyTonic,
    vitalisPotion,
    goldenTonic,
    solEssence,
    gildedElixir,
  ];

  static final entriesDesert = [
    verdantElixir,
    vineBrew,
    purgeBrew,
    indigoSerum,
    azureElixir,
    oceanMist,
    venomBrew,
  ];

  static final entriesCastle = [
    arcanaElixir,
    lavenderEssence,
    enigmaTonic,
    crimsonSerum,
    fireVeinTonic,
    stoneHideElixir,
    ivoryDraught,
  ];
}
