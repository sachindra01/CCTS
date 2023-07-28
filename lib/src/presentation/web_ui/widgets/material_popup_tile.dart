

import 'package:ccts/src/config/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MaterialCostPopupTile extends StatefulWidget {
  final String title;
  final VoidCallback ontap;
  final Color? color;
  const MaterialCostPopupTile({super.key, required this.title, required this.ontap, required this.color});

  @override
  State<MaterialCostPopupTile> createState() => _MaterialCostPopupTileState();
}

class _MaterialCostPopupTileState extends State<MaterialCostPopupTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:widget.ontap,
      child: Container(
        margin: const EdgeInsets.only(right: 5.0, bottom: 7.0),
        decoration: BoxDecoration(
          color: widget.color ?? const Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Row(
          children: [
            Container(
              height: 42,
              width: 5,
              decoration: BoxDecoration(
                color: violet.withOpacity(0.7),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  bottomLeft: Radius.circular(4.0),
                )
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: grey,),
            SizedBox(
              width: 5.w,
            ),
            Flexible(
              child: Text(widget.title, style: poppins(black, 14, 0.0, FontWeight.w500),
              maxLines: 2,
            ))
          ],
        ),
      ),
    );
  }
}