import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/data/json_asset/app_data.dart';
import 'package:ccts/src/presentation/mobile_ui/view/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar customAppBar(context,[title, action, drawer, key, registerId]){
  return AppBar(
    toolbarHeight: 55.0,
    backgroundColor: appBarColor,
    title: title != "CCTS" 
      ? Text(title.toUpperCase(), style: roboto(black, 18.0, 0.0, FontWeight.w600),)
      : Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/img/logo.png',
          width: 21,
          height: 15,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 3.0,),
        const Text("CCTS"),
      ],
    ),
    centerTitle: title != "CCTS" ? false : true,
    elevation: 0.0,
    titleTextStyle: title == "CCTS" ? roboto(black, 20.0, 0.0, FontWeight.w700) :  roboto(black, 18.0, 0.0, FontWeight.w500),
    actions: [
      title != "CCTS" 
      ? action ?? const SizedBox()
      : InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage(userId: cctsCurrentUserId, registerUserId: registerId,)));
        },
        child: Container(
          padding: const EdgeInsets.only(right:8.0),
          width: 64,
          height: 64,
          child: Stack(
            children: [
              Image.asset(
                'assets/img/bookmark.png',
                height: 64,
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(bottom:7.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0.r),
                    child: Image.network(
                      "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=600",
                      height: 38,
                      width: 38,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )
    ],
    leadingWidth: 48,
    leading: drawer == true ? 
    GestureDetector(
      onTap: (){
        key.currentState!.openDrawer();
      },
      child: Row(
        children: [
          const SizedBox(width: 15,),
          Icon(Icons.menu, color: appBarIconCol, size: 25.sp,),
        ],
      ),
    ) : 
    GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Icon(Icons.arrow_back, color: appBarIconCol, size: 25.sp,)
    )
  );
}