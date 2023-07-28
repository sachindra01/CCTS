import 'package:ccts/src/config/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalculationCategoryTile extends StatelessWidget {
  final String imageUrl, name;
  final Color backgroundColor;
  final VoidCallback onTap;
  final List ? labour;
  final List ? material;
  const CalculationCategoryTile({super.key, required this.imageUrl, required this.name, required this.backgroundColor, required this.onTap, this.labour, this.material});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 162.h,
      width: 152.w,
      margin: EdgeInsets.only( bottom: 16.0.h, left: 6.0.w, right: 7.0.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0.r),
        color: violet.withOpacity(0.52),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 184, 184, 184),
            offset: const Offset(0, 4),
            blurRadius: 5.r
          )
        ]
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0.r),
                topRight: Radius.circular(12.0.r),
                bottomRight: Radius.circular(12.0.r)
              ),
              child: Image.network(
                imageUrl,
                height: 120.h,
                width: 152.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 12.0.h,),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(left : 12.0.w),
                child: Text(
                  name,
                  style: roboto(white, 14.0, 0.0),
                  maxLines: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}