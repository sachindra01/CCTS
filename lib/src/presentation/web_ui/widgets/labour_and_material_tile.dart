import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/presentation/web_ui/widgets/custom_textfield_web.dart';
import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabourAndMaterialTile extends StatefulWidget {
  final VoidCallback ?onRemove;
  const LabourAndMaterialTile({super.key, this.onRemove});

  @override
  State<LabourAndMaterialTile> createState() => _LabourAndMaterialTileState();
}

class _LabourAndMaterialTileState extends State<LabourAndMaterialTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      width: MediaQuery.of(context).size.width * 0.4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextFieldWeb(
            readOnly: true,
            keyboardType: TextInputType.number,
            textFieldWidth: 50.2.w,
            textfieldHeight: 45,
            hintText: "Cost Topics",
            hintTextSize: 16,
            contentTopPadding: 7,
            suffixIcon: const Icon(Icons.expand_more_rounded, color: lightGrey,),
          ),
          SizedBox(width: 3.5.w,),
          CustomTextFieldWeb(
            readOnly: false,
            keyboardType: TextInputType.number,
            textFieldWidth: 20.w,
            hintTextSize: 16,
            contentTopPadding: 7,
            inputFontSize: 16,
            textfieldHeight: 45,
            prefixIcon: Text("रु", style: roboto(const Color.fromARGB(255, 153, 153, 153), 18.5, 0.0),),
          ),
          SizedBox(width: 3.5.w,),
          CustomTextFieldWeb(
            keyboardType: TextInputType.number,
            textFieldWidth: 20.w,
            textfieldHeight: 45,
            inputFontSize: 16,
            hintText: "Units",
            hintTextSize: 16,
          ),
          SizedBox(
            width: 20.0.w,
            child: FittedBox(
              child: Text("Rs. 100,000", 
                style: roboto(black, 16.0, 0.0),
                maxLines: 1 ,
              ),
            )
          ),
          SizedBox(width: 2.w,),
          //Remove Labour
          GestureDetector(
            onTap: widget.onRemove,
            child: Container(
              height: 42,
              width: 11.w,
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