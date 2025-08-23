import 'package:card_crawler/core/game/frame/core_game/core_game_frame_widget.dart';
import 'package:card_crawler/core/game/frame/base/game_frame.dart';
import 'package:card_crawler/core/game/scene/base/provider/game_scene_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../frame/conversation/conversation_frame.dart';
import '../../frame/conversation/conversation_frame_widget.dart';
import '../../frame/core_game/core_game_frame.dart';

class GameScene extends StatefulWidget {
  const GameScene({super.key, required this.frames, required this.onComplete});

  final Map<String, GameFrame> frames;
  final Function() onComplete;

  @override
  State<GameScene> createState() => _GameSceneState();
}

class _GameSceneState extends State<GameScene> {
  late GameSceneProvider _provider;

  @override
  void initState() {
    super.initState();
    _provider = GameSceneProvider();
    _provider.init(frames: widget.frames);
  }

  @override
  void dispose() {
    _provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameSceneProvider>.value(
      value: _provider,
      child: GameSceneContent(
        frames: widget.frames,
        onComplete: widget.onComplete,
      ),
    );
  }
}

class GameSceneContent extends StatelessWidget {
  const GameSceneContent({
    super.key,
    required this.frames,
    required this.onComplete,
  });

  final Map<String, GameFrame> frames;
  final Function() onComplete;

  @override
  Widget build(BuildContext context) {
    return Consumer<GameSceneProvider>(
      builder: (context, provider, child) {
        if (provider.currentFrame is CoreGameFrame) {
          return CoreGameFrameWidget(
            key: ValueKey(provider.currentFrameId),
            onComplete: (nextFrameId) {
              if (nextFrameId != null) {
                provider.nextFrame(nextId: nextFrameId);
              } else {
                onComplete();
              }
            },
            coreGameFrame: provider.currentFrame as CoreGameFrame,
          );
        } else if (provider.currentFrame is ConversationFrame) {
          return ConversationFrameWidget(
            key: ValueKey(provider.currentFrameId),
            onComplete: (nextFrameId, nextStatusEffects) {
              if (nextFrameId != null) {
                provider.nextFrame(
                  nextId: nextFrameId,
                  nextStatusEffects: nextStatusEffects,
                );
              } else {
                onComplete();
              }
            },
            conversationFrame: provider.currentFrame as ConversationFrame,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
