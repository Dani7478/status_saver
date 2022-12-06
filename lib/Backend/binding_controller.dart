import 'package:status_downloader/Backend/gallery_controller.dart';
import 'package:status_downloader/Backend/movement_controller.dart';
import 'package:status_downloader/Backend/photo_controller.dart';
import 'package:status_downloader/Backend/splash_controller.dart';
import 'package:status_downloader/Backend/video_controller.dart';
import 'package:status_downloader/links.dart';


class StoreBinding  implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
   Get.lazyPut(() => SplashController());
   Get.lazyPut(() => MovementController());
   Get.lazyPut(() => PhotoStatusController());
   Get.lazyPut(() => GalleryController());
   Get.lazyPut(() => VideoStatusController());
  }

}