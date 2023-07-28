import 'package:ccts/src/config/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class EngineerTile extends StatefulWidget {
  final String imageUrl, name, description;
  final Widget icon;
  final Color backgroundColor;
  final VoidCallback onTap;
  const EngineerTile({super.key, required this.imageUrl, required this.name, required this.description, required this.onTap, required this.icon, required this.backgroundColor});

  @override
  State<EngineerTile> createState() => _EngineerTileState();
}

class _EngineerTileState extends State<EngineerTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 186.h,
      width: 152.w,
      margin: EdgeInsets.only( bottom: 40.0.h, left: 6.0.w, right: 7.0.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0.r),
        color: widget.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 223, 223, 223),
            offset: const Offset(0, 5),
            blurRadius: 5.r
          )
        ]
      ),
      child: InkWell(
        onTap: widget.onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0.r),
                    topRight: Radius.circular(15.0.r),
                    bottomRight: Radius.circular(15.0.r)
                  ),
                  child: Image.network(
                    widget.imageUrl,
                    height: 120.h,
                    width: 152.w,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0.r),
                      child: Container(
                        height: 38.h,
                        width: 38.0.w,
                        color: const Color.fromARGB(167, 158, 158, 158),
                        child: widget.icon,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 12.0.h,),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(left : 12.0.w),
                child: Text(
                  widget.name, 
                  style: roboto(darkBlack, 16.0, 0.0, FontWeight.w700),
                  maxLines: 1,
                ),
              ),
            ),
            SizedBox(height: 6.0.h,),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(left : 12.0.w),
                child: Text(
                  widget.description, style: roboto(const Color(0xff414141), 14.0, 0.0, FontWeight.w400),
                  maxLines: 1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}