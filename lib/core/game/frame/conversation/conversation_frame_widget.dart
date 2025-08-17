import 'package:card_crawler/core/foundation/extensions/build_context_extensions.dart';
import 'package:card_crawler/core/game/frame/conversation/provider/conversation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'conversation_frame.dart';

class ConversationFrameWidget extends StatefulWidget {
  const ConversationFrameWidget({
    super.key,
    required this.onComplete,
    required this.conversationFrame,
  });

  final Function(String) onComplete;
  final ConversationFrame conversationFrame;

  @override
  State<ConversationFrameWidget> createState() =>
      _ConversationFrameWidgetState();
}

class _ConversationFrameWidgetState extends State<ConversationFrameWidget> {
  late ConversationProvider _provider;

  @override
  void initState() {
    super.initState();
    _provider = ConversationProvider();
    _provider.init(
      conversations: widget.conversationFrame.conversations,
      gameStage: widget.conversationFrame.gameStage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ConversationProvider>.value(
      value: _provider,
      child: _ConversationFrameContent(onComplete: widget.onComplete),
    );
  }
}

class _ConversationFrameContent extends StatelessWidget {
  const _ConversationFrameContent({required this.onComplete});

  final Function(String) onComplete;

  @override
  Widget build(BuildContext context) {
    double uiScale = context.uiScale();

    return Consumer<ConversationProvider>(
      builder: (context, provider, child) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, _) {
            if (didPop) return;
          },
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  provider.gameStage.background,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(32.0 * uiScale),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    width: 840.0,
                    height: 224.0,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 16.0,
                        top: 16.0,
                        right: 16.0,
                        bottom: 16.0,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (provider.currentCharacter != null)
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(color: Colors.black),
                              ),
                              width: 144.0,
                              child: Column(
                                children: [
                                  Image.asset(
                                    provider.currentCharacter!.sprite,
                                    width: 144.0,
                                    height: 144.0,
                                  ),
                                  Divider(
                                    height: 1.0,
                                    thickness: 1.0,
                                    color: Colors.black,
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                        ),
                                        child: Text(
                                          provider.currentCharacter!.name,
                                          style: TextStyle(fontSize: 18.0),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (provider.currentCharacter != null)
                            SizedBox(width: 16.0),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 4.0),
                                Divider(
                                  height: 1.0,
                                  thickness: 1.0,
                                  color: Colors.black26,
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 4.0,
                                    ),
                                    child: Text(
                                      provider.currentText,
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  height: 1.0,
                                  thickness: 1.0,
                                  color: Colors.black26,
                                ),
                                SizedBox(height: 4.0),
                                if (provider.isConversationFinished())
                                  ...provider.currentChoices.map((choice) {
                                    return Align(
                                      alignment: Alignment.bottomRight,
                                      child: TextButton(
                                        onPressed: () {
                                          if (choice.onSelected != null) {
                                            choice.onSelected!();
                                          }
                                          if (choice.nextFrameId != null) {
                                            onComplete(choice.nextFrameId!);
                                          } else if (choice.nextUnitId !=
                                              null) {
                                            provider.nextUnit(
                                              choice.nextUnitId!,
                                            );
                                          } else {
                                            Navigator.of(context).pop();
                                          }
                                        },
                                        style: TextButton.styleFrom(
                                          foregroundColor: Colors.black,
                                          overlayColor: Colors.black,
                                        ),
                                        child: Text(
                                          choice.text,
                                          style: TextStyle(fontSize: 16.0),
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    );
                                  }),
                                if (!provider.isConversationFinished())
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: TextButton(
                                      onPressed: provider.nextTextIndex,
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.black,
                                        overlayColor: Colors.black,
                                      ),
                                      child: Text(
                                        'Next',
                                        style: TextStyle(fontSize: 16.0),
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
