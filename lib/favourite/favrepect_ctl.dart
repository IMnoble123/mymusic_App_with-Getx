import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mymusic/controller/favourite_controller.dart';
import 'package:mymusic/widgets/songs_list.dart';

class Favicon extends StatefulWidget {
  Favicon({Key? key, this.index}) : super(key: key);

  dynamic index;

  @override
  State<Favicon> createState() => _FaviconState();
}

class _FaviconState extends State<Favicon> {

   FavController controller = Get.put(FavController());

  // void toast(BuildContext context, String text) {
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     content: Text(text),
  //     behavior: SnackBarBehavior.floating,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
  //   ));
  // }

  @override
  Widget build(BuildContext context) {
    final findindex = controller.favsong.contains(widget.index);
    final indexcheck = controller.dblist
        .indexWhere((element) => element == Allsongs.allsongs[widget.index].id);
        
    if (findindex == true) {
      return IconButton(
          onPressed: () async {
            controller.delectsong(indexcheck);
            // toast(context, " Removed from favorites");
           
          },
          icon: const Icon(
            Icons.favorite,
            color: Colors.red,
          ));
    }
    return IconButton(
        onPressed: () async {
          await controller.addfavsong(Allsongs.allsongs[widget.index].id);
          // toast(context, "Add to favorites");
          
        },
        icon: const Icon(Icons.favorite_border,
            color: Color.fromARGB(96, 69, 68, 68)));
  }
}
