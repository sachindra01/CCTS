import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_button.dart';
import 'package:ccts/src/presentation/web_ui/widgets/custom_textfield_web.dart';
import 'package:ccts/src/presentation/web_ui/widgets/expense_sub_heading_tile.dart';
import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpenseHeadingTile extends StatefulWidget {
  final List layoutList;
  final List? labourList, materialList;
  final String title;
  final VoidCallback ?onRemove;
  final bool ?isSideBarOpen;
  const ExpenseHeadingTile({super.key, this.labourList, this.onRemove, required this.title, this.materialList, required this.layoutList, this.isSideBarOpen});

  @override
  State<ExpenseHeadingTile> createState() => _ExpenseHeadingTileState();
}

class _ExpenseHeadingTileState extends State<ExpenseHeadingTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.0.w,
      margin: EdgeInsets.only(bottom: 15.h),
      padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 27),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: formBgColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title, style: poppins(black, 24.0, 0.0, FontWeight.w700),),
              InkWell(
                onTap: widget.onRemove,
                child: const Icon(Icons.delete, color: pink,)
              ),
            ],
          ),
          const SizedBox(height: 32,),
          //List View
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.layoutList.length,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index)
            {
              return ExpenseSubHeadingTile(
                isSideBarOpen: widget.isSideBarOpen ?? false,
                labourList: widget.layoutList[index]["labourList"] ?? [],
                materialList: widget.layoutList[index]["materialList"] ?? [], 
                title: widget.layoutList[index]["layoutTitle"] ?? "",               
                onRemove: (){
                  setState(() {
                   widget.layoutList.removeAt(index);
                  });
                },
                onLabourRemove: () {
                  setState(() {
                    widget.layoutList[index]["labourList"].removeAt(index);
                  });
                },
                onMaterialRemove: () {
                  setState(() {
                    widget.layoutList[index]["materialList"].removeAt(index);
                  });
                },
              );
            }
          ),
          //- - Add New Expenses Sub-heading - - 
          Row(
            children: [
              const Spacer(),
              CustomTextFieldWeb(
                readOnly: true,
                keyboardType: TextInputType.number,
                textFieldWidth: 87.w,
                textfieldHeight: 45,
                contentTopPadding: 7,
                hintText: "- - Add New Expenses Sub-heading - - ",
                hintTextSize: 16,
                inputFontSize: 16,
                suffixIcon: const Icon(Icons.expand_more_rounded, color: lightGrey,),
              ),
              SizedBox(
                width: 6.0.w,
              ),
              CustomButton(
                height: 40,
                width: 90,
                text: "Add", 
                textStyle: roboto(white, 14, 0.0, FontWeight.w500),
                buttonRadius: 100,
                onPressed: (){
                  setState(() {
                    widget.layoutList.add(
                      {
                        "layoutTitle" : "This is the title",
                        "labourList" : [],
                        "materialList" : [],
                      }
                    );
                  });
                }, 
                buttonBgColor: violet, 
                fontColor: white,
              )
            ],
          ),
          const SizedBox(height: 24,),
          //Total Section
          totalSection(),
        ],
      ),
    );
  }

  totalSection() {
    return Row(
      children: [
        const Spacer(),
        SizedBox(
          width: 40.w,
          child: Text("Total Labour Cost", style: roboto(black, 20, 0.0, FontWeight.w700), maxLines: 3,)
        ),
        SizedBox(width: 3.w,),
        SizedBox(
          width: 30.w,
          child: Text("${widget.labourList!.length * 100000}", style: roboto(black, 20, 0.0, FontWeight.w700), maxLines: 3)
        ),
        SizedBox(width: 20.w,),
        SizedBox(
          width: 43.w,
          child: Text("Total Material Cost", style: roboto(black, 20, 0.0, FontWeight.w700), maxLines: 3,)
        ),
        SizedBox(width: 3.w,),
        SizedBox(
          width: 30.w,
          child: Text("Rs, 400,000", style: roboto(black, 20, 0.0, FontWeight.w700), maxLines: 3)
        ),
      ],
    );
  }
}