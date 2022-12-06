import 'package:status_downloader/links.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import '../Common Widget/snackBar.dart';
import 'package:share/share.dart';


class VideoStatusController extends GetxController {
  List<String> videoList = [];
  String whatsappPath =
      '/storage/emulated/0/Android/media/com.whatsapp/WhatsApp/Media/.Statuses/.';
  String businessWhatsappPath =
      '/storage/emulated/0/Android/media/com.whatsapp.w4b/WhatsApp Business/Media/.Statuses/.';
  String whatsappPath2 = 'storage/emulated/0/whatsApp/Media/.Statuses/.';
  String businessWhatsappPath2 =
      'storage/emulated/0/whatsApp Business/Media/.Statuses/.';





  void requestStoragePermission() async {
    Map<Permission, PermissionStatus> result = await [
      Permission.storage,
      Permission.manageExternalStorage,
    ].request();

    //if permission is granted only then show home screen else permission error screen is already shown
    if (result[Permission.storage] == PermissionStatus.granted &&
        result[Permission.manageExternalStorage] == PermissionStatus.granted) {
      print('All Permission');
    }
    else {
      print('Not All Permission');
    }
  }
  getVideoStatus(String waType) async {
    requestStoragePermission();
    var status = await Permission.storage.request();
    if (status.isDenied) {
      Permission.storage.request();
      print('Permission Dinied');
    }
    if (status.isGranted) {
      print('Permission Granted');
      if (waType == 'whatsapp') {
        final Directory directory = Directory(whatsappPath);
        final Directory directory2 = Directory(whatsappPath2);
        if (directory.existsSync()) {
          videoList = directory
              .listSync()
              .map((item) => item.path)
              .where((item) => item.endsWith(".mp4"))
              .toList(growable: false);
          update();
        } else {
          videoList = directory2
              .listSync()
              .map((item) => item.path)
              .where((item) => item.endsWith(".mp4"))
              .toList(growable: false);
          update();
        }
        print('Getting Videos whatsapp ${videoList.length}');
      }
      if (waType == 'business whatsapp') {
        final Directory directory = Directory(businessWhatsappPath);
        final Directory directory2 = Directory(businessWhatsappPath2);
        if (directory.existsSync()) {
          videoList = directory
              .listSync()
              .map((item) => item.path)
              .where((item) => item.endsWith(".mp4"))
              .toList(growable: false);
          update();
        } else {
          videoList = directory2
              .listSync()
              .map((item) => item.path)
              .where((item) => item.endsWith(".mp4"))
              .toList(growable: false);
          update();
        }
        print('Getting Videos whatsappBusiness ${videoList.length}');
      }
    }

    update();
  }

  downloadVideo(String imagepath) async {
    await ImageGallerySaver.saveFile(imagepath).then((value) {
      customSnackBar('Video Saved Successfully');
    });
  }
  shareVideo(String path) async {
    print('Sharing image');
    await Share.shareFiles([path], text: 'Status Downloader');
  }
}
