import 'package:ccts/src/config/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkShowcaseTile extends StatelessWidget {
  final String imageUrl,  workTitle, workInfo, workStatus;
  final Object hero;
  final VoidCallback onTap;
  const WorkShowcaseTile({
    Key? key, required this.imageUrl, required this.onTap, required this.workStatus, required this.workTitle, required this.workInfo, required this.hero,
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
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //WorkShowcase Status
                workStatus == "" 
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
                    child: Text(workStatus.toUpperCase(), style: roboto(black, 10.0, 0.0, FontWeight.w700),
                    ),
                  ),
                ),
                //Blod Info
                Row(
                  children: [
                    //WorkShowcase Texts
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 315.w,
                          child: Text(workTitle, 
                            style: roboto(white, 16.0, 0.0, FontWeight.w700),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          width: 315.w,
                          child: Text(workInfo,
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