
import 'package:flutter/material.dart';
import 'package:mymusic/widgets/home_page.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    gohome(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 210),
              child: Image.asset('assets/noble.png',
              height: 100,
              width: 100,
              ),
            ),
          ),
          // Padding(
          //     padding: const EdgeInsets.only(top: 200),
          //     child: LoadingAnimationWidget.staggeredDotsWave(
          //       color: Colors.redAccent,
          //       size: 40,
          //     )),
        ],
      ),
    );
  }
}

Future<void> gohome(BuildContext context) async {
  await Future.delayed(const Duration(seconds: 4));
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (ctx) =>  Homepage()));
}
