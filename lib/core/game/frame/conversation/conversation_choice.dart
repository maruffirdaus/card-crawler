import 'package:card_crawler/core/game/frame/common/combat_effect/combat_effect.dart';

class ConversationChoice {
  ConversationChoice({
    required this.text,
    this.nextUnitId,
    this.nextFrameId,
    this.nextCombatEffects,
    this.onSelected,
  });

  String text;
  String? nextUnitId;
  String? nextFrameId;
  List<CombatEffect>? nextCombatEffects;
  Function()? onSelected;
}
