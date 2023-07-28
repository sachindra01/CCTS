import 'package:ccts/src/config/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectTile extends StatelessWidget {
  const ProjectTile({super.key, });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 119.h,
      width: 80.w,
      margin: EdgeInsets.only( bottom: 16.0.h, left: 0.0.w, right: 7.0.w),
      decoration: BoxDecoration(
        border: Border.all(
          color: greytextColor
        ),
        borderRadius: BorderRadius.circular(12.0.r),
      
      ),
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.0.h,),
              Text(
                'Project Name',
                style: roboto(black, .0, 0.0,FontWeight.w700),
                maxLines: 1,
              ),
              SizedBox(
                height: 10.h,
              ),
               Text(
                'Updated on :2022-01-22',
                style: roboto(black, 14.0, 0.0,FontWeight.w700),
                maxLines: 1,
              ),
               Text(
                'Site:Lalitpur,Nepal',
                style: roboto(black, 14.0, 0.0,FontWeight.w700),
                maxLines: 1,
              ),

            ],
          ),
        ),
      ),
    );
  }
}