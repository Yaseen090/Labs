import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.black));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: DisplayPicture(),
      ),
    );
  }
}

class DisplayPicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Swiper(
      loop: false,
      itemCount: 5,
      pagination: SwiperPagination(),
      itemBuilder: (_, index) {
        return InteractiveViewer(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage("assets/images/${index + 1}.jpg"),
              ),
            ),
          ),
        );
      },
    );
  }
}
