import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/data/json_asset/app_data.dart';
import 'package:ccts/src/presentation/web_ui/view/dashboard_web/dashboard_page.dart';
import 'package:ccts/src/presentation/web_ui/view/home/widget/project_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageWeb extends StatefulWidget {
  const HomePageWeb({super.key});

  @override
  State<HomePageWeb> createState() => _HomePageWebState();
}

class _HomePageWebState extends State<HomePageWeb> {
  @override
  Widget build(BuildContext context) {
    return DashboardPage(
      route: 'homePage',
      body: Padding(
        padding: const EdgeInsets.only(left: 78),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 43.h,
              width: 393.w,
              child: Text('Welcome User Name.',style: roboto(black, 36, 0.0,FontWeight.w700),),
            ),
             SizedBox(
              height: 40.h,
            ),
            Row(
              children: [
                Container(
                  width: 80.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: greytextColor
                    ),
                    borderRadius: BorderRadius.circular(12.0.r),
                  ),
                  child: InkWell(
                    onTap: (){
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Add Project',
                          style: roboto(black, .0, 0.0,FontWeight.w700),
                        ),
                        const Icon(Icons.add)
                      ],
                    ),
                  ),
                ),
                const SizedBox()
              ],
            ),
            SizedBox(
              height: 100.h,
            ),
            Row(
              children: [
                SizedBox(
                  child: Text('Recent Projects',style: roboto(black, 25, 0.0,FontWeight.w700),),
                ),
                const SizedBox(),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            ListView.builder(
                  padding: EdgeInsets.only(left: 1.8.w, right: 0.0),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Wrap(
                      children: List.generate(category.length, (index) => 
                       const ProjectTile()
                      ),
                    );
                  }
                ),
          ],

        ),
      ),
    );
  }
}