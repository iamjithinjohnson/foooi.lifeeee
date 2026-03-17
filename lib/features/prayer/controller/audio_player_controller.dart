import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerController extends GetxController {
  final AudioPlayer audioPlayer = AudioPlayer();
  
  var isPlaying = false.obs;
  var position = Duration.zero.obs;
  var duration = Duration.zero.obs;
  
  final String audioUrl = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'; // Replace with actual Psalm 46:1 URL

  @override
  void onInit() {
    super.onInit();
    _setupAudioPlayer();
  }

  Future<void> _setupAudioPlayer() async {
    try {
      await audioPlayer.setUrl(audioUrl);
      
      audioPlayer.playerStateStream.listen((state) {
        isPlaying.value = state.playing;
      });

      audioPlayer.positionStream.listen((p) {
        position.value = p;
      });

      audioPlayer.durationStream.listen((d) {
        duration.value = d ?? Duration.zero;
      });
    } catch (e) {
      print("Error loading audio: $e");
    }
  }

  void togglePlayPause() {
    if (isPlaying.value) {
      audioPlayer.pause();
    } else {
      audioPlayer.play();
    }
  }

  void seek(Duration pos) {
    audioPlayer.seek(pos);
  }

  void seekForward() {
    final newPos = position.value + const Duration(seconds: 10);
    if (newPos < duration.value) {
      audioPlayer.seek(newPos);
    }
  }

  void seekBackward() {
    final newPos = position.value - const Duration(seconds: 10);
    if (newPos > Duration.zero) {
      audioPlayer.seek(newPos);
    } else {
      audioPlayer.seek(Duration.zero);
    }
  }

  String formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(d.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(d.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void onClose() {
    audioPlayer.dispose();
    super.onClose();
  }
}
