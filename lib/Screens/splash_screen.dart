import 'package:status_downloader/Common%20Widget/color_const.dart';
import 'package:status_downloader/links.dart';

import '../Backend/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<SplashController>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: size.height*0.25,
              width: size.height*0.25,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/mainlogo.png'),
                    fit: BoxFit.fill
                ),
              ),
            ),
          ),
          const SizedBox(height: 5,),

          Text('Whatsapp',
            style: GoogleFonts.josefinSans(
                fontSize: 24,
                color: secondaryColor,
                fontWeight: FontWeight.w800
            ),
          ),
          const SizedBox(height: 5,),
          Text('Status Downloader',
            style: GoogleFonts.josefinSans(
                fontSize: 20,
                color: secondaryColor,
                fontWeight: FontWeight.w600
            ),
          ),
          const SizedBox(height: 20,),
          SizedBox(
            height: 25,
            width: 25,
            child: CircularProgressIndicator(
              color: secondaryColor,
            ),
          )
        ],
      ),
    );
  }
}
