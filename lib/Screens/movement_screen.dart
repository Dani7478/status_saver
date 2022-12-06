import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:status_downloader/Backend/movement_controller.dart';
import 'package:status_downloader/Backend/photo_controller.dart';
import 'package:status_downloader/Common%20Widget/color_const.dart';
import 'package:status_downloader/Screens/gallery_screen.dart';
import 'package:status_downloader/Screens/phot_staus.dart';
import 'package:status_downloader/Screens/video_status_wa.dart';
import 'package:status_downloader/Screens/video_status_wab.dart';
import 'package:status_downloader/links.dart';
import '../Common Widget/appbar_decoration.dart';

class MovementScreen extends StatelessWidget {
  const MovementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<MovementController>();

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(110.0),
          child: CustomAppBar(),
        ),
        body: Container(
          height: Get.height,
          width: Get.width,
          color: primaryColor,
          child: GetBuilder<MovementController>(
            init: MovementController(),
            builder: (value) {
              if (value.type == 'photo') {
                return value.screenNo == 0 || value.screenNo == 2
                    ? PhotoStatus(type: controller.source)
                    : GalleryView();
              }
              if (value.type == 'video') {
                return value.screenNo == 0
                    ? VideoWhatsAppScreen(type: controller.source)
                    : value.screenNo == 2
                        ? VideoWhatsAppBusinessScreen(type: controller.source)
                        : GalleryView();
              } else {
                return Container();
              }
            },
          ),
        ),
        bottomNavigationBar: CustomNavigation(),
      ),
    );
  }
}

class CustomNavigation extends StatelessWidget {
  const CustomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: primaryColor,
      color: secondaryColor,
      animationDuration: const Duration(milliseconds: 300),
      items: const [
        Icon(
          Icons.whatsapp,
          color: Colors.white,
          size: 30,
        ),
        Icon(
          Icons.photo_library_sharp,
          color: Colors.white,
          size: 30,
        ),
        Icon(
          Icons.business_rounded,
          color: Colors.white,
          size: 30,
        ),
      ],
      onTap: (value) {
        Get.find<MovementController>().updateScreen(value);
      },
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovementController>(
        init: MovementController(),
        builder: (value) {
          return Column(
            children: [
              AppBar(
                centerTitle: true,
                leading: Icon(
                  value.screenNo == 0
                      ? Icons.whatsapp
                      : value.screenNo == 1
                          ? Icons.photo_library_sharp
                          : Icons.business,
                  color: Colors.white,
                  size: 35,
                ),
                title: Text(
                  value.screenNo == 0
                      ? 'WhatsApp'
                      : value.screenNo == 1
                          ? 'Saved'
                          : 'Business WhatsApp',
                  style: GoogleFonts.josefinSans(
                      fontSize: 18,
                      color: Colors.white70,
                      fontWeight: FontWeight.w700),
                ),
                backgroundColor: secondaryColor,
                // shape: appBarDecoration,
                actions: [
                  PopupMenuButton<int>(
                    itemBuilder: (context) => [
                      // popupmenu item 1
                      PopupMenuItem(
                        value: 1,
                        // row has two child icon and text.
                        child: InkWell(
                          onTap: () {
                            Get.find<MovementController>().updateType('photo');
                          },
                          child: Row(
                            children: [
                              const Icon(Icons.photo_library_rounded),
                              const SizedBox(
                                // sized box with width 10
                                width: 10,
                              ),
                              Text(
                                'Photo',
                                style: GoogleFonts.josefinSans(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // popupmenu item 2
                      PopupMenuItem(
                        value: 2,
                        // row has two child icon and text.
                        child: InkWell(
                          onTap: () {
                            Get.find<MovementController>().updateType('video');
                          },
                          child: Row(
                            children: [
                              const Icon(Icons.video_collection_sharp),
                              const SizedBox(
                                // sized box with width 10
                                width: 10,
                              ),
                              Text(
                                'Video',
                                style: GoogleFonts.josefinSans(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // popupmenu item 2
                      PopupMenuItem(
                        value: 3,
                        // row has two child icon and text.
                        child: InkWell(
                          onTap: () {
                            //Get.find<MovementController>().updateType('rate');
                            showRate();
                          },
                          child: Row(
                            children: [
                              const Icon(Icons.settings),
                              const SizedBox(
                                // sized box with width 10
                                width: 10,
                              ),
                              Text(
                                'Rate Us',
                                style: GoogleFonts.josefinSans(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                    offset: const Offset(0, 50),
                    color: secondaryColor,
                    elevation: 2,
                  ),
                ],
              ),
              Expanded(
                  child: Container(
                width: Get.width,
                color: secondaryColor,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Expanded(
                      child: InkWell(
                    onTap: () {
                       Get.find<MovementController>().updateType('photo');
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          'Photos',
                          style: GoogleFonts.josefinSans(
                              fontSize:  Get.find<MovementController>().type=='photo'? 24 : 18,
                              color: Get.find<MovementController>().type=='photo' ? Colors.white : Colors.white ,
                              fontWeight: Get.find<MovementController>().type=='photo'? FontWeight.w800 : FontWeight.w500),
                        ),
                      ),
                    ),
                  )),
                  Expanded(
                      child: InkWell(
                        onTap: (){
                          Get.find<MovementController>().updateType('video');
                        },
                    child: Container(
                      child: Center(
                        child: Text(
                          'Videos',
                          style: GoogleFonts.josefinSans(
                              fontSize:  Get.find<MovementController>().type=='video'? 24 : 18,
                              color: Get.find<MovementController>().type=='video' ? Colors.white : Colors.white ,
                              fontWeight: Get.find<MovementController>().type=='video'? FontWeight.w800 : FontWeight.w500),
                        ),
                      ),
                    ),
                  ))
                ]),
              ))
            ],
          );
        });
  }

  showRate() {
    return Get.defaultDialog(
        backgroundColor: primaryColor,
        title: 'Please Rate Thi App',
        titleStyle: GoogleFonts.josefinSans(
            color: secondaryColor, fontWeight: FontWeight.w800, fontSize: 18),
        radius: 5,
        titlePadding: EdgeInsets.all(20),
        content: Column(
          children: [
            RatingBar.builder(
                initialRating: 3,
                maxRating: 5,
                itemCount: 5,
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return Icon(
                        Icons.sentiment_very_dissatisfied,
                        color: Colors.red,
                      );
                    case 1:
                      return Icon(
                        Icons.sentiment_dissatisfied,
                        color: Colors.redAccent,
                      );
                    case 2:
                      return Icon(
                        Icons.sentiment_neutral,
                        color: Colors.amber,
                      );
                    case 3:
                      return Icon(
                        Icons.sentiment_satisfied,
                        color: Colors.green,
                      );
                    case 4:
                      return Icon(
                        Icons.sentiment_very_satisfied,
                        color: Colors.green,
                      );
                  }
                  return Container();
                },
                onRatingUpdate: (rate) {
                  print(rate);
                })
          ],
        ));
  }
}
