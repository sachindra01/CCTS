import 'package:ccts/src/config/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'admin_menu_item.dart';

class SideBarItem extends StatelessWidget {
  const SideBarItem({super.key, 
    required this.items,
    required this.index,
    this.onSelected,
    required this.selectedRoute,
    this.depth = 0,
    this.iconColor,
    this.activeIconColor,
    required this.textStyle,
    required this.activeTextStyle,
    required this.backgroundColor,
    required this.activeBackgroundColor,
    required this.borderColor,
  });

  final List<AdminMenuItem> items;
  final int index;
  final void Function(AdminMenuItem item)? onSelected;
  final String selectedRoute;
  final int depth;
  final Color? iconColor;
  final Color? activeIconColor;
  final TextStyle textStyle;
  final TextStyle activeTextStyle;
  final Color backgroundColor;
  final Color activeBackgroundColor;
  final Color borderColor;
  bool get isLast => index == items.length - 1;

  @override
  Widget build(BuildContext context) {
    if (depth > 0 && isLast) {
      return _buildTiles(context, items[index]);
    }
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: borderColor,
          ),
        ),
      ),
      child: _buildTiles(context, items[index]),
    );
  }

  Widget _buildTiles(BuildContext context, AdminMenuItem item) {
    bool selected = _isSelected(selectedRoute, [item]);

    if (item.children.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
          child:
           ListTile(
            shape:  RoundedRectangleBorder( 
              borderRadius: BorderRadius.all(Radius.circular(50.r)),
              side: const BorderSide(
                color: Colors.grey,
              ),
            ),
            hoverColor:selected?Colors.transparent: grey.withOpacity(0.5),
            contentPadding: _getTilePadding(depth),
            leading: _buildIcon(item.icon, selected),
            title: _buildTitle(item.title, selected),
            selected: selected,
            tileColor: backgroundColor,
            selectedTileColor: activeBackgroundColor,
            onTap: () {
              if (onSelected != null) {
                onSelected!(item);
              }
            },
          ),
      );
    }

    int index = 0;
    final childrenTiles = item.children.map((child) {
      return SideBarItem(
        items: item.children,
        index: index++,
        onSelected: onSelected,
        selectedRoute: selectedRoute,
        depth: depth + 1,
        iconColor: iconColor,
        activeIconColor: activeIconColor,
        textStyle: textStyle,
        activeTextStyle: activeTextStyle,
        backgroundColor: backgroundColor,
        activeBackgroundColor: activeBackgroundColor,
        borderColor: borderColor

      );
    }).toList();

    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: _getTilePadding(depth),
        leading: _buildIcon(item.icon),
        title: _buildTitle(item.title),
        initiallyExpanded: selected,
        children: childrenTiles,
      ),
    );
  }

  bool _isSelected(String route, List<AdminMenuItem> items) {
    for (final item in items) {
      if (item.route == route) {
        return true;
      }
      if (item.children.isNotEmpty) {
        return _isSelected(route, item.children);
      }
    }
    return false;
  }

  Widget _buildIcon(Widget? icon, [bool selected = false]) {
    return icon ?? const SizedBox();
  }

  Widget _buildTitle(String title, [bool selected = false]) {
    return Text(
      title,
      style: selected ? activeTextStyle : textStyle,
    );
  }

  EdgeInsets _getTilePadding(int depth) {
    return EdgeInsets.only(
      left: 10.0 + 10.0 * depth,
      right: 10.0,
    );
  }
}
