import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_button.dart';
import 'package:ccts/src/presentation/web_ui/widgets/custom_textfield_web.dart';
import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoofingWorkWeb extends StatefulWidget {
  const RoofingWorkWeb({super.key});

  @override
  State<RoofingWorkWeb> createState() => _RoofingWorkWebState();
}

class _RoofingWorkWebState extends State<RoofingWorkWeb> {
  String selectUnit = "meter";
  String rateType = "default";
  String labourType = "default";
  String skilledLabourType = "default";
  String cgiSheetType = "default";
  String nutBoltType = "default";
  String jhookType = "default";
  String washerType = "default";
  final qualityController = TextEditingController();
  final labourCon = TextEditingController();
  final skilledLabourCon = TextEditingController();
  final cgiSheetCon = TextEditingController();
  final nutBoltCon = TextEditingController();
  final jHookCon= TextEditingController();
  final washerCon = TextEditingController();

  @override
  void initState() {
    labourCon.text = "740";
    skilledLabourCon.text = "1050";
    cgiSheetCon.text = "462.03";
    nutBoltCon.text = "172";
    jHookCon.text = "50";
    washerCon.text = "10";
    super.initState();
  }

  @override
  void dispose() {
    qualityController.dispose();
    labourCon.dispose();
    skilledLabourCon.dispose();
    cgiSheetCon.dispose();
    nutBoltCon.dispose();
    jHookCon.dispose();
    washerCon.dispose();
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
              width: 108.0,
              height: 36.0,
              text: "Calculate".toUpperCase(),
              textStyle: roboto(white, 13.0, 0.2, FontWeight.w500),
              onPressed: (){}, 
              buttonBgColor: violet, 
              fontColor: white
            ),
            //Save
            CustomButton(
              width: 108.0,
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
        selectUnit == "meter"
        ?Row(
          children: [
            Text("Breadth", style: roboto(black, 13, 0.0),),
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
        //Cgi Sheets
        Row(
          children: [
            SizedBox(
              width: 68.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("CGI Sheets", style: roboto(black, 13, 0.0),),
                  SizedBox(height: 2.0.h,),
                  Text('(Per sq.m)', style: roboto(black, 10, 0.0),)
                ],
              )
            ),
            CustomTextFieldWeb(
              textController: cgiSheetCon,
              keyboardType: TextInputType.number,
              readOnly: cgiSheetType == "default" ? true : false,
              isReadable: cgiSheetType == "default" ? true : false,
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
                        cgiSheetType = "default";
                        cgiSheetCon.text = "462.03";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: cgiSheetType == "default" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                      ),
                      child: Center(
                        child: Text("Default", 
                          style: cgiSheetType == "default" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
                        )
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        cgiSheetType = "custom";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: cgiSheetType == "custom" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                        ),
                      child: Center(
                        child: Text("Custom", 
                          style: cgiSheetType == "custom" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
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
        //Nut Bolt
        Row(
          children: [
            SizedBox(
              width: 68.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nut Bolt", style: roboto(black, 13, 0.0),),
                  SizedBox(height: 2.0.h,),
                  Text('(Per unit)', style: roboto(black, 10, 0.0),)
                ],
              )
            ),
            CustomTextFieldWeb(
              textController: nutBoltCon,
              keyboardType: TextInputType.number,
              readOnly: nutBoltType == "default" ? true : false,
              isReadable: nutBoltType == "default" ? true : false,
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
                        nutBoltType = "default";
                        nutBoltCon.text = "172";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: nutBoltType == "default" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                      ),
                      child: Center(
                        child: Text("Default", 
                          style: nutBoltType == "default" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
                        )
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        nutBoltType = "custom";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: nutBoltType == "custom" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                        ),
                      child: Center(
                        child: Text("Custom", 
                          style: nutBoltType == "custom" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
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
        //J Hook
        Row(
          children: [
            SizedBox(
              width: 68.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("J-Hook", style: roboto(black, 13, 0.0),),
                  SizedBox(height: 2.0.h,),
                  Text('(Per Unit)', style: roboto(black, 10, 0.0),)
                ],
              )
            ),
            CustomTextFieldWeb(
              textController: jHookCon,
              keyboardType: TextInputType.number,
              readOnly: jhookType == "default" ? true : false,
              isReadable: jhookType == "default" ? true : false,
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
                        jhookType = "default";
                        jHookCon.text = "50";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: jhookType == "default" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                      ),
                      child: Center(
                        child: Text("Default", 
                          style: jhookType == "default" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
                        )
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        jhookType = "custom";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: jhookType == "custom" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                        ),
                      child: Center(
                        child: Text("Custom", 
                          style: jhookType == "custom" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
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
        //Washer
        Row(
          children: [
            SizedBox(
              width: 68.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Washer", style: roboto(black, 13, 0.0),),
                  SizedBox(height: 2.0.h,),
                  Text('(Per Unit)', style: roboto(black, 10, 0.0),)
                ],
              )
            ),
            CustomTextFieldWeb(
              textController: washerCon,
              keyboardType: TextInputType.number,
              readOnly: washerType == "default" ? true : false,
              isReadable: washerType == "default" ? true : false,
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
                        washerType = "default";
                        washerCon.text = "10";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: washerType == "default" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                      ),
                      child: Center(
                        child: Text("Default", 
                          style: washerType == "default" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
                        )
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        washerType = "custom";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: washerType == "custom" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                        ),
                      child: Center(
                        child: Text("Custom", 
                          style: washerType == "custom" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
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