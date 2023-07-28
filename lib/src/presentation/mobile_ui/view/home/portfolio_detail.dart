import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/data/json_asset/app_data.dart';
import 'package:ccts/src/data/json_asset/blog_data.dart';
import 'package:ccts/src/presentation/mobile_ui/view/add_post/post_details_page.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/blog_tile.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_appbar.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_button.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/work_showcase_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PortFolioDetail extends StatefulWidget {
  final String? imgUrl, name, descreption;
  final String userId;
  const PortFolioDetail({super.key, this.imgUrl, this.name, this.descreption, required this.userId});

  @override
  State<PortFolioDetail> createState() => _PortFolioDetailState();
}

class _PortFolioDetailState extends State<PortFolioDetail> {
  bool viewAll = false;
  bool blogViewAll = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Portfolio Detail"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //top profile section
            profileSection(),
            // description section
            addressSection(),
            //about me
            contentDescription(),
            //work showcase
            workShowcase(),
            //blog section
            blogsSection()
          ]    
        ),
      ),
    );
  }

  //profile section
  profileSection(){
    return Container(
      height: 287.h,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient:
        LinearGradient(colors:
          [Color.fromARGB(95, 214, 185, 131), Color.fromARGB(255, 88, 156, 211)]),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top:28.0.h ),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.r),
                child: Image.network(
                  widget.imgUrl ?? "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=600",
                  width: 144.h,
                  height: 144.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          Text('Architect',style: roboto(white,16.0,0.0),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img/approval.png',
                height: 20.h,
                width: 20.w,
              ),
              SizedBox(width: 5.0.w,),
              Text(widget.name ?? "Micheal Jckson",style: roboto(white,32.0,0.0, FontWeight.w700)),
            ],
          ),
          Text(widget.descreption ?? 'Consultant, Designer',style:roboto(white,16.0,0.0),),
        ],
      ),
    );
  }

  //address and meetup request
  addressSection(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1,color:lightGreyColor,),
            borderRadius: const BorderRadius.all(Radius.circular(2.0)
            ),
          ),
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width /2.1,
                height: 60.0.h,
                child: Center(child: Text('Kathamandu,Nepal',style:roboto(black, 14.0, 0) ,)),
              ),
              SizedBox(height: 60.h, child:  VerticalDivider(color:lightGreyColor, thickness: 1.2.sp,)),
              SizedBox(
                width: MediaQuery.of(context).size.width /2.1,
                height: 60.0.h,
                child: Center(child: Text('Request for Meetup',style:roboto(black, 14.0, 0) ,)),
              ),
            ],
          ),
        ), 
      ],
    );
  }

  //about me
  contentDescription(){
    return  Column(
      children: [
        SizedBox(
          height: 24.h,
        ),
        Text('ABOUT ME',style:roboto(black,16.0,0.0) ,),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              "Architecture portfolios are often lacking in color, with minimal neutral tones favoured instead. This portfolio design shows how colour can give life to illustrated visuals. Paired with minimally-presented plans and diagrams, it’s the perfect balancing act",
              style: roboto(greytextColor, 16, 0.2),
              textAlign: TextAlign.center, ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }

  //wors showchase
  workShowcase(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:8.0.w),
      child: Column(
        children: [
          Center(
            child: Text("Work Showcase".toUpperCase(), style: roboto(black, 16.0, 0.0),),
          ),
          SizedBox(
            height: 20.0.h,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: blogViewAll == false ? 4 : workShowcaseList.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
            List blogsImage = workShowcaseList[index]["blogImages"] as List;
            List commentsList = blogsList[index]["comments"] as List;
              return WorkShowcaseTile(
                hero: workShowcaseList[index]["userId"] as Object,
                workStatus: workShowcaseList[index]["blogStatus"].toString(),
                workInfo: workShowcaseList[index]["blogDescription"].toString(),
                workTitle: workShowcaseList[index]["blogTitle"].toString(),
                imageUrl: blogsImage[0],
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PostDetailsPage(
                    imgUrls: blogsImage,
                    cmntsList : commentsList,
                    registerUserId: widget.userId.toString(),
                    userId: workShowcaseList[index]["userId"].toString(),
                    name: widget.name.toString(),
                    createdAt: workShowcaseList[index]["createdAt"].toString(),
                    heroTag: workShowcaseList[index]["userId"] as Object,
                    blogDescription: workShowcaseList[index]["blogDescription"].toString(),
                    blogTitle: workShowcaseList[index]["blogTitle"].toString(),
                    userProfileUrl: widget.imgUrl.toString(),)
                    )
                  );
                },
              );
            }
          ),
          SizedBox(height: 19.0.h,),
          //View All Button
          SizedBox(
            height: 50.0.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal:14.0.w),
              child: CustomButton(
                onPressed: (){
                  setState(() {
                    viewAll = !viewAll;
                  });
                }, 
                text: viewAll == false ? "View All" : "View Less", 
                buttonBgColor: red, 
                fontColor: white,
                buttonRadius: 30.r,
                textStyle: roboto(white, 20.0, 0.0, FontWeight.w600),
              ),
            ),
          ),
          SizedBox(height: 20.h,),
        ],
      ),
    );
  }

  //Blog section
  blogsSection(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: Column(
        children: [
          SizedBox(
              height: 20.h,
            ),
          Center(
            child: Text("Latest Blogs".toUpperCase(), style: roboto(black, 16.0, 0.0),),
          ),
          SizedBox(
            height: 20.0.h,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: blogViewAll == false ? 4 : blogsList.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
            List blogsImage = blogsList[index]["blogImages"] as List;
            List commentsList = blogsList[index]["comments"] as List;
              return BlogTile(
                hero: blogsList[index]["userId"] as Object,
                blogStatus: blogsList[index]["blogStatus"].toString(),
                blogInfo: blogsList[index]["blogDescription"].toString(),
                blogTitle: blogsList[index]["blogTitle"].toString(),
                profileStatus: "",
                profileImageUrl: blogsList[index]["userProfileImgUrl"].toString(),
                imageUrl: blogsImage[0],
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PostDetailsPage(
                    imgUrls: blogsImage,
                    cmntsList : commentsList,
                    registerUserId: widget.userId.toString(),
                    userId: blogsList[index]["userId"].toString(),
                    name: blogsList[index]["userName"].toString(),
                    createdAt: blogsList[index]["createdAt"].toString(),
                    heroTag: blogsList[index]["userId"] as Object,
                    blogDescription: blogsList[index]["blogDescription"].toString(),
                    blogTitle: blogsList[index]["blogTitle"].toString(),
                    userProfileUrl: blogsList[index]["userProfileImgUrl"].toString(),)
                    )
                  );
                },
              );
            }
          ),
          SizedBox(height: 19.0.h,),
          //View All Button
          SizedBox(
            height: 50.0.h,
            child: CustomButton(
              onPressed: (){
                setState(() {
                  blogViewAll = !blogViewAll;
                });
              }, 
              text: blogViewAll ? "View Less" : "View All", 
              buttonBgColor: green, 
              fontColor: white,
              buttonRadius: 30.r,
              textStyle: roboto(white, 18.0, 0.0, FontWeight.w600),
            ),
          ),
          SizedBox(height: 20.h,),
        ],
      ),
    );
  } 
}