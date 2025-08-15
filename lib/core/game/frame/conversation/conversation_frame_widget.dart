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

  final Function() onComplete;
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

  final Function() onComplete;

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
                    height: 160.0,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 16.0,
                        top: 16.0,
                        right: 16.0,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            provider.currentConversationUnit.character.sprite,
                            width: 144.0,
                            height: 144,
                          ),
                          SizedBox(width: 16.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  provider
                                      .currentConversationUnit
                                      .character
                                      .name,
                                  style: TextStyle(fontSize: 16.0 * uiScale),
                                ),
                                Text(
                                  provider.currentConversationUnit.text,
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16.0 * uiScale,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                ...provider.currentConversationUnit.choices.map(
                                  (choice) {
                                    return Align(
                                      alignment: Alignment.center,
                                      child: TextButton(
                                        onPressed: () {
                                          if (choice.nextId != null) {
                                            provider.advanceConversation(
                                              choice.nextId!,
                                            );
                                          } else {
                                            onComplete();
                                          }
                                        },
                                        style: TextButton.styleFrom(
                                          foregroundColor: Colors.black,
                                          overlayColor: Colors.black,
                                        ),
                                        child: Text(
                                          choice.text,
                                          style: TextStyle(
                                            fontSize: 16.0 * uiScale,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
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
