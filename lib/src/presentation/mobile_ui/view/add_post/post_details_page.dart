import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/data/json_asset/user_data.dart';
import 'package:ccts/src/presentation/mobile_ui/view/auth_screens/login_and_register.dart';
import 'package:ccts/src/presentation/mobile_ui/view/profile/profile_page.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_dialog_box.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/image_widget.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostDetailsPage extends StatefulWidget {
  final String blogTitle, blogDescription, userProfileUrl, name, createdAt, registerUserId, userId;
  final List imgUrls, cmntsList;
  final Object heroTag;
  const PostDetailsPage(
    {super.key,
    required this.imgUrls, 
    required this.heroTag, 
    required this.blogTitle, 
    required this.blogDescription, required this.userProfileUrl, required this.name, required this.createdAt, required this.registerUserId, required this.cmntsList, required this.userId
    }
  );

  @override
  State<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage> with TickerProviderStateMixin{

  final double expandedHeight = 300.h;
  final double roundedContainerHeight = 50.h;
  final TextEditingController commentCon = TextEditingController();
  
  //for comment bottomsheet
  AnimationController ?animationController;

  //Options dropdown
  List options = ["Edit Post", "Something"]; 
  
  //like and unlike
  bool isliked = false;

    //User Data List
  List userInfoList = [];

  //list to add comments
  List addComments = [];

  final date = DateTime.now();

  //Get Currenet User Data
  getUserData(){
    for(var data in userData){
      if(data["userId"] == widget.registerUserId){
        userInfoList.add(data);
      }
    }
  }

  @override
  void initState() {
    getUserData();
    animationController = BottomSheet.createAnimationController(this);
    animationController!.duration = const Duration(milliseconds: 400);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBg,
      body: CustomScrollView(
        slivers: <Widget>[
          //App Bar
          sliverAppbar(),
          // header(),
          //Blog heading and Info
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only( left: 15.w, right: 15.w, bottom: 15.h, top: 10.h),
              child: Column(
                children: [
                  blogHeadingsAndInfo(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //Appbar
  sliverAppbar(){
    return SliverAppBar(
      backgroundColor: appBarColor,
      expandedHeight: expandedHeight,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark
      ),
      actions: [
        InkWell(
          onTap: (){
            DropdownButton(
              icon: const Icon(Icons.keyboard_arrow_down),
              borderRadius: BorderRadius.circular(0.0),
              items: options.map<DropdownMenuItem<String>>((val) {
                return DropdownMenuItem<String>(
                  value: val,
                  child: Text(val)
                );
              }).toList(), 
              onChanged: (newVal) {
              },
            );
          },
          child: Container(
            // height: 40.h,
            width: 30.h,
            decoration: BoxDecoration(
              color: black.withOpacity(0.27),
              borderRadius: BorderRadius.circular(4.r)
            ),
            margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 8.5.h),
            child: const Icon(Icons.menu),
          ),
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: widget.heroTag,
          child: ImageSlider(imageUrlList: widget.imgUrls)
        ),
      ),
    );
  }

  //BlogHeadings
  blogHeadingsAndInfo(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        //User Info
        GestureDetector(
          onTap: (){},
          child: InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
              ProfilePage(
                userId: widget.userId,
                registerUserId: widget.registerUserId,
              )));
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Profile Image
                Container(
                  height: 30.0.h,
                  width: 30.0.h,
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(50.r),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        widget.userProfileUrl,
                      ),
                    )
                  ),
                  //Profile status indicator
                  child: Container(
                    height: 8.0.h,
                    width: 8.0.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 1.6,
                      ),
                      borderRadius: BorderRadius.circular(100.0.r),
                      color: green,
                    ),
                  )
                ),
                SizedBox(width: 13.w,),
                //Username
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200.w,
                      child: Text(widget.name, 
                        style: roboto(grey, 13.5, 0.0, FontWeight.w600),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 2.h,),
                    SizedBox(
                      width: 200.w,
                      child: Text(widget.createdAt,
                        style: roboto(grey, 10.0, 0.0),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: (){
                    userInfoList[0]["isRegistered"] == true ? 
                      setState(() {
                        isliked =! isliked;
                      })
                    : showDialog(context: context, builder: (BuildContext context) =>  
                      CustomDialog(
                        onOkpressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const LoginAndRegister(indx: 1,))));
                        },
                      )
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0.r),
                    child: Container(
                      height: 32.h,
                      width: 76.0.h,
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      color: isliked == false ? formBgColor
                      : const Color.fromARGB(183, 164, 208, 241),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.thumb_up_outlined, color: grey, size: 17.sp,),
                          const Spacer(),
                          const Text("10.2k", style: TextStyle(color: grey, fontSize: 16 ),)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 16.h),
        //Blog Headings
        SizedBox(
          width: double.infinity,
          child: Text(widget.blogTitle.toUpperCase(), style: montserrat(black, 16, 0, FontWeight.w500))
        ),
        SizedBox(height: 16.h),
        commentSection(),
        SizedBox(height: 16.h),
        //Blog Info
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(12.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0.r),
            color: formBgColor,
          ),
          child: Text(widget.blogDescription, style: roboto(grey, 14, 0.6))
        ),
      ],
    );
  }

  //Work Show Case
  workShowCase(){
    return Column(
      children: [
        Text('WORK SHOWCASE',style:roboto(black,16.0,0.0) ,),
        SizedBox(
          height: 15.h,
        ),
        SizedBox(
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 20.h,
              );
            },
            itemCount: 4,
              physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0.r),
                  child: Image.network(
                    "https://images.pexels.com/photos/2064693/pexels-photo-2064693.jpeg?auto=compress&cs=tinysrgb&w=600",
                    height: 208.h,
                    width: 370.w,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  } 

  header(){
    return SliverPersistentHeader(
      delegate: DetailSliverDelegate(
        expandedHeight,
        roundedContainerHeight,
        widget.imgUrls,
        widget.userProfileUrl,
        widget.name,
        widget.createdAt,
        widget.heroTag,
        (){}
      ),
    );
  }
  
  commentSection() {
    return GestureDetector(
      onTap: (){
        userInfoList[0]["isRegistered"] == true ? 
          commentBottomSheet()
        : showDialog(context: context, builder: (BuildContext context) =>  
          CustomDialog(
            onOkpressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const LoginAndRegister(indx: 1,))));
            },
          )
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: formBgColor,
          borderRadius: BorderRadius.circular(6.0.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 10.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Comments 300", style: roboto(grey, 12, 0.0, FontWeight.w500),),
            SizedBox(height: 12.0.h,),
            Row(
              children: [
               Padding(
                  padding: const EdgeInsets.only(bottom:7.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0.r),
                    child: Image.network(
                      widget.userProfileUrl,
                      height: 30.0.h,
                      width: 30.0.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 14.0.w,
                ),
                SizedBox(
                  width: 230.0.w,
                  child: Text("Nice Blogs loved it !!", style: roboto(grey, 14, 0.0),)
                ),
                const Spacer(),
                const Icon(Icons.arrow_drop_down, color: grey,)
              ],
            )
          ],
        ),
      ),
    );
  }
  
  //bottomsheet to choose pictures from gallery or camera
  commentBottomSheet(){
    showModalBottomSheet(
      context: context, 
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
           top: Radius.circular(8.0.r)
        ),
      ),
      transitionAnimationController: animationController,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModal) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: ()=> Navigator.of(context).pop(),
            child: GestureDetector(
              onTap: (){},
              child: DraggableScrollableSheet(
                initialChildSize: 0.68,
                maxChildSize: 1.0,
                minChildSize: 0.25,
                builder: (_, scrollController) => Container(
                  padding: EdgeInsets.symmetric(vertical: 6.0.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12.0.r),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            height: 4.0.h,
                            width: 64.0.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0.r),
                              color: grey.withOpacity(0.6)
                            ),
                          ),
                        ),
                        SizedBox(height: 12.0.h,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal : 16.0.w,),
                          child: Text("Comments", style: roboto(grey, 18, 0.0, FontWeight.w600),),
                        ),
                        SizedBox(height: 14.0.h,),
                        //Add Comments
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal : 16.0.w,),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom:7.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100.0.r),
                                  child: Image.network(
                                    widget.userProfileUrl,
                                    height: 32.0.h,
                                    width: 32.0.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 12.0.w,
                              ),
                              Container(
                                height: 40.0.h,
                                width: 237.0.w,
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(
                                  left: 10.0.w,
                                  right: 10.0.w,
                                ),
                                decoration: BoxDecoration(
                                  color: formBgColor,
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                                child: TextFormField(
                                  controller: commentCon,
                                  style: roboto(grey, 14, 0.0),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(10.0.w, 1.8.h, 10.0.w, 3.8.h),
                                    border: InputBorder.none,
                                    hintText: "Add a comment",
                                    hintStyle:  roboto(grey.withOpacity(0.8), 14, 0.0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 6.0.w,
                              ),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    widget.cmntsList.add({
                                      "userId" : "1",
                                      "userName" : "Hero Daka",
                                      "comments" : commentCon.text,
                                      "likes" : "0",
                                      "date" : formatDate(date),
                                      'userProfileImgUrl' : "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=600",
                                    },);
                                  });
                                  commentCon.clear();
                                },
                                child: Container(
                                  height: 40.0.h,
                                  width: 40.0.h,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(
                                    left: 10.0.w,
                                    right: 10.0.w,
                                  ),
                                  decoration: BoxDecoration(
                                    color: formBgColor,
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                  child: Icon(Icons.forward, color: grey.withOpacity(0.8),)
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: const Color.fromARGB(255, 238, 234, 252),
                          endIndent: 0,
                          indent: 0,
                          thickness: 1.5,
                          height: 20.0.h,
                        ),
                        SizedBox(
                          height: 401.0.h,
                          child: ListView.builder(
                            itemCount: widget.cmntsList.length,
                            reverse: true,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context,index)
                            {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal : 16.0.w, vertical: 14.0.h),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom:7.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(100.0.r),
                                        child: Image.network(
                                          widget.cmntsList[index]["userProfileImgUrl"],
                                          height: 32.0.h,
                                          width: 32.0.h,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 12.0.w,
                                    ),
                                    SizedBox(
                                      width: 260.0.w,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(widget.cmntsList[index]["userName"], style: roboto(grey.withOpacity(0.8), 12, 0.0),),
                                              SizedBox(
                                                width: 10.0.w,
                                              ),
                                              Text(widget.cmntsList[index]["date"], style: roboto(grey.withOpacity(0.8), 12, 0.0),)
                                            ],
                                          ),
                                          SizedBox(height: 5.0.h,),
                                          SizedBox(
                                            width: 259.0.w,
                                            child: Text(
                                              widget.cmntsList[index]["comments"], 
                                              style: roboto(grey, 13, 0.0, FontWeight.normal, 1.35),
                                            )
                                          ),
                                          SizedBox(height: 9.0.h,),
                                          Row(
                                            children: [
                                              const Icon(Icons.thumb_up_alt_outlined, size: 16, color:  grey,),
                                              SizedBox(
                                                width: 8.0.w,
                                              ),
                                              Text(widget.cmntsList[index]["likes"], style: roboto(grey, 12, 0.0),)
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    const Icon(Icons.more_vert, size: 16, color: grey,),
                                  ],
                                ),
                              );
                            }
                          ),
                        ),
                      ],
                    )
                  ),
                ),
              ),
            );
          }
        );
      }
    );
  }

  String formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date).inDays;

    if (difference == 0) {
      return 'Today';
    } else if (difference == 1) {
      return 'Yesterday';
    } else if (difference < 7) {
      return '$difference days ago';
    } else if (difference < 31) {
      final weeks = (difference / 7).floor();
      return '$weeks weeks ago';
    } else {
      final months = (difference / 30).floor();
      return '$months months ago';
    }
  }

}

