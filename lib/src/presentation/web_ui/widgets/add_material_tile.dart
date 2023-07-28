import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddMaterialTile extends StatefulWidget {
  final Checkbox checkbox;
  final String title, description;
  const AddMaterialTile({super.key, required this.checkbox, required this.title, required this.description});

  @override
  State<AddMaterialTile> createState() => _AddMaterialTileState();
}

class _AddMaterialTileState extends State<AddMaterialTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 7),
      child: ExpansionTile(
        backgroundColor: const Color(0xFFEEEEEE),
        collapsedBackgroundColor: const Color.fromARGB(255, 247, 247, 247),
        tilePadding: const EdgeInsets.fromLTRB(14.0, 10, 14, 10),
        title: Row(
          children: [
            widget.checkbox,
            SizedBox(width: 2.90.w,),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title, style: poppins(black, 16, 0.0, FontWeight.w500), maxLines: 3,),
                  const SizedBox(height: 4,),
                  Text(widget.description, style: poppins(grey.withOpacity(0.7), 14, 0.0), maxLines: 2,)
                ],
              )
            ),
          ],
        ),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left:16.w, bottom: 10.0, right: 14.0, top: 0.0),
            child: Row(
              children: [
                CustomButton(
                  height: 28,
                  width: 80,
                  text: "Labour",
                  onPressed: (){
                  }, 
                  buttonBgColor: Colors.blue.withOpacity(0.4), 
                  fontColor: black,
                  buttonRadius: 100,
                ),
                const SizedBox(
                  width: 10,
                ),
                CustomButton(
                  height: 28,
                  width: 84,
                  text: "Material",
                  onPressed: (){
                  }, 
                  buttonBgColor: Colors.blue.withOpacity(0.4), 
                  fontColor: black,
                  buttonRadius: 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}