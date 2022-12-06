import 'dart:ui';
import 'dart:io';
import 'package:status_downloader/Backend/photo_controller.dart';
import 'package:status_downloader/Backend/video_controller.dart';
import 'package:status_downloader/Common%20Widget/color_const.dart';
import 'package:status_downloader/Common%20Widget/custom_dialogue.dart';
import 'package:status_downloader/links.dart';


class PhotoStatus extends StatelessWidget {
  String type;

  PhotoStatus({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<PhotoStatusController>().getPhotoStatus(type.toString());
    print(type);
    final photocontroller = PageController(initialPage: 0);
    return Container(
        height: Get.height,
        width: Get.width,
        child: GetBuilder<PhotoStatusController>(
          init: PhotoStatusController(),
          builder: (value) {
            return PageView(
              controller: photocontroller,
              scrollDirection: Axis.vertical,
              children: [
                for(int i = 0; i < value.photolist.length; i++)
                     showImage(value.photolist[i], context)
              ],
            );
          },
        )
    );
  }



  showImage(String imagepath, BuildContext context) {
    return GestureDetector(
      onTap: (){
        customPopup(context, imagepath);
      },
      child: Container(
          height: Get.height,
         decoration: BoxDecoration(
           color: Colors.black,
           image: DecorationImage(
             image: FileImage(File(imagepath)),
             filterQuality: FilterQuality.high,
           //  fit: BoxFit.fill,
           ),
         ),
          child: SavedButton(imagePath: imagepath),
      ),
    );
  }
}

class SavedButton extends StatelessWidget {
  String imagePath;

  SavedButton({Key? key, required this.imagePath
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 10, bottom: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () async {
                await Get.find<PhotoStatusController>().shareImage(imagePath);

              },
              child: CircleAvatar(
                radius: 25,
                backgroundColor: primaryColor,
                child: Icon(Icons.share, color: secondaryColor, size: 30,),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Get.find<PhotoStatusController>().downloadImage(imagePath);
              },
              child: CircleAvatar(
                radius: 30,
                backgroundColor: primaryColor,
                child: Icon(Icons.download, color: secondaryColor, size: 30,),
              ),
            )
          ],
        ),
      ),
    );
  }
}




