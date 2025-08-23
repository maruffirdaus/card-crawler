import '../../types/boss_fight_game_card_effect_type.dart';
import '../base/boss_fight_game_card_effect.dart';

class PlayerEquipmentGameCardEffect extends BossFightGameCardEffect {
  PlayerEquipmentGameCardEffect({
    required super.id,
    required super.name,
    required super.description,
    required super.type,
    required super.trigger,
  });

  static final example = PlayerEquipmentGameCardEffect(
    id: 'example',
    name: 'Example',
    description: 'Example',
    type: BossFightGameCardEffectType.attack,
    trigger: (data) {
      //logic here
    },
  );
}
