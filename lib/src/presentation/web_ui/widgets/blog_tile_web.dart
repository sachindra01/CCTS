import 'package:ccts/src/config/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlogTileWeb extends StatelessWidget {
  final String imageUrl, blogStatus, profileImageUrl, blogTitle, blogInfo, profileStatus;
  final VoidCallback onTap;
  const BlogTileWeb({
    Key? key, required this.imageUrl, required this.onTap, required this.blogStatus, required this.profileImageUrl, required this.blogTitle, required this.blogInfo, required this.profileStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 230,
        // width: 350.w,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              imageUrl,
            ),
            fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(Color.fromARGB(50, 0, 0, 0), BlendMode.colorBurn),
          ),
          borderRadius: BorderRadius.circular(4.0)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Blog Status
              blogStatus == "" 
              ?const SizedBox()
              :Container(
                height: 18.0,
                width: 35.0,
                padding: EdgeInsets.all(3.sp),
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: white
                ),
                alignment: Alignment.center,
                child: FittedBox(
                  child: Text(blogStatus.toUpperCase(), style: roboto(black, 10.0, 0.0, FontWeight.w700),
                  ),
                ),
              ),
              //Blod Info
              Row(
                children: [
                  //Profile Image
                  Container(
                    height: 40.0,
                    width: 40.0,
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: black.withOpacity(0.5),
                          offset: const Offset(0, 5),
                          blurRadius: 5
                        )
                      ],
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          profileImageUrl,
                        ),
                      )
                    ),
                    //Profile status indicator
                    child: profileStatus == "Active" 
                    ? Container(
                      height: 12.0,
                      width: 12.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 1.6,
                        ),
                        borderRadius: BorderRadius.circular(100.0.r),
                        boxShadow: [
                          BoxShadow(
                            color: black.withOpacity(0.5),
                            offset: const Offset(2, 8),
                            blurRadius: 5
                          )
                        ],
                        color: green,
                      ),
                    )
                    :const SizedBox(),
                  ),
                  const SizedBox(width: 15,),
                  //Blog Texts
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: screenWidth > 666 ? 52.w : 210.w,
                        child: Flexible(
                          child: Text(blogTitle, 
                            style: roboto(white, 16.0, 0.0, FontWeight.w700),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth > 666 ? 52.w : 210.w,
                        child: Flexible(
                          child: Text(blogInfo,
                            style: roboto(white, 13.0, 0.0),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}