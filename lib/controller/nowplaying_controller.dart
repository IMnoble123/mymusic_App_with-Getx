import 'dart:developer';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:mymusic/widgets/home_page.dart';
import 'package:mymusic/widgets/play_page.dart';
import 'package:on_audio_query/on_audio_query.dart';

class NowPlayingController extends GetxController {
  dynamic index;
  //  dynamic selectedsong;
  bool _isPlaying = false;

  List<SongModel> songModel = [];

  AudioPlayer audioPlayer = AudioPlayer();
  // NowPlayingController() {
  //   audioPlayer.currentIndexStream.listen((event) {
  //     if (event != null) {
  //       selectedindex = event;
  //       update();
  //     }
  //   });
  // }
  @override
  void onInit() {
    playSong();
    super.onInit();
  }

  playSong() {
    try {
      Homepage.selectedsong = index;
      Playpage.audioPlayer
          .setAudioSource(createPlaylist(songModel), initialIndex: index);
      Playpage.audioPlayer.play();
      _isPlaying = true;
    } on Exception {
      log('cannot parse song');
    }
  }

  ConcatenatingAudioSource createPlaylist(List<SongModel> songs) {
    List<AudioSource> sources = [];
    for (var song in songs) {
      sources.add(AudioSource.uri(Uri.parse(song.uri!),
          tag: MediaItem(id: song.id.toString(), title: song.title)));
    }
    return ConcatenatingAudioSource(children: sources);
  }
  

}
