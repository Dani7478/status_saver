import 'package:status_downloader/Screens/splash_screen.dart';
import 'Backend/binding_controller.dart';
import 'Screens/test.dart';
import 'links.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Status Downloader',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: StoreBinding(),
      home: Container(
        child: SplashScreen(),
      ),
    );
  }
}
