

import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/presentation/web_ui/widgets/custom_textfield_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MaterialEarthworkTile extends StatefulWidget {
  final VoidCallback onRemove;
  const MaterialEarthworkTile({super.key, required this.onRemove});

  @override
  State<MaterialEarthworkTile> createState() => _MaterialEarthworkTileState();
}

class _MaterialEarthworkTileState extends State<MaterialEarthworkTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          CustomTextFieldWeb(
            readOnly: true,
            keyboardType: TextInputType.number,
            textFieldWidth: 70.2.w,
            textfieldHeight: 45,
            hintText: "Cost Topics",
            suffixIcon: const Icon(Icons.expand_more_rounded, color: lightGrey,),
          ),
          SizedBox(width: 5.w,),
          CustomTextFieldWeb(
            readOnly: false,
            keyboardType: TextInputType.number,
            textFieldWidth: 30.6.w,
            textfieldHeight: 45,
            prefixIcon: Text("रु", style: roboto(const Color.fromARGB(255, 153, 153, 153), 18.5, 0.0),),
          ),
          SizedBox(width: 5.w,),
          CustomTextFieldWeb(
            keyboardType: TextInputType.number,
            textFieldWidth: 30.6.w,
            textfieldHeight: 45,
            hintText: "Units",
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.only(left: 5),
            width: 20.0.w,
            child: FittedBox(
              child: Text("Rs. 100,000", style: roboto(black, 16.0, 0.0),
              textAlign: TextAlign.right,
              maxLines: 2,),
            )
          ),
          SizedBox(width: 5.w,),
          GestureDetector(
            onTap: widget.onRemove,
            child: Container(
              height: 42,
              width: 12.2.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: const[
                  BoxShadow(
                    color: Color.fromARGB(255, 223, 223, 223),
                    offset: Offset(0, 5),
                    blurRadius: 5
                  )
                ]
              ),
              child: Center(
                child: Text("-", style: roboto(black, 30, 0.0),),
              ),
            ),
          )
        ],
      ),
    );
  }
}