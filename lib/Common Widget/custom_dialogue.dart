import 'dart:io';

import 'package:status_downloader/Common%20Widget/color_const.dart';
import 'package:status_downloader/links.dart';

customPopup(
    BuildContext context, String path) {
  return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Center(
          child: Container(
            width: Get.width - 20,
            height: MediaQuery.of(context).size.height - 100,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12)),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: FileImage(File(path)),
                  filterQuality: FilterQuality.high
                 // fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: secondaryColor,
                            child: Icon(
                              Icons.close,
                              size: 20,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            )
          ),
        );
      });
}
