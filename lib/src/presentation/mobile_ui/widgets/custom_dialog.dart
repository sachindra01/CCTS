import 'package:ccts/src/config/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

customDialogBox(context, title, onYes, onNo){
  return showDialog(
    context: context, 
    builder: (context){
      return Dialog(
        insetPadding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 300.h
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: roboto(black, 16, 0.0),),
              const Spacer(),
              Row(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: onYes,
                    child: Text("YES", style: roboto(black, 18, 0.0),)
                  ),
                  SizedBox(width: 20.w,),
                  GestureDetector(
                    onTap: onNo,
                    child: Text("NO", style: roboto(pink, 18, 0.0),)
                  ),
                ],
              )
            ],
          ),
        )
      );
    },
  );
}