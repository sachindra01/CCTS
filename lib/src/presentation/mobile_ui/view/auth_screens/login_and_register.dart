import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/presentation/mobile_ui/view/auth_screens/login.dart';
import 'package:ccts/src/presentation/mobile_ui/view/auth_screens/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginAndRegister extends StatefulWidget {
  final String? userId;
  final int? indx;
  const LoginAndRegister({super.key, this.userId, this.indx});

  @override
  State<LoginAndRegister> createState() => _LoginAndRegisterState();
}

class _LoginAndRegisterState extends State<LoginAndRegister> with SingleTickerProviderStateMixin{
  late final TabController tabController;
  
  @override
  void initState() {
    tabController = TabController(length: 2,initialIndex:widget.indx??0, vsync: this);
    tabController.addListener(() { 
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Login And register Custom App Bar
          loginAppBar(),
          //Sign In With Socials
          signInWithSocials(),
          //Tab bar Views
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                Login(userId: widget.userId),
                const Register(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //Login App bar
  loginAppBar() {
    return Container(
          color: white,
          padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 32.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.h),
              //Screen Title
              Padding(
                padding: EdgeInsets.only(left: 12.w),
                child: Text(tabController.index == 0 ? "Login" : "Register", style: montserrat(darkBlack, 32.0, 0.0, FontWeight.w700),),
              ),
              SizedBox(height: 20.h),
              //Login And Register Tabs
              TabBar(
                controller: tabController,
                padding: EdgeInsets.zero,
                isScrollable: true,
                labelColor: black,
                labelStyle: roboto(black, 15.0, 0.0),
                unselectedLabelColor: lightGrey,
                unselectedLabelStyle: roboto(grey, 15.0, 0.0),
                indicatorColor: violet,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 2,
                tabs: const [
                  Tab(
                    text: "Sign In",
                  ),
                  Tab(
                    text: "Request Registration",
                  ),
                ],
              ),
            ],
          ),
        );
  }

  //Sign In with Socials
  Container signInWithSocials() {
    return Container(
            height: 50.h,
            // color: const Color.fromARGB(199, 233, 233, 233),
            color: const Color(0xfffafafa),
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("You can sign in with social", style: roboto(black, 12.0, 0.0),),
                SizedBox(width: 16.w,),
                //Facebook
                Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Image.asset(
                    'assets/img/facebook.png',
                    width: 30.w,
                    height: 30.h,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                //Google
                Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Image.asset(
                    'assets/img/vk.png',
                    width: 30.w,
                    height: 30.h,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                //VK
                Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Image.asset(
                    'assets/img/vk.png',
                    width: 30.w,
                    height: 30.h,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ],
            ),
          );
  }
}