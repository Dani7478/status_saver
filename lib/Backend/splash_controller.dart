import 'dart:async';

import 'package:status_downloader/Backend/gallery_controller.dart';
import 'package:status_downloader/Common%20Widget/navigate.dart';
import 'package:status_downloader/Screens/movement_screen.dart';
import 'package:status_downloader/links.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Timer(Duration(seconds: 5), () {
      movingWithFadein(MovementScreen());
    });
    super.onInit();
  }
}
