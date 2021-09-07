import 'package:audioplayers/audioplayers.dart';

class AudioHelper {
  late AudioPlayer _player;
  late AudioCache _cache;

  AudioHelper.init() {
    _player = AudioPlayer(playerId: "1", mode: PlayerMode.MEDIA_PLAYER);
    _cache = AudioCache(fixedPlayer: _player, prefix: 'assets/audios/');
    _cache.loadAll(["click.mp3", "correct.mp3", "wrong.mp3", "celebration.mp3"]);
  }

  Future<void> stopPlaying() async {
    await _player.stop();
  }

  void playSoundFromUrl({required String soundUrl}) {
    _player.stop();
    print(soundUrl);
    _player.play(soundUrl, isLocal: false);
  }

  void playSoundInLocal({required String soundUrl, required double playBackRate}) {
    _player.play(soundUrl, isLocal: true);
    _player.setPlaybackRate(playBackRate);
    _player.onPlayerError.listen((msg) => _player.release());
  }

  void playSoundBuiltIn(String soundUrl) {
    _player.stop();
    _cache.play(soundUrl, mode: PlayerMode.MEDIA_PLAYER);
  }
}
