import 'dart:io';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';

class GalleryController extends GetxController {
  List<String> photolist = [];
  List<String> videoList = [];
  List<VideoPlayerController> controllerList = [];

  // getallPhoto(String path) {
  //   photolist.clear();
  //   photolist.add('images/status1.jpg');
  //   photolist.add('images/status2.jpg');
  //   photolist.add('images/status3.jpg');
  //   photolist.add('images/status4.jpg');
  //   photolist.add('images/status5.jpg');
  //   print(photolist.length);
  //   update();
  // }

  getAllSavedImages() {
    String savedPath = '';
    final Directory directory = Directory('storage/emulated/0/Pictures/.');
    final Directory directory2 = Directory('storage/emulated/0/Movies/.');
    if (directory.existsSync()) {
      photolist = directory
          .listSync()
          .map((item) => item.path)
          .where((item) => item.endsWith(".jpg"))
          .toList(growable: false);
      print('Photo Length ${photolist.length}');
      photolist = photolist.reversed.toList();
      if(photolist.length<1){
        photolist = directory2
            .listSync()
            .map((item) => item.path)
            .where((item) => item.endsWith(".jpg"))
            .toList(growable: false);
        photolist = photolist.reversed.toList();
      }
      update();
    }
  }

  getAllSavedVideo() {
    String savedPath = '';
    final Directory directory = Directory('storage/emulated/0/Pictures/.');
    final Directory directory2 = Directory('storage/emulated/0/Movies/.');
    if (directory.existsSync()) {
      videoList = directory
          .listSync()
          .map((item) => item.path)
          .where((item) => item.endsWith(".mp4"))
          .toList(growable: false);
      print('Video Length ${photolist.length}');
      videoList = videoList.reversed.toList();
      if(videoList.length<1){
        videoList = directory2
            .listSync()
            .map((item) => item.path)
            .where((item) => item.endsWith(".mp4"))
            .toList(growable: false);
        print('Video Length ${photolist.length}');
        videoList = videoList.reversed.toList();
      }
      update();
    }
  }

  intializeVideos() {
    for (int i = 0; i < videoList.length; i++) {
      VideoPlayerController? controller;
      controller = VideoPlayerController.network(
        videoList[i],
      )..initialize().then((value) {
          controller!.setLooping(true);
        });
      controllerList.add(controller);
    }
    update();
  }

  void refresher() {
    for (int i = 0; i < controllerList.length; i++) {
      controllerList[i].dispose();
    }
    controllerList = [];
    update();
  }

}
