import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SideBarIconTile extends StatefulWidget {
  final VoidCallback? ontap;
  final Color? iconBgColor;
  final Icon? itemIcon;
  const SideBarIconTile({super.key, this.ontap, this.iconBgColor, this.itemIcon});

  @override
  State<SideBarIconTile> createState() => _SideBarIconTileState();
}

class _SideBarIconTileState extends State<SideBarIconTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      child: Container(
        height: 34,
        width: 40,
        decoration: BoxDecoration(
          color: widget.iconBgColor,
          borderRadius: BorderRadius.circular(10.0.r)
        ),
        child: widget.itemIcon ??const Icon(Icons.abc),
      ),
    );
  }
}