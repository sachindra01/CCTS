import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/presentation/web_ui/view/auth_screens/login_web.dart';
import 'package:ccts/src/presentation/web_ui/view/auth_screens/register_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginAndRegisterWeb extends StatefulWidget {
  const LoginAndRegisterWeb({super.key});

  @override
  State<LoginAndRegisterWeb> createState() => _LoginAndRegisterWebState();
}

class _LoginAndRegisterWebState extends State<LoginAndRegisterWeb> with SingleTickerProviderStateMixin{

  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
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
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: scaffoldBg,
        child: screenWidth < 1098 
        ?Center(
          child: Expanded(
            child: Container(
              width: 531.0,
              height: MediaQuery.of(context).size.height,
              color: white,
              padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 50),
              //Login Form Container
              child: Container(
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(5.r),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 206, 206, 206),
                      offset: const Offset(0, 5),
                      blurRadius: 5.r
                    )
                  ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Login and Register tab bar
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
                      child: loginTabBar(),
                    ),
                    //Sign In With Socials
                    signInWithSocials(),
                    //Tab bar Views
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 16, right: 16),
                            child: LoginWeb(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16, right: 16),
                            child: RegisterWeb(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ),
        )
        :Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width/1.62,
              height: MediaQuery.of(context).size.height,
              color: const Color(0xffD3E9F8),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    left: 50,
                    child: Image.asset(
                        'assets/img/construction.png', 
                        fit: BoxFit.cover,
                        height:500 ,
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 125,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Complete", style: roboto(black, 48, 0.0, FontWeight.w200),),
                        Text("Construction",style: roboto(black, 64, 0.0, FontWeight.w800),),
                        Text("Tracking System",style: roboto(black, 36, 0.0, FontWeight.w800),),
                      ],
                    ))
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: 531.0,
                height: MediaQuery.of(context).size.height,
                color: white,
                padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 50),
                //Login Form Container
                child: Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(5.r),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 206, 206, 206),
                        offset: const Offset(0, 5),
                        blurRadius: 5.r
                      )
                    ]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Login and Register tab bar
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
                        child: loginTabBar(),
                      ),
                      //Sign In With Socials
                      signInWithSocials(),
                      //Tab bar Views
                      Expanded(
                        child: TabBarView(
                          controller: tabController,
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 16, right: 16),
                              child: LoginWeb(),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 16, right: 16),
                              child: RegisterWeb(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }

  //Login Tab bar
  loginTabBar() {
    return Container(
      width: 460,
      color: white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Screen Title
          Padding(
            padding: EdgeInsets.only(left: 3.0.w),
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
      height: 40,
      // color: const Color.fromARGB(199, 233, 233, 233),
      color: const Color(0xfffafafa),
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("You can sign in with social", style: roboto(black, 12.0, 0.0),),
          SizedBox(width: 10.4.w),
          //Facebook
          Container(
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Image.asset(
              'assets/img/facebook.png',
              width: 28,
              height: 28,
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
              width: 28,
              height: 28,
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
              width: 28,
              height: 28,
              fit: BoxFit.scaleDown,
            ),
          ),
        ],
      ),
    );
  }
}