import 'package:ccts/src/config/style.dart';
import "package:flutter/material.dart";

class SideNavCategoryExpansionTile extends StatefulWidget {
  final String ?categoryTitle;
  final Widget ?expansionBody;
  const SideNavCategoryExpansionTile({super.key, this.categoryTitle, this.expansionBody});

  @override
  State<SideNavCategoryExpansionTile> createState() => _SideNavCategoryExpansionTileState();
}

class _SideNavCategoryExpansionTileState extends State<SideNavCategoryExpansionTile> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: sideNavExpansionBg),
      child: ExpansionTile(
        backgroundColor: sideNavYellow,
        collapsedBackgroundColor: formBgColor,
        tilePadding: const EdgeInsets.symmetric(horizontal: 10),
        title: Text(widget.categoryTitle ?? "No Data", style: poppins(black, 16, 0.0, FontWeight.w500), maxLines: 3,),
        children: <Widget>[
          Container(
            color: sideNavExpansionBg,
            child: widget.expansionBody ?? const SizedBox(height: 50,)
          ),
        ],
      ),
    );
  }
}