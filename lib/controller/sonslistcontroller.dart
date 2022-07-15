

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class SongslistController extends GetxController {
  List<SongModel> allsongs = [];
  AudioPlayer audioPlayer = AudioPlayer();
  // final _audioQuery = OnAudioQuery();
  @override
  void onInit() {
    super.onInit();
    requestPermission();
  }

  void requestPermission() {
    Permission.storage.request();
  }

  // playSong(String? uri) {
  //   try {
  //     Allsongs.audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(uri!)));
  //     Allsongs.audioPlayer.play();
  //   } on Exception {
  //     log('Error parsing song');
  //   }
  // }
}
