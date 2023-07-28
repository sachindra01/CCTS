import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/data/json_asset/app_data.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_button.dart';
import 'package:ccts/src/presentation/web_ui/view/profile/edit_profile_web.dart';
import 'package:ccts/src/presentation/web_ui/widgets/blog_tile_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileWeb extends StatefulWidget {
  const ProfileWeb({super.key});

  @override
  State<ProfileWeb> createState() => _ProfileWebState();
}

class _ProfileWebState extends State<ProfileWeb> {
  bool blogViewAll = false;
  bool viewAll = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold( 
      backgroundColor: Colors.white.withOpacity(0.4),
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0.5,
        iconTheme: const IconThemeData(color: black),
        title: Row(
          children: [
            Image.asset(
              'assets/img/logo.png',
              width: 18,
              height: 14,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 4,),
            Text("CCTS", style: roboto(black, 22, 0.0, FontWeight.w900),),
          ],
        ),
        actions: [
          Row(
            children: [
              Text("Free Test", style: roboto(appbarWebFontColor, 16.0, 0.0),),
              SizedBox(width: 7.w,),
              Text("Catalog", style: roboto(appbarWebFontColor, 16.0, 0.0),),
              SizedBox(width: 7.w,),
              Text("Help", style: roboto(appbarWebFontColor, 16.0, 0.0),),
              SizedBox(width: 8.w,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.0),
                  border: Border.all(color: violet,)
                ),
                child: Text("Profile", style: roboto(violet, 16.0, 0.0),)),
              SizedBox(width: 16.w,)
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            profile(),
            screenWidth > 666 ?
            IntrinsicHeight(
              child: Row(
                children: [
                  SizedBox(
                    width: 130.w,
                    child: aboutUsxblogs(screenWidth),
                  ),
                  VerticalDivider(
                    color: lightGrey.withOpacity(0.5),
                    thickness: 1.5,
                    width: 4.w,
                  ),
                  SizedBox(
                    width: 220.w,
                    child: showCase(screenWidth),
                  )
                ],
              ),
            )
            :
            Column(
              children: [
                aboutUsxblogs(screenWidth),
                showCase(screenWidth),
              ],
            )
          ], 
        ),
      ),
    );
  }

  profile(){
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient:
        LinearGradient(colors:
          [Color.fromARGB(255, 88, 156, 211),Color.fromARGB(95, 214, 185, 131), ]),
      ),
      child: Padding( 
        padding: EdgeInsets.symmetric(horizontal : 20.w, vertical: 40.0.h),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100.r),
              child: Image.network(
                "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=600",
                width: 148,
                height: 148,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 175.w,
                      child: Row(
                        children: [
                          Flexible(child: Text("Rilon Maharjan",style: roboto(white,36.0,0.0, FontWeight.w700,))),
                          const SizedBox(width: 6.0,),
                          Image.asset(
                            'assets/img/approval.png',
                            height: 22.h,
                            width: 22.h,
                          ),
                        ],
                      )
                    ),
                  ],
                ),
                SizedBox(height: 6.h,),
                SizedBox(
                  width: 170.w,
                  child: Flexible(child: Text('Architect',style: roboto(white,18.0,0.0),))
                ),
                SizedBox(height: 6.h,),
                SizedBox(
                  width: 170.w,
                  child: Flexible(child: Text('Consultant, Designer',style:roboto(white,18.0,0.0),))
                ),
                SizedBox(height: 6.h,),
                SizedBox(
                  width: 170.w,
                  child: Flexible(child: Text('Kathmandu, Nepal',style:roboto(white,18.0,0.0),))
                ),
                SizedBox(height: 12.h,),
                CustomButton(
                  height: 30,
                  width: 100,
                  text: "Edit Profile", 
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfilePageWeb() ));
                  }, 
                  buttonBgColor: white, 
                  textStyle: roboto(grey, 14, 0.0,),
                  buttonRadius: 4.r, 
                  fontColor: black,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  aboutUsxblogs(screenWidth){
    return Padding(
      padding: EdgeInsets.only(left: 10.w, top: 30, right: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //aboutus
          Text('ABOUT ME',style:roboto(black,16.0,0.0) ,),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Architecture portfolios are often lacking in color, with minimal neutral tones favoured instead. This portfolio design shows how colour can give life to illustrated visuals. Paired with minimally-presented plans and diagrams, it’s the perfect balancing act",
            style: roboto(greytextColor, 16, 0.2),
            textAlign: TextAlign.justify, 
          ),
          const SizedBox(
            height: 30,
          ),
          //blogsection
          Center(
            child: Text("Latest Blogs".toUpperCase(), style: roboto(black, 16.0, 0.0),),
          ),
          const SizedBox(
            height: 20.0,
          ),
          screenWidth > 666 ?
          SizedBox(
            height: 395,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 3.0.w),
              itemCount: blogViewAll ? blog.length : 4,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return BlogTileWeb(
                  blogStatus: blog[index]["blogStatus"] ?? "",
                  blogInfo: blog[index]["blogInfo"] ?? "",
                  blogTitle: blog[index]["blogTitle"] ?? "",
                  profileStatus: blog[index]["profileStatus"] ?? "",
                  profileImageUrl: blog[index]["profileImageUrl"] ?? "",
                  imageUrl: blog[index]["imageUrl"] ?? "",
                  onTap: (){

                  },
                );
              }
            ),
          )
          :
          ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 3.0.w),
            itemCount: blogViewAll ? blog.length : 4,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return BlogTileWeb(
                blogStatus: blog[index]["blogStatus"] ?? "",
                blogInfo: blog[index]["blogInfo"] ?? "",
                blogTitle: blog[index]["blogTitle"] ?? "",
                profileStatus: blog[index]["profileStatus"] ?? "",
                profileImageUrl: blog[index]["profileImageUrl"] ?? "",
                imageUrl: blog[index]["imageUrl"] ?? "",
                onTap: (){

                },
              );
            }
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0.w),
            child: SizedBox(
              height: 40.0,
              child: CustomButton(
                onPressed: (){
                  setState(() {
                    blogViewAll = !blogViewAll;
                  });
                }, 
                text: blogViewAll == false ? "View All" : "View Less", 
                buttonBgColor: violet, 
                fontColor: white,
                textStyle: roboto(white, 20.0, 0.0, FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  showCase(screenWidth){
    return Padding(
      padding: EdgeInsets.only(left: 10.w, top: 30, right: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('WORK SHOWCASE',style:roboto(black,16.0,0.0) ,),
          const SizedBox(
            height: 15,
          ),
          screenWidth > 666 ?
          SizedBox(
            height: 545,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 2.0.w),
              itemCount: viewAll ? blog.length : 5,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical : 10.0, horizontal: 2.0.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      "https://images.pexels.com/photos/2064693/pexels-photo-2064693.jpeg?auto=compress&cs=tinysrgb&w=600",
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }
            ),
          )
          :
          ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 2.0.w),
            itemCount: viewAll ? blog.length : 5,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical : 10.0, horizontal: 2.0.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Image.network(
                    "https://images.pexels.com/photos/2064693/pexels-photo-2064693.jpeg?auto=compress&cs=tinysrgb&w=600",
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal : 20.0.w),
            child: SizedBox(
              height: 40.0,
              child: CustomButton(
                onPressed: (){
                  setState(() {
                    viewAll = !viewAll;
                  });
                }, 
                text: viewAll == false ? "View All" : "View Less", 
                buttonBgColor: red, 
                fontColor: white,
                textStyle: roboto(white, 20.0, 0.0, FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}