import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mymusic/Model/data_model.dart';
import 'package:mymusic/controller/playlist_controller.dart';
import 'package:mymusic/widgets/songs_list.dart';

class PlaylistButton extends StatefulWidget {
  PlaylistButton(
      {Key? key,
      required this.index,
      required this.folderindex,
      required this.songindex})
      : super(key: key);

  int? index;
  int? folderindex;
  int? songindex;
  List<dynamic> songslist = [];
  static List<dynamic> updatelist = [];
  static List<dynamic> dltlist = [];

  @override
  State<PlaylistButton> createState() => _PlaylistButtonState();
}

class _PlaylistButtonState extends State<PlaylistButton> {
  final Playlistcontroller controller = Get.find();
  @override
  Widget build(BuildContext context) {
    final checkindex = controller
        .listdisplay[widget.folderindex!].playlist!
        .contains(widget.songindex);
    final indexcheck =
        controller.listdisplay[widget.folderindex!].playlist!.indexWhere(
            (element) => element == Allsongs.allsongs[widget.index!].id);
    if (checkindex != true) {
      return IconButton(
          onPressed: () async {
            widget.songslist.add(Allsongs.allsongs[widget.index!].id);
            PlaylistButton.updatelist = [
              widget.songslist,
              controller.listdisplay[widget.folderindex!].playlist!
            ].expand((element) => element).toList();
            final model = Playlistto(
              name: controller.listdisplay[widget.folderindex!].name,
              playlist: PlaylistButton.updatelist,
            );
            controller.updatelist(widget.folderindex, model);
            setState(() {});
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  ' Song added to playlist ${controller.listdisplay[widget.folderindex!].name},',
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: const Color.fromARGB(255, 62, 62, 62),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
          icon: const Icon(Icons.add, color: Colors.black));
    }
    return IconButton(
        onPressed: () async {
          controller.listdisplay[widget.folderindex!].playlist!
              .removeAt(indexcheck);
          PlaylistButton.dltlist = [
            widget.songslist,
            controller.listdisplay[widget.folderindex!].playlist!
          ].expand((element) => element).toList();
          final model = Playlistto(
            name: controller.listdisplay[widget.folderindex!].name,
            playlist: PlaylistButton.dltlist,
          );

          controller.updatelist(widget.folderindex, model);
          setState(() {});
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Song deleted from the playlist  ${controller.listdisplay[widget.folderindex!].name},',
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: const Color.fromARGB(255, 68, 68, 68),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        icon: Icon(
          Icons.remove,
          color: Colors.red.shade200,
        ));
  }
}
