import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:status_downloader/Backend/gallery_controller.dart';
import 'package:status_downloader/Backend/movement_controller.dart';
import 'package:status_downloader/Common%20Widget/color_const.dart';
import 'package:status_downloader/Common%20Widget/custom_dialogue.dart';
import 'package:status_downloader/links.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../utils/video_play.dart';
class GalleryView extends StatefulWidget {
  GalleryView({Key? key}) : super(key: key);

  @override
  State<GalleryView> createState() => _GalleryViewState();
}


class _GalleryViewState extends State<GalleryView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   Get.find<GalleryController>().intializeVideos();
  }
  @override
  void dispose() {
    Get.find<GalleryController>().refresh();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    Get.find<GalleryController>().getAllSavedImages();
    Get.find<GalleryController>().getAllSavedVideo();
    Get.find<GalleryController>().intializeVideos();
    return GetBuilder<MovementController>(
        init: MovementController(),
        builder: (outerCtrl) {
          return GetBuilder<GalleryController>(
              init: GalleryController(),
              builder: (innerCtrl) {
                if (outerCtrl.type == 'photo') {
                  if(innerCtrl.photolist.length<1){
                    return Center(
                      child: CircularProgressIndicator(
                        color: secondaryColor,
                      ),
                    );
                  }
                  return Container(
                    height: Get.height,
                    width: Get.width,
                    color: primaryColor,
                    child: GridView.builder(
                      itemCount: innerCtrl.photolist.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (ctx, index) {
                        return GestureDetector(
                          onTap: () {
                            customPopup(context, innerCtrl.photolist[index]);
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              image: DecorationImage(
                                image:
                                    FileImage(File(innerCtrl.photolist[index])),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  if(innerCtrl.controllerList.length<1){
                    return Center(
                      child: CircularProgressIndicator(
                        color: secondaryColor,
                      ),
                    );
                  }
                  return Container(
                    height: Get.height,
                    width: Get.width,
                    color: primaryColor,
                    child: GridView.builder(
                      itemCount: innerCtrl.videoList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (ctx, index)  {
                        return GestureDetector(
                          onTap: () {
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              // image: DecorationImage(
                              //   image:
                              //   FileImage(thumbnail!),
                              //   fit: BoxFit.fill,
                              // ),
                            ),
                            child: InkWell(
                                onTap: (){
                                  customVideoPopup(context,innerCtrl.controllerList[index]);
                                },
                                child: VideoPlayer(innerCtrl.controllerList[index])),
                          ),
                        );
                      },
                    ),
                  );
                }
              });
        });
  }

  customVideoPopup(
      BuildContext context,VideoPlayerController ctrl) {
    ctrl.play();
    return showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Center(
            child: Container(
                width: Get.width - 20,
                height: MediaQuery.of(context).size.height - 100,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: secondaryColor, borderRadius: BorderRadius.circular(12)),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    // image: DecorationImage(
                    //   image: FileImage(File(path)),
                    //   fit: BoxFit.fill,
                    // ),
                  ),
                  child: Stack(
                    children: [
                      GestureDetector(
                          onTap: (){
                            if(ctrl.value.isPlaying){
                              ctrl.pause();
                            }else {
                              ctrl.play();
                            }
                          },
                          child: VideoPlayer(ctrl)
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child:GestureDetector(
                          onTap: (){
                            ctrl.pause();
                            Get.back();
                          },
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: secondaryColor,
                            child: Icon(
                              Icons.close,
                              size: 20,
                              color: primaryColor,
                            ),
                          ),
                        ),),
                    ],
                  ),
                )
            ),
          );
        });
  }
}




