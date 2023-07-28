import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/data/json_asset/app_data.dart';
import 'package:ccts/src/presentation/mobile_ui/view/project_page/add_project.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectsListPage extends StatefulWidget {
  const ProjectsListPage({super.key});

  @override
  State<ProjectsListPage> createState() => _ProjectsListPageState();
}

class _ProjectsListPageState extends State<ProjectsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBg, 
      appBar: customAppBar(context, "Projects"),
      body: SafeArea(
        child: Padding(padding: EdgeInsets.symmetric(vertical:14.h, horizontal: 8.w),
          child: ListView.builder(
            itemCount: projects.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: ((context, index) {
              // return Container();
              return GestureDetector(
                onLongPress: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => 
                      AddProject(
                        buildingDesignUrl:projects[index]["buildingImg"].toString() ,
                        clientEmail: projects[index]["clientEmail"].toString(),
                        clientName: projects[index]["clientName"].toString(),
                        clientPhone: projects[index]["clientPhone"].toString(),
                        larpurjaUrl: projects[index]["lalpurjaImg"].toString(),
                        address: projects[index]["address"].toString(),
                        projectTitle: projects[index]["projectTitle"].toString(),
                        totalBuildingArea: projects[index]["totalBuildingArea"].toString(),
                        totalEstBudget: projects[index]["totalEstBudget"].toString(),
                        totalSiteArea: projects[index]["totalSiteArea"].toString(),
                        district:projects[index]["district"].toString() ,
                        update: true,
                      ),
                    )
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(bottom:6.0.h),
                  child: ExpansionTile(
                    collapsedBackgroundColor: const Color.fromARGB(103, 240, 236, 255),
                    backgroundColor: const Color.fromARGB(255, 245, 245, 245),
                    tilePadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    title: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width/2.1,
                              child: Row(
                                children: [
                                  Icon(Icons.work_outline, size: 16, color: grey.withOpacity(0.8),),
                                  const SizedBox(width: 6.0,),
                                  Text(
                                    projects[index]["projectTitle"].toString(), 
                                    style: roboto(black, 15, 0.0, FontWeight.bold),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.h,),
                            Row(
                              children: [
                                Icon(Icons.person_outline, size: 16, color: grey.withOpacity(0.8),),
                                SizedBox(width: 6.0.w,),
                                Text(
                                  projects[index]["clientName"].toString(),
                                  style: roboto(const Color.fromARGB(255, 66, 66, 66), 13, 0.0, FontWeight.w600),
                                ),
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 4.0.h),
                          width: 85.w,
                          decoration: BoxDecoration(
                            color: violet.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(100.r)
                          ),
                          child: Center(
                            child: Text(
                              projects[index]["district"].toString(),
                              style: roboto(white, 13, 0.0, FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left:10.0.w, bottom: 12.0.h, right: 10.0.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                            alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.place_outlined, size: 16, color: grey.withOpacity(0.8),),
                                      SizedBox(width: 6.0.w,),
                                      Text(
                                        projects[index]["address"].toString(),
                                        style: roboto(const Color.fromARGB(255, 66, 66, 66), 12, 0.0, FontWeight.w600),
                                      ),
                                      Text(
                                        projects[index]["address"].toString()
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 10.0.h,),
                                  Row(
                                    children: [
                                      Icon(Icons.email_outlined, size: 16, color: grey.withOpacity(0.8),),
                                      SizedBox(width: 6.0.w,),
                                      Text(
                                        projects[index]["clientEmail"].toString(),
                                        style: roboto(const Color.fromARGB(255, 100, 100, 100), 12, 0.0, FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.0.h,),
                                  Row(
                                    children: [
                                      Icon(Icons.phone_android_outlined, size: 16, color: grey.withOpacity(0.8),),
                                      SizedBox(width: 6.0.w,),
                                      Text(
                                        projects[index]["clientPhone"].toString(),
                                        style: roboto(const Color.fromARGB(255, 100, 100, 100), 12, 0.0, FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.0.h,),
                                  Row(
                                    children: [
                                      Icon(Icons.area_chart_outlined, size: 16, color: grey.withOpacity(0.8),),
                                      SizedBox(width: 6.0.w,),
                                      Text(
                                        "${projects[index]["totalSiteArea"].toString()} (Total Site Area)",
                                        style: roboto(const Color.fromARGB(255, 100, 100, 100), 12, 0.0, FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.0.h,),
                                  Row(
                                    children: [
                                      Icon(Icons.house_outlined, size: 16, color: grey.withOpacity(0.8),),
                                      SizedBox(width: 6.0.w,),
                                      Text(
                                        "${projects[index]["totalBuildingArea"].toString()} (Total Building Area)",
                                        style: roboto(const Color.fromARGB(255, 100, 100, 100), 12, 0.0, FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.0.h,),
                                  Row(
                                    children: [
                                      Icon(Icons.money_outlined, size: 16, color: grey.withOpacity(0.8),),
                                      SizedBox(width: 6.0.w,),
                                      Text(
                                        projects[index]["totalEstBudget"].toString(),
                                        style: roboto(const Color.fromARGB(255, 100, 100, 100), 12, 0.0, FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.0.h,),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 60.h,
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(4.r),
                                    child:Image.network(
                                      projects[index]["lalpurjaImg"].toString(),
                                      height: 50.h, 
                                      width: 50.h, 
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 15.0.w,),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(4.r),
                                    child:Image.network(
                                      projects[index]["buildingImg"].toString(),
                                      height: 50.h, 
                                      width: 50.h, 
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 15.0.w,),
                                  GestureDetector(
                                    onTap: (){},
                                    child: const Text("View More")
                                  ),
                                ],
                              )
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            })
          ),
        ),
      ),
    );
  }
}