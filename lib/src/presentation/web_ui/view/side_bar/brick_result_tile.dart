import 'package:ccts/src/config/style.dart';
import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrickSavedResultTile extends StatelessWidget {
  final String ?length, thickness, breadth, labour, skilledLabour, brick, sand, totalCost;
  const BrickSavedResultTile({super.key, required this.length, required this.thickness, required this.breadth, required this.labour, required this.skilledLabour, required this.brick, required this.sand, this.totalCost});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            length!.isEmpty ?
            const SizedBox()
            : Row(
              children: [
                Text("Length : ", style: roboto(black, 14.0, 0.0, FontWeight.w500)),
                Text(length!, style: roboto(black, 13.0, 0.0)),
              ],
            ),
            SizedBox(height: 10.h),
            thickness!.isEmpty ?
            const SizedBox()
            : Row(
              children: [
                Text("Thickness : ", style: roboto(black, 14.0, 0.0, FontWeight.w500)),
                Text(thickness!, style: roboto(black, 13.0, 0.0)),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Text("Breadth : ", style: roboto(black, 14.0, 0.0, FontWeight.w500)),
                Text(breadth!, style: roboto(black, 13.0, 0.0)),
              ],
            ),
            SizedBox(height: 10.h), 
            Row(
              children: [
                Text("Labour : ", style: roboto(black, 14.0, 0.0, FontWeight.w500)),
                Text(labour!, style: roboto(black, 13.0, 0.0)),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Text("Skilled Labour : ", style: roboto(black, 14.0, 0.0, FontWeight.w500)),
                Text(skilledLabour!, style: roboto(black, 13.0, 0.0)),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Text("Brick : ", style: roboto(black, 14.0, 0.0, FontWeight.w500)),
                Text(brick!, style: roboto(black, 13.0, 0.0)),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Text("Sand : ",  style: roboto(black, 14.0, 0.0, FontWeight.w500)),
                Text(sand!, style: roboto(black, 13.0, 0.0)),
              ],
            ),
            const SizedBox(height: 13.0,),
            Divider(
              color: grey.withOpacity(0.15),
              thickness: 1.sp,
            ),
            const SizedBox(height: 8.0,),
            //Total
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Cost ".toUpperCase(),style: roboto(black, 13, 0.0),),
                const SizedBox(width: 15.0,),
                Flexible(
                  child: Text("रु  $totalCost", style: roboto(black, 16, 0.0, FontWeight.w600, ), )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}