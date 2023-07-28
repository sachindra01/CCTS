import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/data/json_asset/app_data.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_button.dart';
import 'package:ccts/src/presentation/web_ui/view/side_bar/brick_result_tile.dart';
import 'package:ccts/src/presentation/web_ui/widgets/custom_textfield_web.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrickCalculationWeb extends StatefulWidget {
  const BrickCalculationWeb({super.key});

  @override
  State<BrickCalculationWeb> createState() => _BrickCalculationWebState();
}

class _BrickCalculationWebState extends State<BrickCalculationWeb> {
  String selectUnit = "meter";
  String rateType = "default";
  String labourType = "default";
  String skilledLabourType = "default";
  String brickType = "default";
  String sandType = "default";

  //Text Controllers
  final qualityController = TextEditingController();
  final lengthController = TextEditingController();
  final thicknessController = TextEditingController();
  final breadthController = TextEditingController();
  final labourCon = TextEditingController();
  final skilledLabourCon = TextEditingController();
  final brickCon = TextEditingController();
  final sandCon = TextEditingController();

  //Quality Selection List
  List values = ["No.1 Brick", "No.2 Brick", "Chiseled Brick"];

  var totalCost = "0.00";
  bool isCalculated = false;

  //For saved results
  var savedResultList = [];

  @override
  void initState() {
    labourCon.text = "740";
    skilledLabourCon.text = "1050";
    brickCon.text = "19.21";
    sandCon.text = "2050";
    super.initState();
  }

