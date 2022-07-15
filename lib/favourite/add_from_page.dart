import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mymusic/controller/favourite_controller.dart';
import 'package:mymusic/favourite/favrepect_ctl.dart';
import 'package:mymusic/widgets/home_page.dart';
import 'package:mymusic/widgets/play_page.dart';
import 'package:mymusic/widgets/search_bar.dart';
import 'package:mymusic/widgets/settings_page.dart';
import 'package:mymusic/widgets/songs_list.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Addfrompage extends StatelessWidget {
 final  FavController controller = Get.put(FavController());
  Addfrompage({Key? key}) : super(key: key);
  static AudioPlayer audioPlayer = AudioPlayer();
  final _audioQuery = OnAudioQuery();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Add to favourites',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => const Search()));
              },
              icon: const Icon(Ionicons.search))
        ],
      ),
      body: GetBuilder<FavController>(
        init: FavController(),
        builder: (controller) {
          return FutureBuilder<List<SongModel>>(
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
              return Stack(
                children: [
                  ListView.separated(
                    separatorBuilder: ((context, index) => const Divider(
                          indent: 18,
                          endIndent: 18,
                        )),
                    itemBuilder: (context, index) => ListTile(
                      title: Text(
                        item.data![index].displayNameWOExt,
                        overflow: TextOverflow.ellipsis,
                        // maxLines: 1,
                      ),
                      subtitle: Text(
                        "${item.data![index].artist}",
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Favicon(
                        index: index,
                      ),
                      leading: QueryArtworkWidget(
                        id: item.data![index].id,
                        type: ArtworkType.AUDIO,
                      ),
                      onTap: () {
                        Homepage.selectedsong = index;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Playpage(songModel: item.data!, index: index),
                          ),
                        );
                      },
                      onLongPress: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (ctx) => const Forthpage()));
                      },
                    ),
                    itemCount: item.data!.length,
                  ),
                ],
              );
            },
          );
        }
      ),
    );
  }
}
