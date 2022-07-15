
import 'package:flutter/material.dart';
import 'package:mymusic/favourite/add_from_page.dart';
import 'package:mymusic/playlist/playlist.dart';

class Forthpage extends StatelessWidget {
  const Forthpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon:const Icon(Icons.arrow_back_ios)),
            elevation: 0,
            backgroundColor:const Color.fromARGB(255, 232, 224, 224),
      ),
      backgroundColor: const Color.fromARGB(255, 232, 224, 224),
      body: Column(children: [
        const SizedBox(
          height: 270,
        ),
        Center(
          child: Container(
            width: 350,
            height: 325,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18), color: Colors.white),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => Addfrompage()));
                        },
                        child: const Text(
                          'Add to favourites',
                          style: TextStyle(color: Colors.black87),
                        ))
                  ],
                ),
                const Divider(
                  color: Colors.black,
                  indent: 12,
                  endIndent: 10,
                ),
                // Row(
                //   children: [
                //     TextButton(
                //         onPressed: () {},
                //         child: const Text(
                //           'song info',
                //           style: TextStyle(color: Colors.black),
                //         )),
                //   ],
                // ),
                // const Divider(
                //   color: Colors.black,
                //   indent: 12,
                //   endIndent: 10,
                // ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) =>  Playlist()));
                        },
                        child: const Text(
                          'Add to playlist ',
                          style: TextStyle(color: Colors.black),
                        )),
                  ],
                ),
                const Divider(
                  color: Colors.black,
                  indent: 12,
                  endIndent: 10,
                ),
                // Row(
                //   children: [
                //     TextButton(
                //         onPressed: () {},
                //         child: const Text(
                //           'play next',
                //           style: TextStyle(color: Colors.black),
                //         )),
                //   ],
                // ),
                // const Divider(
                //   color: Colors.black,
                //   indent: 12,
                //   endIndent: 10,
                // ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
