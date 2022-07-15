import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mymusic/controller/playlist_controller.dart';
import 'package:mymusic/functions/All_functions.dart';
import 'package:mymusic/playlist/playlist_ctl.dart';
import 'package:mymusic/widgets/songs_list.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Addedplaylist extends StatefulWidget {
  Addedplaylist({Key? key, this.newindex}) : super(key: key);
  int? newindex;
  dynamic list1 = [];
  dynamic list2 = [];

  @override
  State<Addedplaylist> createState() => _AddedplaylistState();
}

class _AddedplaylistState extends State<Addedplaylist> {
  final Playlistcontroller controller = Get.find();
  final _audioQuery = OnAudioQuery();
  final AudioPlayer audioPlayer = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    controller.getdisplaylist();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Add to playlist'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        leadingWidth: 80,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder<List<SongModel>>(
        future: _audioQuery.querySongs(
            sortType: null,
            orderType: OrderType.ASC_OR_SMALLER,
            uriType: UriType.EXTERNAL,
            ignoreCase: true),
        builder: (context, item) {
          Allsongs.allsongs = item.data!;
          if (item.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (item.data!.isEmpty) {
            return const Center(child: Text('no songs found'));
          }
          return ListView.separated(
            separatorBuilder: ((context, index) => const Divider(
                  indent: 80,
                  endIndent: 18,
                )),
            itemBuilder: (context, index) => ListTile(
              title: Text(
                item.data![index].displayNameWOExt,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                "${item.data![index].artist}",
                overflow: TextOverflow.ellipsis,
              ),
              // trailing: IconButton(
              //     onPressed: () {
              //       widget.list1.add(Allsongs.allsongs[index].id);
              //       widget.list2 = [
              //         widget.list1,
              //         Functions.listdisplay.value[widget.newindex!].playlist
              //       ].expand((element) => element).toList();
              //       final model = playlistto(
              //           name:
              //               Functions.listdisplay.value[widget.newindex!].name,
              //           playlist: widget.list2);
              //       Functions.updatelist(widget.newindex, model);
              //     },
              //     icon: const Icon(Icons.playlist_add)),
              trailing: PlaylistButton(
                  index: index,
                  folderindex: widget.newindex,
                  songindex: Allsongs.allsongs[index].id),
              leading: QueryArtworkWidget(
                id: item.data![index].id,
                type: ArtworkType.AUDIO,
              ),
            ),
            itemCount: item.data!.length,
          );
        },
      ),
    );
  }
}