  @override
  void dispose() {
    lengthController.dispose();
    thicknessController.dispose();
    breadthController.dispose();
    qualityController.dispose();
    labourCon.dispose();
    skilledLabourCon.dispose();
    brickCon.dispose();
    sandCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Calculation Form
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0.r),
            color: formBgColor,
          ),
          child: Column(
            children: [
              //Dimesion Form
              dimension(),
              const SizedBox(height: 20.0),
              Divider(
                color: grey.withOpacity(0.15),
                thickness: 1.sp,
              ),
              const SizedBox(height: 13.0),
              //Quality Picker
              selectQuality(),
              const SizedBox(height: 20.0),
              Divider(
                color: grey.withOpacity(0.15),
                thickness: 1.sp,
              ),
              const SizedBox(height: 13.0),
              //Rate Form
              rate(),
            ],
          )
        ),
        //Results
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0.r),
            color: formBgColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //result
              result(),
            ],
          ),
        ),
        //Cancel And Save
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Calculate
            CustomButton(
              width: 108.0,
              height: 36.0,
              text: "Calculate".toUpperCase(),
              textStyle: roboto(white, 13.0, 0.2, FontWeight.w500),
              onPressed: (){
                isCalculated = true;
                totalCostCalculation();
              }, 
              buttonBgColor: violet, 
              fontColor: white
            ),
            //Save
            CustomButton(
              width: 108.0,
              height: 36.0,
              textStyle:  roboto(white, 13.0, 0.2, FontWeight.w500),
              text: "Save".toUpperCase(),
              onPressed: (){
                onSave();
              }, 
              buttonBgColor: violet, 
              fontColor: white
            ),
          ],
        ),
        const SizedBox(height: 10,),
        //Saved Results
        savedResultList.isNotEmpty ?
        savedResult()
        :const SizedBox(),
        const SizedBox(height: 10,),
      ],
    );
  }

  //Total Cost
  void totalCostCalculation(){
    var totalCostCalc = int.parse(lengthController.text.isEmpty ? "0" : lengthController.text) * int.parse(thicknessController.text.isEmpty ? "0" : thicknessController.text) * int.parse(breadthController.text.isEmpty ? "0" : breadthController.text) + double.parse(labourCon.text) + double.parse(skilledLabourCon.text) + double.parse(brickCon.text) + int.parse(sandCon.text);
    setState(() {
      totalCost = totalCostCalc.toString();
    });
  }

  //Select Location
  selectLocation(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Select Location".toUpperCase(), style: roboto(darkBlack, 16.0, 0.0,FontWeight.w400),),
        SizedBox(height: 25.0.h,),
        Container(
          height: 56.0.h,
          alignment: Alignment.center,
          padding: EdgeInsets.only(
            left: 10.0.w,
            right: 10.0.w,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.r),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 223, 223, 223),
                offset: const Offset(0, 5),
                blurRadius: 5.r
              )
            ]
          ),
          child: TextDropdownFormField(
            options: district,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(0.0.w, 3.8.h, 0.0.w, 3.8.h),
              border: InputBorder.none,
              labelText: "Select Provience",
              labelStyle: roboto( const Color.fromARGB(255, 153, 153, 153), 15, 0.0),
              suffixIcon: Padding(
                padding: EdgeInsets.only(top: 1.5.h, left: 10.0.w),
                child: const Icon(Icons.expand_more_rounded, color: lightGrey,),
              ),
              suffixIconConstraints: BoxConstraints(
                minWidth: 12.0.w
              ),
            ),
          ),
        ),
      ],
    );
  }

  //Dimensions From
  dimension() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("Dimensions".toUpperCase(), style: roboto(darkBlack, 14.0, 0.0),),
            const Spacer(),
            Container(
              height: 26.0,
              width: 94.0,
              decoration: BoxDecoration(
                color: white,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border:  Border(
                  top: BorderSide(width: 1, color: lightGrey.withOpacity(0.3)),
                  left: BorderSide(width: 1, color: lightGrey.withOpacity(0.3)),
                  right: BorderSide(width: 1, color: lightGrey.withOpacity(0.3)),
                  bottom: BorderSide(width: 1, color: lightGrey.withOpacity(0.3)),
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        selectUnit = "meter";
                      });
                    },
                    child: Container(
                      width: 46.0,
                      decoration: BoxDecoration(
                        color: selectUnit == "meter" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                      ),
                      child: Center(
                        child: Text("Meter", 
                          style: selectUnit == "meter" ? roboto(white, 12.0, 0.0) : roboto(black, 12.0, 0.0),
                        )
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        selectUnit = "feet";
                      });
                    },
                    child: Container(
                      width: 46.0,
                      decoration: BoxDecoration(
                        color: selectUnit == "feet" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                        ),
                      child: Center(
                        child: Text("Feet", 
                          style: selectUnit == "feet" ? roboto(white, 12.0, 0.0) : roboto(black, 12.0, 0.0),
                        )
                      )
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 25.0),
        selectUnit == "meter"
        ?Row(
          children: [
            Text("Length", style: roboto(black, 13, 0.0),),
            const Spacer(),
            CustomTextFieldWeb(
              textController: lengthController,
              keyboardType: TextInputType.number,
              textFieldWidth: 160.0,
              textfieldHeight: 28.0,
              hintText: "Enter Length",
              contentTopPadding: -6,
              suffixIcon: Text(
                "m",
                style: roboto(const Color.fromARGB(255, 153, 153, 153), 12.0, 0.0),
              ),
            )
          ],
        ):Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 68.0,
              child: Text("Length", style: roboto(black, 13, 0.0),)
            ),
            const CustomTextFieldWeb(
              keyboardType: TextInputType.number,
              textFieldWidth: 74.0,
              textfieldHeight: 28.0,
              contentTopPadding: -13,
              hintText: "Feet"
            ),
            const CustomTextFieldWeb(
              keyboardType: TextInputType.number,
              textFieldWidth: 74.0,
              textfieldHeight: 28.0,
              contentTopPadding: -13,
              hintText: "Inch"
            )
          ],
        ),
        const SizedBox(height: 15.0),
        selectUnit == "meter"
        ?Row(
          children: [
            SizedBox(
              width: 68.0,
              child: Flexible(child: Text("Thickness", style: roboto(black, 13, 0.0),))
            ),
            const Spacer(),
            CustomTextFieldWeb(
              textController: thicknessController,
              keyboardType: TextInputType.number,
              textFieldWidth: 160.0,
              textfieldHeight: 28.0,
              hintText: "Enter Thicknesss",
              contentTopPadding: -6,
              suffixIcon: Text(
                "m",
                style: roboto(const Color.fromARGB(255, 153, 153, 153), 12.0, 0.0),
              ),
            )
          ],
        )
        :Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 68.0,
              child: Text("Thickness", style: roboto(black, 13, 0.0),)
            ),
            const CustomTextFieldWeb(
              keyboardType: TextInputType.number,
              textFieldWidth: 74.0,
              textfieldHeight: 28.0,
              contentTopPadding: -13,
              hintText: "Feet"
            ),
            const CustomTextFieldWeb(
              keyboardType: TextInputType.number,
              textFieldWidth: 74.0,
              textfieldHeight: 28.0,
              contentTopPadding: -13,
              hintText: "Inch"
            )
          ],
        ),
        const SizedBox(height: 15.0),
        selectUnit == "meter"
        ?Row(
          children: [
            Text("Breadth", style: roboto(black, 13, 0.0),),
            const Spacer(),
            CustomTextFieldWeb(
              textController: breadthController,
              keyboardType: TextInputType.number,
              textFieldWidth: 160.0,
              textfieldHeight: 28.0,
              hintText: "Enter Breadth",
              contentTopPadding: -6,
              suffixIcon: Text(
                "m",
                style: roboto(const Color.fromARGB(255, 153, 153, 153), 12.0, 0.0),
              ),
            )
          ],
        )
        :Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 68.0,
              child: Text("Breadth", style: roboto(black, 13, 0.0),)
            ),
            const CustomTextFieldWeb(
              keyboardType: TextInputType.number,
              textFieldWidth: 74.0,
              textfieldHeight: 28.0,
              contentTopPadding: -13,
              hintText: "Feet"
            ),
            const CustomTextFieldWeb(
              keyboardType: TextInputType.number,
              textFieldWidth: 74.0,
              textfieldHeight: 28.0,
              contentTopPadding: -13,
              hintText: "Inch"
            )
          ],
        ),
      ],
    );
  }

  //Select Quality
  selectQuality() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Quality".toUpperCase(), style: roboto(darkBlack, 14.0, 0.0),),
        SizedBox(height: 25.0.h,),
        CustomTextFieldWeb(
          ontap: (){
            selectItemBottomSheet();
          },
          textController: qualityController,
          readOnly: true,
          keyboardType: TextInputType.number,
          textFieldWidth: 340.0.w,
          textfieldHeight: 30.0,
          contentTopPadding: -0.5,
          hintText: "Select Quality",
          suffixIcon: const Icon(Icons.expand_more_rounded, color: lightGrey,),
        ),
      ],
    );
  }

  //Select Item Bottom sheet
  Future<dynamic> selectItemBottomSheet() {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: white,
          height: MediaQuery.of(context).size.height*0.3,
          child: Column(
            children: [
              Container(
                color: lightGrey.withOpacity(0.2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      onPressed: (){
                        Navigator.pop(context);
                    },
                    child: Text("Cancel",style: roboto(violet, 16.0, 0.0),),),
                    MaterialButton(
                      onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text("Done",style: roboto(violet, 16.0, 0.0),),)
                  ]
                ),
              ),
              Expanded(
                child: CupertinoPicker(
                  scrollController: FixedExtentScrollController(),
                  onSelectedItemChanged: (value) => setState(() {
                    qualityController.text = values[value];
                  }),
                  itemExtent: 40.sp,
                  children: values.map((value) => Center(child: Text(value,style: roboto(black, 16.0, 0.0),))).toList(),
                ),
              )
            ],
          ),
        );
      }
    );
  }

  //Rate From
  rate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('RATE', style: roboto(darkBlack, 14.0, 0.0,FontWeight.w400),),
        const SizedBox(height: 25.0),
        //Labours
        Row(
          children: [
            SizedBox(
              width: 68,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Labour", style: roboto(black, 13, 0.0),),
                  const SizedBox(height: 2.0),
                  Text('(Per Person)', style: roboto(black, 10, 0.0),)
                ],
              )
            ),
            CustomTextFieldWeb(
              textController: labourCon,
              keyboardType: TextInputType.number,
              textFieldWidth: 74,
              readOnly: labourType == "default" ? true : false,
              isReadable: labourType == "default" ? true : false,
              textfieldHeight: 28.0,
              contentTopPadding: -3.5,
              prefixIcon: Text("रु", style: roboto(const Color.fromARGB(255, 153, 153, 153), 16.0, 0.0),), 
            ),
            const Spacer(),
            Container(
              height: 26.0,
              width: 82,
              decoration: BoxDecoration(
                color: white,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border:  Border(
                  top: BorderSide(width: 1, color: lightGrey.withOpacity(0.3)),
                  left: BorderSide(width: 1, color: lightGrey.withOpacity(0.3)),
                  right: BorderSide(width: 1, color: lightGrey.withOpacity(0.3)),
                  bottom: BorderSide(width: 1, color: lightGrey.withOpacity(0.3)),
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        labourType = "default";
                        labourCon.text = "740";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: labourType == "default" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                      ),
                      child: Center(
                        child: Text("Default", 
                          style: labourType == "default" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
                        )
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        labourType = "custom";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: labourType == "custom" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                        ),
                      child: Center(
                        child: Text("Custom", 
                          style: labourType == "custom" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
                        )
                      )
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 15.0.h,),
        //Skilled Labour
        Row(
          children: [
            SizedBox(
              width: 68.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Skilled Labour", style: roboto(black, 13, 0.0),),
                  const SizedBox(height: 2.0),
                  Text('(Per Person)', style: roboto(black, 10, 0.0),)
                ],
              )
            ),
            CustomTextFieldWeb(
              textController: skilledLabourCon,
              keyboardType: TextInputType.number,
              readOnly: skilledLabourType == "default" ? true : false,
              isReadable: skilledLabourType == "default" ? true : false,
              textFieldWidth: 74,
              textfieldHeight: 28.0,
              contentTopPadding: -3.5,
              prefixIcon: Text("रु", style: roboto(const Color.fromARGB(255, 153, 153, 153), 17.0, 0.0),),
              hintTextSize: 14.0.sp,
            ),
            const Spacer(),
            Container(
              height: 26.0,
              width: 82.0,
              decoration: BoxDecoration(
                color: white,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border:  Border(
                  top: BorderSide(width: 1, color: lightGrey.withOpacity(0.3)),
                  left: BorderSide(width: 1, color: lightGrey.withOpacity(0.3)),
                  right: BorderSide(width: 1, color: lightGrey.withOpacity(0.3)),
                  bottom: BorderSide(width: 1, color: lightGrey.withOpacity(0.3)),
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        skilledLabourType = "default";
                        skilledLabourCon.text = "1050";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: skilledLabourType == "default" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                      ),
                      child: Center(
                        child: Text("Default", 
                          style: skilledLabourType == "default" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
                        )
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        skilledLabourType = "custom";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: skilledLabourType == "custom" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                        ),
                      child: Center(
                        child: Text("Custom", 
                          style: skilledLabourType == "custom" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
                        )
                      )
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 15.0.h,),
        //Brick
        Row(
          children: [
            SizedBox(
              width: 68.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Brick", style: roboto(black, 13, 0.0),),
                  SizedBox(height: 2.0.h,),
                  Text('(Per unit)', style: roboto(black, 10, 0.0),)
                ],
              )
            ),
            CustomTextFieldWeb(
              textController: brickCon,
              keyboardType: TextInputType.number,
              readOnly: brickType == "default" ? true : false,
              isReadable: brickType == "default" ? true : false,
              textFieldWidth: 74,
              textfieldHeight: 28.0,
              contentTopPadding: -3.5,
              prefixIcon: Text("रु", style: roboto(const Color.fromARGB(255, 153, 153, 153), 17.0, 0.0),),
              hintTextSize: 14.0.sp,
            ),
            const Spacer(),
            Container(
              height: 26.0,
              width: 82.0,
              decoration: BoxDecoration(
                color: white,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border:  Border(
                  top: BorderSide(width: 1, color: lightGrey.withOpacity(0.3)),
                  left: BorderSide(width: 1, color: lightGrey.withOpacity(0.3)),
                  right: BorderSide(width: 1, color: lightGrey.withOpacity(0.3)),
                  bottom: BorderSide(width: 1, color: lightGrey.withOpacity(0.3)),
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        brickType = "default";
                        brickCon.text = "19.21";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: brickType == "default" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                      ),
                      child: Center(
                        child: Text("Default", 
                          style: brickType == "default" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
                        )
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        brickType = "custom";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: brickType == "custom" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                        ),
                      child: Center(
                        child: Text("Custom", 
                          style: brickType == "custom" ? roboto(white, 11.0, 0.0) : roboto(black, 11.0, 0.0),
                        )
                      )
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 15.0.h,),
        //Sand
        Row(
          children: [
            SizedBox(
              width: 68.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sand", style: roboto(black, 13, 0.0),),
                  SizedBox(height: 2.0.h,),
                  Text('(Per cu.m)', style: roboto(black, 10, 0.0),)
                ],
              )
            ),
            CustomTextFieldWeb(
              textController: sandCon,
              keyboardType: TextInputType.number,
              readOnly: sandType == "default" ? true : false,
              isReadable: sandType == "default" ? true : false,
              textFieldWidth: 74,
              textfieldHeight: 28.0,
              contentTopPadding: -3.5,
              prefixIcon: Text("रु", style: roboto(const Color.fromARGB(255, 153, 153, 153), 17.0, 0.0),),
              hintTextSize: 14.0.sp,
            ),
            const Spacer(),
            Container(
              height: 26.0,
              width: 82.0,
              decoration: BoxDecoration(
                color: white,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border:  Border(
                  top: BorderSide(width: 1, color: lightGrey.withOpacity(0.3)),
                  left: BorderSide(width: 1, color: lightGrey.withOpacity(0.3)),
                  right: BorderSide(width: 1, color: lightGrey.withOpacity(0.3)),
                  bottom: BorderSide(width: 1, color: lightGrey.withOpacity(0.3)),
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        sandType = "default";
                        sandCon.text = "2050";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: sandType == "default" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                      ),
                      child: Center(
                        child: Text("Default", 
                          style: sandType == "default" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
                        )
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        sandType = "custom";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: sandType == "custom" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                        ),
                      child: Center(
                        child: Text("Custom", 
                          style: sandType == "custom" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
                        )
                      )
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  //Result Section
  result() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Result".toUpperCase(), style: roboto(darkBlack, 14.0, 0.0,FontWeight.w400),),
        const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Items",style: roboto(black, 13, 0.0),),
            Text("Quantity",style: roboto(black, 13, 0.0),),
            Text("Cost",style: roboto(black, 13, 0.0),)
          ],
        ),
        const SizedBox(height: 20,),
        //Calculaiton Items List
        isCalculated ?
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Length : ", style: roboto(black, 14.0, 0.0, FontWeight.w500)),
                Text(lengthController.text.toString(), style: roboto(black, 13.0, 0.0)),
              ],
            ),
            SizedBox(height: 10.h),
              Row(
              children: [
                Text("Thickness : ", style: roboto(black, 14.0, 0.0, FontWeight.w500)),
                Text(thicknessController.text.toString(), style: roboto(black, 13.0, 0.0)),
              ],
            ),
            SizedBox(height: 10.h), 
            Row(
              children: [
                Text("Breadth : ", style: roboto(black, 14.0, 0.0, FontWeight.w500)),
                Text(breadthController.text.toString(), style: roboto(black, 13.0, 0.0)),
              ],
            ),
            SizedBox(height: 10.h), Row(
              children: [
                Text("Labour : ", style: roboto(black, 14.0, 0.0, FontWeight.w500)),
                Text(labourCon.text.toString(), style: roboto(black, 13.0, 0.0)),
              ],
            ),
            SizedBox(height: 10.h), Row(
              children: [
                Text("Skilled Labour : ", style: roboto(black, 14.0, 0.0, FontWeight.w500)),
                Text(skilledLabourCon.text.toString(), style: roboto(black, 13.0, 0.0)),
              ],
            ),
            SizedBox(height: 10.h),
              Row(
              children: [
                Text("Brick : ", style: roboto(black, 14.0, 0.0, FontWeight.w500)),
                Text(brickCon.text.toString(), style: roboto(black, 13.0, 0.0)),
              ],
            ),
            SizedBox(height: 10.h),
              Row(
              children: [
                Text("Sand : ",  style: roboto(black, 14.0, 0.0, FontWeight.w500)),
                Text(sandCon.text.toString(), style: roboto(black, 13.0, 0.0)),
              ],
            ),
          ],
        )
        :const SizedBox(),
        const SizedBox(height: 13.0,),
        Divider(
          color: grey.withOpacity(0.15),
          thickness: 1.sp,
        ),
        const SizedBox(height: 8.0,),
        //Result
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total Cost ".toUpperCase(),style: roboto(black, 14, 0.0),),
            const SizedBox(width: 15.0,),
            Flexible(
              child: Text("रु $totalCost",style: roboto(black, 18, 0.0, FontWeight.w600, ), )
            ),
          ],
        ),
      ],
    );
  }

  //on save function
  onSave() async{
    totalCostCalculation();
    savedResultList.add(
      {
        "length" : lengthController.text.toString(),
        "thickness" : thicknessController.text.toString(),
        "breadth" : breadthController.text.toString(),
        "labour" : labourCon.text.toString(),
        "skilledLabour" : skilledLabourCon.text.toString(),
        "brick" : brickCon.text.toString(),
        "sand" : sandCon.text.toString(),
        "totalCost" : totalCost.toString()
      }
    );
  }

  //Saved Results
  savedResult() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0.r),
        color: formBgColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Saved Result".toUpperCase(), style: roboto(darkBlack, 14.0, 0.0,FontWeight.w400),),
          const SizedBox(height: 12,),
          //Saved Calculation List
          ListView.separated(
            itemCount: savedResultList.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return BrickSavedResultTile(
                length: savedResultList[index]["length"],
                thickness: savedResultList[index]["thickness"], 
                breadth: savedResultList[index]["breadth"], 
                labour: savedResultList[index]["labour"], 
                skilledLabour: savedResultList[index]["skilledLabour"], 
                brick: savedResultList[index]["brick"], 
                sand: savedResultList[index]["sand"],
                totalCost: savedResultList[index]["totalCost"],
              );
            }, 
            separatorBuilder: (context, index) => const SizedBox(),
          ),
        ],
      ),
    );
  }
}