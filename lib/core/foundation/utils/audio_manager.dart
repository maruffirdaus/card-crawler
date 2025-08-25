import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  static final AudioPlayer _bgmPlayer = AudioPlayer();
  static final AudioPlayer _sfxPlayer = AudioPlayer();

  static Future<void> playBgm(String asset) async {
    await _bgmPlayer.stop();
    await _bgmPlayer.setReleaseMode(ReleaseMode.loop);
    await _bgmPlayer.play(AssetSource(asset), volume: 0.1);
  }

  static Future<void> stopBgm() async {
    await _bgmPlayer.stop();
  }

  static Future<void> playSfx(String asset) async {
    await _sfxPlayer.stop();
    await _sfxPlayer.play(AssetSource(asset), mode: PlayerMode.lowLatency);
  }

  static Future<void> stopSfx() async {
    await _sfxPlayer.stop();
  }
}
