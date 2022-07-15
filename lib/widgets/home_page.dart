import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mymusic/artist/artist.dart';
import 'package:mymusic/controller/homepagecontroller.dart';
import 'package:mymusic/favourite/fav_page.dart';
import 'package:mymusic/playlist/playlist.dart';
import 'package:mymusic/settings/settings.dart';
import 'package:mymusic/widgets/search_bar.dart';
import 'package:mymusic/widgets/songs_list.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'play_page.dart';

class Homepage extends StatefulWidget {
   const Homepage({Key? key}) : super(key: key);
  static dynamic selectedsong;
  

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


  final HomepaeController controller = Get.put(HomepaeController());

  // @override
  // void initState() {
  //   super.initState();
  //     Playpage.audioPlayer.currentIndexStream.listen((event) {
  //     if (event != null) {
  //       Homepage.selectedsong = event;
  //       setState(() {});
  // }
    
     


  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(450.0),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
                onPressed: () {
                  Get.to(() => const Settings());
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (ctx) => const Settings()));
                },
                icon: const ColoredBox(
                  color: Color.fromARGB(18, 0, 0, 0),
                  child: Icon(
                    Ionicons.settings_outline,
                    color: Colors.white,
                  ),
                )),
            title: const Text(
              'my music',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: IconButton(
                      onPressed: () {
                        Get.to(() => const Search());
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (ctx) => const Search()));
                      },
                      icon: const ColoredBox(
                        color: Color.fromARGB(18, 0, 0, 0),
                        child: Icon(
                          Ionicons.search,
                          color: Colors.white,
                        ),
                      ))),
            ],
            centerTitle: true,
            flexibleSpace: InkWell(
              onTap: () {
                Get.to(() => Playpage(
                    songModel: Allsongs.allsongs,
                    index: Homepage.selectedsong));
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (ctx) => Playpage(
                //         songModel: Allsongs.allsongs,
                //         index: Homepage.selectedsong)));
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Builder(builder: (context) {
                  if (Homepage.selectedsong!= null) {
                    return QueryArtworkWidget(
                      id: Allsongs
                          .allsongs[Playpage.audioPlayer.currentIndex!].id,
                      type: ArtworkType.AUDIO,
                      artworkFit: BoxFit.fill,
                    );
                  } else {
                    return Image.asset('assets/newheadphone.jpg',
                        fit: BoxFit.cover);
                  }
                }),
              ),
            ),
          )),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child:GetBuilder <HomepaeController>( 
          init: HomepaeController(),
          builder: (controller) {
            return GridView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {
                        Get.to(() => const Allsongs());
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(builder: (ctx) => const Allsongs()));
                      },
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 80, top: 40, left: 35),
                            child: Icon(
                              Ionicons.musical_note,
                              size: 35,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 61,
                            ),
                            child: Row(
                              children: const [
                                Text(
                                  'On your device',
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {
                        Get.to(() => Favpage());
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(builder: (ctx) => const Favpage()));
                      },
                      child: Column(
                        children: [
                          const Padding(
                              padding:
                                  EdgeInsets.only(right: 40, top: 40, left: 25),
                              child: Icon(
                                Ionicons.heart_outline,
                                size: 35,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 80,
                            ),
                            child: Row(
                              children: const [
                                Text(
                                  'Favorites',
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {
                        Get.to(() => Playlist());
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(builder: (ctx) => const Playlist()));
                      },
                      child: Column(
                        children: [
                          const Padding(
                              padding:
                                  EdgeInsets.only(right: 73, top: 40, left: 35),
                              child: Icon(
                                Ionicons.musical_notes,
                                size: 35,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 65,
                            ),
                            child: Row(
                              children: const [
                                Text(
                                  'Playlist',
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {
                        
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => const Artistpage()));
                      },
                      child: Column(
                        children: [
                          const Padding(
                              padding:
                                  EdgeInsets.only(right: 35, top: 40, left: 25),
                              child: Icon(
                                Ionicons.time,
                                size: 35,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 76,
                            ),
                            child: Row(
                              children: const [
                                Text(
                                  'Artists',
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.3,
                    crossAxisCount: 2,
                    crossAxisSpacing: 0.6,
                    mainAxisSpacing: 0.6));
          }
        ),
      ),
    );
  }
}
  