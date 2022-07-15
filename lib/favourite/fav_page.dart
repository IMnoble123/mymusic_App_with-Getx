import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mymusic/controller/favourite_controller.dart';
import 'package:mymusic/favourite/add_from_page.dart';
import 'package:mymusic/widgets/play_page.dart';
import 'package:mymusic/widgets/songs_list.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Favpage extends StatelessWidget {
  Favpage({Key? key}) : super(key: key);
  final FavController controller = Get.put(FavController());
  // void toast(BuildContext context, String text) {
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     content: Text(text),
  //     duration: const Duration(seconds: 2),
  //     behavior: SnackBarBehavior.floating,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
  //   ));
  // }

  @override
  Widget build(BuildContext context) {
    controller.showlistfavsongs();
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Favourites',
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => Addfrompage()));
              },
              icon: const Icon(Icons.add))
        ],
        backgroundColor: Colors.white,
      ),
      body: GetBuilder<FavController>(
          // valueListenable: Functions.favsong,
          // builder: (BuildContext ctx, List<dynamic> indexs, Widget? child) {
          init: FavController(),
          builder: (controller) {
            return ListView.separated(
              separatorBuilder: ((context, index) => const Divider(
                    indent: 18,
                    endIndent: 18,
                  )),
              itemCount: controller.favsong.length,
              itemBuilder: (ctx, index) {
                return ListTile(
                  leading: QueryArtworkWidget(
                      id: Allsongs.allsongs[controller.favsong[index]].id,
                      type: ArtworkType.AUDIO),
                  title: Text(
                      Allsongs.allsongs[controller.favsong[index]].title,
                      overflow: TextOverflow.ellipsis),
                  subtitle: Text(
                      Allsongs.allsongs[controller.favsong[index]].artist!,
                      overflow: TextOverflow.fade),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => Playpage(
                            songModel: Allsongs.allsongs,
                            index: controller.favsong[index])));
                  },
                  trailing: IconButton(
                      onPressed: () async {
                        await controller.delectsong(index);
                        // toast(context, " Removed from favorites");
                      },
                      icon: const Icon(
                        Ionicons.heart,
                        size: 18,
                        color: Colors.red,
                      )),
                );
              },
            );
          }),
    );
  }
}