class DetailSliverDelegate extends SliverPersistentHeaderDelegate{
  final double expandedHeight;
  final double roundedContainerHeight;
  final VoidCallback onTap;
  final String  profileImgUrl, name, createdDate;
  final List imgUrl;
  final Object heroTag;

  DetailSliverDelegate(
    this.expandedHeight, 
    this.roundedContainerHeight, 
    this.imgUrl, 
    this.profileImgUrl,
    this.name,
    this.createdDate,
    this.heroTag,
    this.onTap,
  );

  @override
  double get maxExtent => expandedHeight;
  
  @override
  double get minExtent => 0;
  
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
  
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Hero(
      tag: heroTag,
      child: Stack(
        children: [
          Image.network(
            imgUrl[0],
            height: expandedHeight,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: expandedHeight - roundedContainerHeight - shrinkOffset,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: roundedContainerHeight,
              padding: EdgeInsets.only(top: 15.h, left: 15.w, right: 15.w, bottom: 5.h),
              decoration: BoxDecoration(
                color: scaffoldBg,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r)
                ),
              ),
              child: GestureDetector(
                onTap: onTap,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Profile Image
                    Container(
                      height: 30.0.h,
                      width: 30.0.h,
                      alignment: Alignment.bottomRight,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(50.r),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            profileImgUrl,
                          ),
                        )
                      ),
                      //Profile status indicator
                      child: Container(
                        height: 8.0.h,
                        width: 8.0.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 1.6,
                          ),
                          borderRadius: BorderRadius.circular(100.0.r),
                          color: green,
                        ),
                      )
                    ),
                    SizedBox(width: 13.w,),
                    //Username
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 245.w,
                          child: Text(name, 
                            style: roboto(grey, 13.5, 0.0, FontWeight.w600),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 2.h,),
                        SizedBox(
                          width: 245.w,
                          child: Text(createdDate,
                            style: roboto(grey, 10.0, 0.0),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
// CarouselSlider.builder(
      // unlimitedMode: true,
      // itemCount: firestoreBannerImage.length,
      // enableAutoSlider: true,
      // autoSliderDelay: Duration(seconds: 3),
      // autoSliderTransitionTime:
      // Duration(milliseconds: 500),
      // slideIndicator: CircularSlideIndicator(
      // itemSpacing: 15.0,
      // indicatorBackgroundColor:
      // Color.fromARGB(95, 197, 197, 197),
      // currentIndicatorColor: Colors.white,
      // padding: EdgeInsets.only(bottom: 10)),
      // slideBuilder: (index) {
      // return Padding(
      // padding: const EdgeInsets.all(8.0),
      // child: Image.network(
            //   widget.imgUrls[index],
            //   fit: BoxFit.cover,
            // ),
      // );
      // }),
      // );