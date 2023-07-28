import 'package:ccts/src/config/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlogTile extends StatelessWidget {
  final String imageUrl, blogStatus, profileImageUrl, blogTitle, blogInfo, profileStatus;
  final Object hero;
  final VoidCallback onTap;
  const BlogTile({
    Key? key, required this.imageUrl, required this.onTap, required this.blogStatus, required this.profileImageUrl, required this.blogTitle, required this.blogInfo, required this.profileStatus, required this.hero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Hero(
        tag: hero,
        child: Container(
          height: 230.0.h,
          width: 350.w,
          margin: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                imageUrl,
              ),
              fit: BoxFit.cover,
              colorFilter: const ColorFilter.mode(Color.fromARGB(50, 0, 0, 0), BlendMode.colorBurn),
            ),
            borderRadius: BorderRadius.circular(15.0.r)
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Blog Status
                blogStatus == "" 
                ?const SizedBox()
                :Container(
                  height: 18.0.h,
                  width: 35.0.w,
                  padding: EdgeInsets.all(3.sp),
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0.r),
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
                      height: 40.0.h,
                      width: 40.0.h,
                      alignment: Alignment.bottomRight,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: black.withOpacity(0.5),
                            offset: const Offset(0, 5),
                            blurRadius: 5.r
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
                        height: 12.0.h,
                        width: 12.0.h,
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
                              blurRadius: 5.r
                            )
                          ],
                          color: green,
                        ),
                      )
                      :const SizedBox(),
                    ),
                    SizedBox(width: 15.w,),
                    //Blog Texts
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 245.w,
                          child: Text(blogTitle, 
                            style: roboto(white, 16.0, 0.0, FontWeight.w700),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          width: 245.w,
                          child: Text(blogInfo,
                            style: roboto(white, 13.0, 0.0),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
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
      ),
    );
  }
}