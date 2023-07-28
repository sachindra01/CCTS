import 'package:ccts/src/presentation/web_ui/view/dashboard_web/src/admin_scaffold.dart';
import 'package:ccts/src/config/style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardPage extends StatelessWidget {
    DashboardPage({
    Key? key,
    required this.route,
    required this.body,
  }) : super(key: key);

  final Widget body;
  final String route;

  final List<AdminMenuItem> _sideBarItems = [
    const AdminMenuItem(
      title: 'Home',
      route: 'homePage',
      icon:  Icon(Icons.home,)
    ),
    const AdminMenuItem(
      title: 'Labor Cost',
      route: 'samplePage',
     icon:  Icon(Icons.work)
    ),
    const AdminMenuItem(
      title: 'Material Cost',
      route: 'materialPage',
     icon:  Icon(Icons.price_change)
    ),
    const AdminMenuItem(
      title: 'Earth Work',
      route: 'earthWorkPage',
     icon:  Icon(Icons.price_change)
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 10.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/logo.png',
            ),
            SizedBox(width: 3.0.w,),
            Text("CCTS",style: roboto(blackColor, 40.0, 0.0),),
          ],
        ),
        backgroundColor: appBarColor,
        actions: [
          PopupMenuButton<AdminMenuItem>(
            child: const Icon(Icons.account_circle,color: black,),
            itemBuilder: (context) {
              return _sideBarItems.map((AdminMenuItem item) {
                return PopupMenuItem<AdminMenuItem>(
                  value: item,
                  child: Row(
                    children: [
                      item.icon!,
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList();
            },
            onSelected: (item) {
              if (kDebugMode) {
                print(
                  'actions: onSelected(): title = ${item.title}, route = ${item.route}');
              }
              Navigator.of(context).pushNamed(item.route!);
            },
          ),
        ],
      ),
      sideBar: SideBar(
        backgroundColor: lightGrey.withOpacity(0.15),
        activeBackgroundColor: violet,
        borderColor: Colors.transparent,
        iconColor: Colors.black87,
        activeIconColor: Colors.white,
        textStyle: const TextStyle(
          color: black,
          fontSize: 13,
        ),
        activeTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 13,
        ),
        items: _sideBarItems,
        selectedRoute: route,
        onSelected: (item) {
          if (kDebugMode) {
            print(
              'sideBar: onTap(): title = ${item.title}, route = ${item.route}');
          }
          if (item.route != null && item.route != route) {
            Navigator.of(context).pushNamed(item.route!);
          }
        },
        // header: Container(
        //   height: 50,
        //   width: double.infinity,
        //   color: const Color(0xff444444),
        //   child: const Center(
        //     child: Text(
        //       'header',
        //       style: TextStyle(
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
        // ),
        // footer: Container(
        //   height: 50,
        //   width: double.infinity,
        //   color: const Color(0xff444444),
        //   child: const Center(
        //     child: Text(
        //       'footer',
        //       style: TextStyle(
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
        // ),
      ),
      body: SingleChildScrollView(
        child: body,
      ),
    );
  }
}