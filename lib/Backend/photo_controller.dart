import 'dart:io';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share/share.dart';
import 'package:status_downloader/links.dart';
import '../Common Widget/snackBar.dart';
// import 'package:share/share.dart';

class PhotoStatusController extends GetxController {
  List<String> photolist = [];
  String whatsappPath =
      '/storage/emulated/0/Android/media/com.whatsapp/WhatsApp/Media/.Statuses/.';
  String businessWhatsappPath =
      '/storage/emulated/0/Android/media/com.whatsapp.w4b/WhatsApp Business/Media/.Statuses/.';
  String whatsappPath2 = 'storage/emulated/0/whatsApp/Media/.Statuses/.';
  String businessWhatsappPath2 =
      'storage/emulated/0/whatsApp Business/Media/.Statuses/.';

  getallPhoto(String path) {
    photolist.clear();
    photolist.add('images/status1.jpg');
    photolist.add('images/status2.jpg');
    photolist.add('images/status3.jpg');
    photolist.add('images/status4.jpg');
    photolist.add('images/status5.jpg');
    print(photolist.length);
    update();
  }

  void requestStoragePermission() async {
    Map<Permission, PermissionStatus> result = await [
      Permission.storage,
      Permission.manageExternalStorage,
    ].request();

    //if permission is granted only then show home screen else permission error screen is already shown
    if (result[Permission.storage] == PermissionStatus.granted &&
        result[Permission.manageExternalStorage] == PermissionStatus.granted) {
      print('All Permission');
    } else {
      print('Not All Permission');
    }
  }

  getPhotoStatus(String waType) async {
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
          photolist = directory
              .listSync()
              .map((item) => item.path)
              .where((item) => item.endsWith(".jpg"))
              .toList(growable: false);
          print('Photo Length Path1 ${photolist.length}');
          update();
        } else {
          photolist = directory2
              .listSync()
              .map((item) => item.path)
              .where((item) => item.endsWith(".jpg"))
              .toList(growable: false);
          print('Photo Length Path 2 ${photolist.length}');
          update();
        }
      }
      if (waType == 'business whatsapp') {
        final Directory directory = Directory(businessWhatsappPath);
        final Directory directory2 = Directory(businessWhatsappPath2);
        if (directory.existsSync()) {
          photolist = directory
              .listSync()
              .map((item) => item.path)
              .where((item) => item.endsWith(".jpg"))
              .toList(growable: false);
          print('Photo Length ${photolist.length}');
          update();
        } else {
          photolist = directory2
              .listSync()
              .map((item) => item.path)
              .where((item) => item.endsWith(".jpg"))
              .toList(growable: false);
          print('Photo Length ${photolist.length}');
          update();
        }
      }
    }
    update();
  }

  downloadImage(String imagepath) async {
    var res = await ImageGallerySaver.saveFile(imagepath).then((value) {
      customSnackBar('Image Saved Successfully');
    });
  }

  shareImage(String path) async {
    print('Sharing image');
    await Share.shareFiles([path], text: 'Checking');
  }
}
