
import 'package:ccts/src/common/read_write.dart';
import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/presentation/mobile_ui/view/auth_screens/login_and_register.dart';
import 'package:ccts/src/presentation/mobile_ui/view/converter/convert_page.dart';
import 'package:ccts/src/presentation/mobile_ui/view/cost_estimation/cost_estimation.dart';
import 'package:ccts/src/presentation/mobile_ui/view/project_page/projects_list.dart';
import 'package:ccts/src/presentation/mobile_ui/view/project_timeline/project_timeline.dart';
import 'package:ccts/src/presentation/mobile_ui/view/settings/settings_page.dart';
import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeDrawer extends StatefulWidget {
  final String ?userRole;
  const HomeDrawer({super.key, this.userRole});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
  
}

class _HomeDrawerState extends State<HomeDrawer> {
  
  final routeObserver = RouteObserver<PageRoute>();
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 270.w,
      child: ListView(
        children: [
          SizedBox(
            height: 200.h,
            child: DrawerHeader(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
              decoration: const BoxDecoration(
                gradient:LinearGradient(
                  colors: [Color.fromARGB(225, 216, 185, 128), Color.fromARGB(255, 84, 159, 221),],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 4.h,),
                  Row(
                    children: [
                      Image.asset(
                        'assets/img/logo.png',
                        width: 26.w,
                        height: 20.h,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 5.0.w,),
                      Text("CCTS", style: roboto(black, 24.0, 0.0, FontWeight.w800)),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100.0.r),
                        child: Image.network(
                          "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=600",
                          height: 48.h,
                          width: 48.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Welcome!", style:  roboto(white, 16, 0.0, FontWeight.w500)),
                          SizedBox(height: 4.h),
                          //User name
                          SizedBox(
                            width: 180.w,
                            child: Text("Rilon Maharjan".toUpperCase(),
                              style: roboto(white, 16, 0.0, FontWeight.w500)
                            ),
                          ),
                          //User email
                          SizedBox(height: 3.h),
                          SizedBox(
                            width: 180.w,
                            child: Text("rilon.maharjan@gmail.com", 
                              style: roboto(white, 12.9, 0.0, FontWeight.w300)
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ), 
          SizedBox(height: 10.h,),
          Column(
            children: [
              ListTile(
                leading: const Icon(Icons.task),
                title: const Text('Projects'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ProjectsListPage()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.money),
                title: const Text('Cost Estimation'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CostEstimation()));
                },
              ),
               ListTile(
                leading: const Icon(Icons.work_history),
                title: const Text('Project TimeLine'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ProjectTimeline()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.change_circle),
                title: const Text('Converter'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ConverterPage()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Settings()));
                },
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log Out'),
            onTap: () {
              remove("userId");
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginAndRegister()));
            },
          ),
        ],
      ),
    );
  }
}