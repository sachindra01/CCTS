
import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_button.dart';
import 'package:ccts/src/presentation/web_ui/widgets/custom_textfield_web.dart';
import 'package:ccts/src/presentation/web_ui/widgets/material_cost_earthwork.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MaterialCostBoxTile extends StatefulWidget {
  final int length;
  final String title,totalPrice;
  final VoidCallback remove, add, onSave, removeBox;
  const MaterialCostBoxTile({super.key, required this.length, required this.totalPrice, required this.remove, required this.add, required this.title, required this.onSave, required this.removeBox});

  @override
  State<MaterialCostBoxTile> createState() => _MaterialCostBoxTileState();
}

class _MaterialCostBoxTileState extends State<MaterialCostBoxTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: poppins(black, 24.0, 0.0, FontWeight.w700),),
        const SizedBox(height: 16.0,),
        Container(
          width: 393.0.w,
          padding: EdgeInsets.only(left: 8.8.w, right: 8.8.w, bottom: 33, top: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: formBgColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: widget.removeBox,
                    child: Text("Remove",
                      style: poppins(pink, 14, 0.0, FontWeight.w500),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              ListView.builder(
                shrinkWrap: true,
                itemCount: widget.length,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (index,context)
                {
                  return  MaterialEarthworkTile(
                    onRemove: widget.remove,
                  );
                }
              ),
              Row(
                children: [
                  CustomTextFieldWeb(
                    keyboardType: TextInputType.number,
                    textFieldWidth: 97.2.w,
                    textfieldHeight: 45,
                    hintText: "- - - - - - - - - - -",
                  ),
                  const SizedBox(width: 20,),
                  CustomTextFieldWeb(
                    keyboardType: TextInputType.number,
                    textFieldWidth: 30.6.w,
                    textfieldHeight: 45,
                    hintText: "- - - -",
                  ),
                  const SizedBox(width: 20,),
                  CustomTextFieldWeb(
                    keyboardType: TextInputType.number,
                    textFieldWidth: 30.6.w,
                    textfieldHeight: 45,
                    hintText: "- - - -",
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: widget.add,
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
                        child: Text("+", style: roboto(black, 28, 0.0),),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24,),
              Row(
                children: [
                  const Spacer(),
                  Text("Total Cost", style: roboto(black, 20, 0.0, FontWeight.w700),),
                  const SizedBox(width: 50,),
                  Text(widget.totalPrice, style: roboto(black, 20, 0.0, FontWeight.w700),),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 27.0,),
        //save button
        SizedBox(
          width: 393.0.w,
          child: Row(
            children: [
              const Spacer(),
              CustomButton(
                height: 40,
                width: 100,
                text: "Save", 
                textStyle: roboto(white, 14, 0.0, FontWeight.w500),
                buttonRadius: 100,
                onPressed: widget.onSave, 
                buttonBgColor: violet, 
                fontColor: white,
              )
            ],
          ),
        ),
        const SizedBox(height: 15,)
      ],
    );
  }
}