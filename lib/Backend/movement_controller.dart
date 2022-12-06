

import 'package:status_downloader/Backend/gallery_controller.dart';
import 'package:status_downloader/Backend/photo_controller.dart';
import 'package:status_downloader/Backend/video_controller.dart';
import 'package:status_downloader/links.dart';

class MovementController extends GetxController {
  int screenNo=0;
  String source='whatsapp';
  String type='photo';

  updateScreen(int index){
    this.screenNo=index;
    if(index==0){
      source='whatsapp';
      Get.find<GalleryController>().refresher();
      Get.find<PhotoStatusController>().getPhotoStatus('whatsapp');
      Get.find<VideoStatusController>().getVideoStatus('whatsapp');
    }
    if(index==1){
      source='gallery';
    }
    if(index==2){
      source='business whatsapp';
      Get.find<GalleryController>().refresher();
      Get.find<PhotoStatusController>().getPhotoStatus('business whatsapp');
      Get.find<VideoStatusController>().getVideoStatus('business whatsapp');
    }
    update();
    print('$source: $screenNo');
  }

  updateType(String type){
    this.type=type;
    Get.find<GalleryController>().refresher();
    update();
    print(this.type);
  }



}