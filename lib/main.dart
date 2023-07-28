import 'package:ccts/src/presentation/mobile_ui/view/home/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 780),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'CCTS',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // home: kIsWeb ? const LoginWebPage() : const LoginAndRegister(),
          home: const SplashScreen(),
        );
      }
    );
  }
}


