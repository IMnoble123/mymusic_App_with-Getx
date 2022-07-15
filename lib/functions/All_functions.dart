// import 'package:get/get.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:mymusic/widgets/songs_list.dart';
// import 'package:on_audio_query/on_audio_query.dart';

// class FunctionsController extends GetxController {
  // static ValueNotifier<List> favsong = ValueNotifier([]);
  // static ValueNotifier<List<SongModel>> plyaysongmodel = ValueNotifier([]);
  // List<SongModel> playsongmodel = [];
  // List<dynamic> favsong = [];
  // var dblist = [];
  // addfavsong(value) async {
  //   final songsDB = await Hive.openBox('song_db');
  //   await songsDB.add(value);
  //   dblist = songsDB.values.toList();
  //   // print('........................noble....${songsDB}');//
  //   favsong.add(value);
  //   showlistfavsongs();
  //   update();
  // }

  // showlistfavsongs() async {
  //   final songsDB = await Hive.openBox('song_db');
  //   final dbsongs = songsDB.values.toList();
  //   favsong.clear();
  //   for (int i = 0; i < dbsongs.length; i++) {
  //     for (int j = 0; j < Allsongs.allsongs.length; j++) {
  //       if (dbsongs[i] == Allsongs.allsongs[j].id) {
  //         favsong.add(j);
  //         playsongmodel.add(Allsongs.allsongs[j]);
  //       }
  //     }
  //   }
  //   update();
  // }

  // delectsong(index) async {
  //   final songsDB = await Hive.openBox('song_db');
  //   await songsDB.deleteAt(index);
  //   showlistfavsongs();
  //   update();
  // }

  // function for Playlist //

  // addplaylist({required Playlistto model}) async {
  //   final Playlistdb = await Hive.openBox<Playlistto>('_addplay');
  //   await Playlistdb.add(model);
  //   // print('..${Playlistdb.values}');//
  //   getdisplaylist();
  // }

  // // static ValueNotifier<List<Playlistto>> listdisplay = ValueNotifier([]);
  // List<dynamic> listdisplay = [];

  // getdisplaylist() async {
  //   final Playlistdb = await Hive.openBox<Playlistto>('_addplay');
  //   listdisplay.clear();
  //   // database values to list
  //   listdisplay.addAll(Playlistdb.values);
  //   // listdisplay.notifyListeners();
  //   update();
  // }

  // updatelist(index, model) async {
  //   final Playlistdb = await Hive.openBox<Playlistto>('_addplay');
  //   Playlistdb.putAt(index, model);
  //   getdisplaylist();
  //   checkindex(index);
  // }

  // deleteplaylist(index) async {
  //   final Playlistdb = await Hive.openBox<Playlistto>('_addplay');
  //   await Playlistdb.deleteAt(index);
  //   getdisplaylist();
  // }

  // List<int> newlist = [];

  // checkindex(index) async {
  //   List fullist = listdisplay[index].playlist!;
  //   newlist.clear();
  //   playsongmodel.clear();
  //   for (int i = 0; i < fullist.length; i++) {
  //     for (var j = 0; j < Allsongs.allsongs.length; j++) {
  //       if (fullist[i] == Allsongs.allsongs[j].id) {
  //         newlist.add(j);
  //         playsongmodel.add(Allsongs.allsongs[j]);
  //       }
  //     }
  //   }
  // }
// }

// class Checklist extends GetxController {
//   // static ValueNotifier<List<int>> newlist = ValueNotifier([]);
//   List<int> newlist = [];
  
//   checkindex(index) async {
//     List fullist = FunctionsController.listdisplay[index].playlist!;
//     newlist.clear();
//     FunctionsController.playsongmodel.clear();
//     for (int i = 0; i < fullist.length; i++) {
//       for (var j = 0; j < Allsongs.allsongs.length; j++) {
//         if (fullist[i] == Allsongs.allsongs[j].id) {
//           newlist.add(j);
//           FunctionsController.playsongmodel.value.add(Allsongs.allsongs[j]);
//         }
//       }
//     }
//   }
// }
