import 'package:ccts/src/config/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContractorTile extends StatelessWidget {
  final VoidCallback onTap;
  final String img, text;
  const ContractorTile({super.key, required this.onTap, required this.img, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 14.0.w),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.r ),
              child: Image.network(
                img,
                height: 82.h,
                width: 82.h,
                fit: BoxFit.cover,
              )
            )
          ),
          SizedBox(
            height: 12.0.h,
          ),
          SizedBox(
            width: 85.h,
            child: Text(
              text,
              style: roboto(black, 12, 0.0),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}