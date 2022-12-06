import 'package:status_downloader/links.dart';

movingWithFadein(Widget screen) {
  Get.to(
    screen,
    transition: Transition.fadeIn,
    duration: const Duration(seconds: 2),
  );
}


movingLeftToRight(Widget screen) {
  Get.to(
    screen,
    transition: Transition.leftToRight,
    duration: const Duration(seconds: 1),
  );
}



movingRightToLeft(Widget screen) {
  Get.to(
    screen,
    transition: Transition.rightToLeft,
    duration: const Duration(seconds: 1),
  );
}

movingTopToBottom(Widget screen) {
  Get.to(
    screen,
    transition: Transition.upToDown,
    duration: const Duration(seconds: 1),
  );
}

