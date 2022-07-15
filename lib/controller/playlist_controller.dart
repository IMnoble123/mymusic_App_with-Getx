import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mymusic/Model/data_model.dart';
import 'package:mymusic/widgets/songs_list.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Playlistcontroller extends GetxController{
   List<SongModel> playsongmodel = [];
   List<dynamic> listdisplay = [];
   List<int> newlist = [];
  
  addplaylist({required Playlistto model}) async {
    final Playlistdb = await Hive.openBox<Playlistto>('_addplay');
    await Playlistdb.add(model);
    getdisplaylist();
  }

  // static ValueNotifier<List<Playlistto>> listdisplay = ValueNotifier([]);
  // List<dynamic> listdisplay = [];

  getdisplaylist() async {
    final Playlistdb = await Hive.openBox<Playlistto>('_addplay');
    listdisplay.clear();
    // database values to list
    listdisplay.addAll(Playlistdb.values);
    // listdisplay.notifyListeners();
    update();
  }

  updatelist(index, model) async {
    final Playlistdb = await Hive.openBox<Playlistto>('_addplay');
    Playlistdb.putAt(index, model);
    getdisplaylist();
    checkindex(index);
  }

  deleteplaylist(index) async {
    final Playlistdb = await Hive.openBox<Playlistto>('_addplay');
    await Playlistdb.deleteAt(index);
    getdisplaylist();
  }

  // List<int> newlist = [];

  checkindex(index) async {
    List fullist = listdisplay[index].playlist!;
    newlist.clear();
    playsongmodel.clear();
    for (int i = 0; i < fullist.length; i++) {
      for (var j = 0; j < Allsongs.allsongs.length; j++) {
        if (fullist[i] == Allsongs.allsongs[j].id) {
          newlist.add(j);
          playsongmodel.add(Allsongs.allsongs[j]);
        }
      }
    }
  }
}