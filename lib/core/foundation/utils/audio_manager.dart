import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  static final AudioPlayer player = AudioPlayer();

  static Future<void> playBgm(String asset) async {
    await player.stop();
    await player.setReleaseMode(ReleaseMode.loop);
    await player.play(AssetSource(asset));
  }

  static Future<void> stopBgm() async {
    await player.stop();
  }
}
