import 'package:status_downloader/Backend/movement_controller.dart';
import 'package:status_downloader/Backend/video_controller.dart';
import 'package:status_downloader/links.dart';
import 'package:video_player/video_player.dart';
import '../Common Widget/color_const.dart';
import 'feet_item.dart';

class VideoWhatsAppBusinessScreen extends StatefulWidget {
  String type;
  VideoWhatsAppBusinessScreen({Key? key, required this.type}) : super(key: key);

  @override
  State<VideoWhatsAppBusinessScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoWhatsAppBusinessScreen> {
  int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateVideos();
  }
  updateVideos(){
    Get.find<VideoStatusController>().getVideoStatus('business whatsapp');
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoStatusController>(
      init: VideoStatusController(),
        builder: (controller){
          return Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: controller.videoList.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (ctx, index) {
                return Stack(
                  children: [
                    FeedItem(url: controller.videoList[index]),
                    Positioned(
                      bottom: 40,
                      right: 10,
                      child:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () async {
                              Get.find<VideoStatusController>().shareVideo(controller.videoList[index]);
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
                              Get.find<VideoStatusController>().downloadVideo(controller.videoList[index]);
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
                  ],
                );
              },
            ),
          );

        });
  }
}
