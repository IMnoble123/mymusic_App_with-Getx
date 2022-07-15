import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mymusic/widgets/songs_list.dart';
import 'package:on_audio_query/on_audio_query.dart';

class FavController extends GetxController{
  List<SongModel> playsongmodel = [];
  List<dynamic> favsong = [];
  var dblist = [];
  addfavsong(value) async {
    final songsDB = await Hive.openBox('song_db');
    await songsDB.add(value);
    dblist = songsDB.values.toList();
    favsong.add(value);
    showlistfavsongs();
    update();
  }

  showlistfavsongs() async {
    final songsDB = await Hive.openBox('song_db');
    final dbsongs = songsDB.values.toList();
    favsong.clear();
    for (int i = 0; i < dbsongs.length; i++) {
      for (int j = 0; j < Allsongs.allsongs.length; j++) {
        if (dbsongs[i] == Allsongs.allsongs[j].id) {
          favsong.add(j);
          playsongmodel.add(Allsongs.allsongs[j]);
        }
      }
    }
    update();
  }

  delectsong(index) async {
    final songsDB = await Hive.openBox('song_db');
    await songsDB.deleteAt(index);
    showlistfavsongs();
    update();
  }
  
}