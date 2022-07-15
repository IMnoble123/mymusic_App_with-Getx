import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mymusic/controller/playlist_controller.dart';
import 'package:mymusic/playlist/add_songstoplaylist.dart';
import 'package:mymusic/widgets/play_page.dart';
import 'package:mymusic/widgets/songs_list.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Addtoplaylist extends StatefulWidget {
  Addtoplaylist({Key? key, this.newindex}) : super(key: key);
  int? newindex;

  @override
  State<Addtoplaylist> createState() => _AddtoplaylistState();
}

class _AddtoplaylistState extends State<Addtoplaylist> {
  final Playlistcontroller  controller = Get.find();
  @override
  Widget build(BuildContext context) {
   controller.getdisplaylist();
    controller.checkindex(widget.newindex);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: Text(controller.listdisplay[widget.newindex!].name!),
        // title:const Text('name',style: TextStyle(fontWeight: FontWeight.w400),),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => Addedplaylist(
                          newindex: widget.newindex,
                        )));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GetBuilder<Playlistcontroller>(
              init: Playlistcontroller(),
              builder: (ctx){
                // valueListenable: Functions.listdisplay,
                // builder: (BuildContext ctx, List<dynamic> name, Widget? child) {
                  return ListView.separated(
                    separatorBuilder: ((context, index) => const Divider(
                          indent: 80,
                          endIndent: 18,
                        )),
                    itemCount: controller
                        .listdisplay[widget.newindex!].playlist!.length,
                    itemBuilder: ((context, index) => ListTile(
                          title: Text(
                            Allsongs
                                .allsongs[controller.newlist[index]].title,
                            style: const TextStyle(fontSize: 15),
                            overflow: TextOverflow.ellipsis,
                          ),
                          leading: QueryArtworkWidget(
                              id: Allsongs
                                  .allsongs[controller.newlist[index]].id,
                              type: ArtworkType.AUDIO),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => Playpage(
                                    songModel: controller.playsongmodel,
                                    index: index)));
                          },
                        )),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
