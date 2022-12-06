import 'package:status_downloader/Backend/video_controller.dart';
import 'package:status_downloader/links.dart';


class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () {  
            Get.find<VideoStatusController>().getVideoStatus('whatsapp');
          },
          color: Colors.red,
          child: Text('Click'),
        ),
      ),
    );
  }
}
