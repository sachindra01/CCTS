import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/data/json_asset/app_data.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_button.dart';
import 'package:ccts/src/presentation/web_ui/widgets/custom_textfield_web.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlasteringWorksWeb extends StatefulWidget {
  const PlasteringWorksWeb({super.key});

  @override
  State<PlasteringWorksWeb> createState() => _PlasteringWorksWebState();
}

class _PlasteringWorksWebState extends State<PlasteringWorksWeb> {
  String selectUnit = "meter";
  String labourRateType = "default";
  String skilledLabourRateType = "default";
  String cementRateType = "default";
  String sandRateType = "default";
  List values = ["12.5mm thick 1:4 C/S Mortar", "12.5 thick 1:6 C/S Mortar"];
  
  final qualityController = TextEditingController();
  final labourCon= TextEditingController();
  final skilledLabourCon = TextEditingController();
  final cementCon = TextEditingController();
  final sandCon = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    labourCon.text = "740";
    skilledLabourCon.text = "1050";
    cementCon.text = "17854";
    sandCon.text = "2050";
    super.initState();
  }

  @override
  void dispose() {
    qualityController.dispose();
    labourCon.dispose();
    skilledLabourCon .dispose();
    cementCon.dispose();
    sandCon.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Calculation Form
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
            //Cancel
            CustomButton(
              width: 106.0,
              height: 36.0,
              text: "Calculate".toUpperCase(),
              textStyle: roboto(white, 13.0, 0.2, FontWeight.w500),
              onPressed: (){}, 
              buttonBgColor: violet, 
              fontColor: white
            ),
            //Save
            CustomButton(
              width: 106.0,
              height: 36.0,
              textStyle:  roboto(white, 13.0, 0.2, FontWeight.w500),
              text: "Save".toUpperCase(), 
              onPressed: (){}, 
              buttonBgColor: violet, 
              fontColor: white
            ),
          ],
        ),
        const SizedBox(height: 10,)
      ],
    );
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
        //breadth
        selectUnit == "meter"
        ?Row(
          children: [
            SizedBox(
              width: 68.0,
              child: Text("Breadth", style: roboto(black, 13, 0.0),)
            ),
            const Spacer(),
            CustomTextFieldWeb(
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

  //Rate From
  rate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('RATE', style: roboto(darkBlack, 14.0, 0.0,FontWeight.w400),),
        const SizedBox(height: 15.0),
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
              readOnly: labourRateType == "default" ? true : false,
              isReadable: labourRateType == "default" ? true : false,
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
                        labourRateType = "default";
                        labourCon.text = "740";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: labourRateType == "default" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                      ),
                      child: Center(
                        child: Text("Default", 
                          style: labourRateType == "default" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
                        )
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        labourRateType = "custom";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: labourRateType == "custom" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                        ),
                      child: Center(
                        child: Text("Custom", 
                          style: labourRateType == "custom" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
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
              readOnly: skilledLabourRateType == "default" ? true : false,
              isReadable: skilledLabourRateType == "default" ? true : false,
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
                        skilledLabourRateType = "default";
                        skilledLabourCon.text = "1050";
                      });
                    },
                    child: Container(
                      width: 37,
                      decoration: BoxDecoration(
                        color: skilledLabourRateType == "default" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                      ),
                      child: Center(
                        child: Text("Default", 
                          style: skilledLabourRateType == "default" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
                        )
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        skilledLabourRateType = "custom";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: skilledLabourRateType == "custom" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                        ),
                      child: Center(
                        child: Text("Custom", 
                          style: skilledLabourRateType == "custom" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
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
        //Cement
        Row(
          children: [
            SizedBox(
              width: 68.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Cement", style: roboto(black, 13, 0.0),),
                  SizedBox(height: 2.0.h,),
                  Text('(Per m.t)', style: roboto(black, 10, 0.0),)
                ],
              )
            ),
            CustomTextFieldWeb(
              textController: cementCon,
              keyboardType: TextInputType.number,
              readOnly: cementRateType == "default" ? true : false,
              isReadable: cementRateType == "default" ? true : false,
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
                        cementRateType = "default";
                        cementCon.text = "17854";
                      });
                    },
                    child: Container(
                      width: 37,
                      decoration: BoxDecoration(
                        color: cementRateType == "default" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                      ),
                      child: Center(
                        child: Text("Default", 
                          style: cementRateType == "default" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
                        )
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        cementRateType = "custom";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: cementRateType == "custom" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                        ),
                      child: Center(
                        child: Text("Custom", 
                          style: cementRateType == "custom" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
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
              readOnly: sandRateType == "default" ? true : false,
              isReadable: sandRateType == "default" ? true : false,
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
                        sandRateType = "default";
                        sandCon.text = "2050";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: sandRateType == "default" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                      ),
                      child: Center(
                        child: Text("Default", 
                          style: sandRateType == "default" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
                        )
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        sandRateType = "custom";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: sandRateType == "custom" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                        ),
                      child: Center(
                        child: Text("Custom", 
                          style: sandRateType == "custom" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
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
        const SizedBox(height: 13.0,),
        Divider(
          color: grey.withOpacity(0.15),
          thickness: 1.sp,
        ),
        const SizedBox(height: 8.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total Cost ".toUpperCase(),style: roboto(black, 14, 0.0),),
            const SizedBox(width: 15.0,),
            Flexible(
              child: Text("रु 0.00",style: roboto(black, 18, 0.0, FontWeight.w600, ), )
            ),
          ],
        ),
      ],
    );
  }
}