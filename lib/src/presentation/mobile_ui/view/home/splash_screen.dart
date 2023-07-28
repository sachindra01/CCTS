import 'dart:async';
import 'package:ccts/src/common/read_write.dart';
import 'package:ccts/src/presentation/mobile_ui/view/home/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        if(read("userId") == null || read("userId") == ""){
          Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const HomePage(registerId: "1"))));
        } else {
          Navigator.of(context).push(MaterialPageRoute(builder: ((context) => HomePage(registerId: read("userId")))));
        }
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          width: MediaQuery.of(context).size.width * 0.75,
          child: Image.asset('assets/img/construction.png')
        )
      )
    );
  }
}