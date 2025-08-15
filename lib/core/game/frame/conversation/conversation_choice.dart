class ConversationChoice {
  ConversationChoice({
    required this.text,
    this.nextFrameId,
    this.nextConversationUnitId,
  });

  String text;
  int? nextFrameId;
  int? nextConversationUnitId;
}
