import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mymusic/Model/data_model.dart';
import 'package:mymusic/controller/playlist_controller.dart';
import 'package:mymusic/playlist/playlist_file.dart';

class Playlist extends StatefulWidget {
  Playlist({Key? key}) : super(key: key);

  @override
  State<Playlist> createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  final nameController = TextEditingController();
  final Playlistcontroller controller = Get.put(Playlistcontroller());
  @override
  Widget build(BuildContext context) {
    controller.getdisplaylist();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        title: const Text('Playlist'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        backgroundColor: Colors.black,
                        content: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextField(
                            controller: nameController,
                            autofocus: true,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                                hintText: "Give Name",
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                )),
                                hintStyle: TextStyle(
                                  color: Colors.white12,
                                  fontSize: 20,
                                )),
                          ),
                        ),
                        actions: [
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: ElevatedButton(
                                // borderSide:
                                //     const BorderSide(color: Colors.white),
                                onPressed: () {
                                  final abs = nameController.text;
                                  final model =
                                      Playlistto(name: abs, playlist: []);
                                  controller.addplaylist(model: model);
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "done",
                                  style: TextStyle(color: Colors.pinkAccent),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    });
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "create playlist",
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
              )),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: GetBuilder<Playlistcontroller>(
              init:Playlistcontroller(),
              builder: (value){
                // valueListenable: Functions.listdisplay,
                // builder: (BuildContext ctx, List<dynamic> play, Widget? child) {
                  return ListView.separated(
                      separatorBuilder: ((context, index) => const Divider(
                            indent: 18,
                            endIndent: 18,
                          )),
                      itemCount: controller.listdisplay.length,
                      itemBuilder: ((context, index) {
                        return ListTile(
                          title: Text(controller.listdisplay[index].name.toString()),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => Addtoplaylist(
                                      newindex: index,
                                    )));
                          },
                          trailing: IconButton(
                              onPressed: () {
                               controller.deleteplaylist(index);
                              },
                              icon: const Icon(
                                Icons.delete,
                                size: 15,
                              )),
                        );
                      }));
                }),
          ),
        ],
      ),
    );
  }
}
