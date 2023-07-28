import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/data/json_asset/app_data.dart';
import 'package:ccts/src/data/json_asset/user_data.dart';
import 'package:ccts/src/presentation/mobile_ui/view/add_post/add_post_page.dart';
import 'package:ccts/src/presentation/mobile_ui/view/add_post/post_details_page.dart';
import 'package:ccts/src/presentation/mobile_ui/view/profile/edit_profile.dart';
import 'package:ccts/src/presentation/mobile_ui/view/settings/settings_page.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_appbar.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  final String? imgUrl, name, descreption;
  final String userId, registerUserId;
  const ProfilePage({super.key, this.imgUrl, this.name, this.descreption, required this.userId, required this.registerUserId});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin{
  bool viewAll = false;
  bool blogViewAll = false;
  late final TabController tabController;

  //User Data List
  List userInfoList = [];
  

  @override
  void initState() {
    getUserData();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() { 
      setState(() {});
    });
    super.initState();
  }

  //Get Currenet User Data
  getUserData(){
    for(var data in userData){
      if(data["userId"] == widget.userId){
        userInfoList.add(data);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        "Profile",
        widget.userId == cctsCurrentUserId
        ? GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Settings()));
          },
          child: const Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(Icons.settings, color: black, size: 26,),
          ),
        )
        : const SizedBox(),
      ),
      body: CustomScrollView(
        slivers: [
          //Top profile section
          profileSection(),
          SliverFillRemaining(
            child: SizedBox(
              child: TabBarView(
                controller: tabController,
                children: <Widget>[
                  // Content of tab 1
                  workShowCase(),
                  // Content of tab 2
                  aboutMe(),
                ],
              ),
            ),
          ),
        ]    
      ),
      floatingActionButton: widget.userId == cctsCurrentUserId 
      ?CustomButton(
        width: 120.w,
        buttonRadius: 50.r,
        buttonBgColor: violet,
        text: "+  New Posts",
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddPost() ));
        },
      )
      : const SizedBox()
    );
  }

  //Profile Section
  profileSection(){
    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      expandedHeight: MediaQuery.of(context).size.height * 0.34,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: constraints.maxHeight,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(225, 216, 185, 128), Color.fromARGB(255, 84, 159, 221)],
              ),
            ),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: constraints.maxHeight * 0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //Profile Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100.r),
                          child: InkWell(
                            onTap: (){},
                            child: Image.network(
                              userInfoList[0]["profileUrl"] ?? "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=600",
                              width: 80.h,
                              height: 80.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 22.w,),
                        //Post Folower and Flowwing
                        SizedBox(
                          width: 210.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //Posts
                              SizedBox(
                                width: 50.w,
                                child: Column(
                                  children: [
                                    Text(userInfoList[0]["posts"].length.toString(), style :roboto(white, 18, 0, FontWeight.w500)),
                                    Text("Posts", style: roboto(white, 12.5, 0),),
                                  ],
                                ),
                              ),
                              //Followers
                              SizedBox(
                                width: 70.w,
                                child: Column(
                                  children: [
                                    Text(userInfoList[0]["followers"] ?? "12.3K", style :roboto(white, 18, 0, FontWeight.w500)),
                                    Text("Followers", style: roboto(white, 12.5, 0),),
                                  ],
                                ),
                              ),
                              //Following
                              SizedBox(
                                width: 70.w,
                                child: Column(
                                  children: [
                                    Text(userInfoList[0]["following"] ?? "12.3K", style :roboto(white, 18, 0, FontWeight.w500)),
                                    Text("Following", style: roboto(white, 12.5, 0),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    //User Name
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(userInfoList[0]["userName"] ?? "12.3K" ?? "Anik Shakya",style: roboto(white, 15.0, 0.0, FontWeight.w500)),
                        ),
                        const SizedBox(width: 6.0,),
                        Image.asset(
                          'assets/img/approval.png',
                          height: 20.h,
                          width: 20.h,
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h,),
                    //User Info
                    SizedBox(
                      width: 400.w,
                      child: Text(userInfoList[0]["bio"] ?? "Articetch | Consultant | Designer Articetch", style: roboto(white, 13, 0.0), maxLines: 2,)
                    ),
                    SizedBox(height: 14.h,),
                    widget.userId == cctsCurrentUserId?
                    //Edit & Share Profile Buttron
                    Row(
                      children: [
                        //Edit Profile button
                        CustomButton(
                          height: 36.h,
                          width: 122.w,
                          text: "Edit Profile",
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage(
                              userName: userInfoList[0]["userName"].toString(),
                              email: userInfoList[0]["email"],
                              bio: userInfoList[0]["bio"],
                              phone: userInfoList[0]["phone"],
                              profileUrl: userInfoList[0]["profileUrl"],
                              userID: userInfoList[0]["userId"],
                            )));
                          },
                          textStyle: roboto(white, 12.0.sp, 0.2),
                          buttonBgColor: violet,
                          buttonRadius: 4.r,
                        ),
                        SizedBox(width: 18.w,),
                        //Share Profile Button
                        CustomButton(
                          height: 36.h,
                          width: 122.w,
                          text: "Share Profile", 
                          onPressed: (){},
                          textStyle: roboto(black, 12.0.sp, 0.2),
                          buttonBgColor: white,
                          buttonRadius: 4.r,
                        ),
                      ],
                    )
                    : //Follow
                    Row(
                      children: [
                        //Edit Profile button
                        CustomButton(
                          height: 30.h,
                          width: 122.w,
                          text: "Subscribe",
                          onPressed: (){},
                          textStyle: roboto(white, 12.0.sp, 0.2),
                          buttonBgColor: violet,
                          buttonRadius: 4.r,
                        ),
                        SizedBox(width: 18.w,),
                        //Share Profile Button
                        CustomButton(
                          height: 30.h,
                          width: 122.w,
                          text: "Message", 
                          onPressed: (){},
                          textStyle: roboto(black, 12.0.sp, 0.2),
                          buttonBgColor: white, 
                          fontColor: black,
                          buttonRadius: 4.r,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(-8),
        child: Container(
          color: appBarColor,
          child: TabBar(
            controller: tabController,
            isScrollable: false,
            labelColor: black,
            labelStyle: roboto(black, 14.0, 0.0),
            unselectedLabelColor: lightGrey,
            unselectedLabelStyle: roboto(grey, 14.0, 0.0),
            indicatorColor: violet,
            indicatorWeight: 1.5,
            tabs: const [
              Tab(text: 'Work Showcase'),
              Tab(text: 'About Me'),
            ],
          ),
        ),
      ),
    );
  }

  //About me
  aboutMe(){
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        "Architecture portfolios are often lacking in color, with minimal neutral tones favoured instead. This portfolio design shows how colour can give life to illustrated visuals. Paired with minimally-presented plans and diagrams, it’s the perfect balancing act",
        style: roboto(greytextColor, 16, 0.2),
        textAlign: TextAlign.center, ),
    );
  }

  //Work Show Case
  workShowCase(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: userInfoList[0]["posts"].length,
        padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.w),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 2.h,
          crossAxisSpacing: 2.w,
        ),
        itemBuilder: (BuildContext context, int index) {
          List userPosts = userInfoList[0]["posts"];
          List postImages = userPosts[index]["blogImages"] as List;
          List commentsList = userPosts[index]["comments"] as List;
          return InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PostDetailsPage(
                imgUrls: postImages,
                registerUserId: widget.registerUserId,
                userId: userPosts[index]["userId"].toString(),
                cmntsList : commentsList,
                name: userPosts[index]["userName"].toString(),
                createdAt: userPosts[index]["createdAt"].toString(),
                heroTag: (userPosts[index]["userId"]+ userPosts[index]["blogId"]) as Object,
                blogDescription: userPosts[index]["blogDescription"].toString(),
                blogTitle: userPosts[index]["blogTitle"].toString(),
                userProfileUrl: userPosts[0]["userProfileImgUrl"].toString(),)
                )
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: Image.network(
                postImages[0].toString(), 
                height: 65.h,
                width: 65.h,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailSliverDelegate extends SliverPersistentHeaderDelegate{
  final double expandedHeight;
  DetailSliverDelegate(this.expandedHeight);

  @override
  double get maxExtent => expandedHeight;
  
  @override
  double get minExtent => 0;
  
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    throw UnimplementedError();
  }
  
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    throw UnimplementedError();
  }
}