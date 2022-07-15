import 'package:get/get.dart';
import 'package:mymusic/widgets/play_page.dart';

class HomepaeController extends GetxController {
  dynamic selectedsong;
  @override
  void onInit() {
    Playpage.audioPlayer.currentIndexStream.listen((event) {
      if (event != null) {
        selectedsong = event;
      }
    });
    super.onInit();
    update();
  }
}
