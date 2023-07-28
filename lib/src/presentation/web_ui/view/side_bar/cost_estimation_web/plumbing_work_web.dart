import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/data/json_asset/app_data.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_button.dart';
import 'package:ccts/src/presentation/web_ui/widgets/custom_textfield_web.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlumbingWorksWeb extends StatefulWidget {
  const PlumbingWorksWeb({super.key});

  @override
  State<PlumbingWorksWeb> createState() => _PlumbingWorksWebState();
}

class _PlumbingWorksWebState extends State<PlumbingWorksWeb> {
  String selectUnit = "meter";
  String rateType = "default";
  String plumberType = "default";
  String helperType = "default";
  String commodeType = "default";
  String angleValveType = "default";
  String pvcPipeType = "default";
  String connectorType = "default";
  String autoFlushType = "default";
  String cisternType = "default";
  String miscType = "default";
  List values = ["Chinese Comoad", "Indian Basin", "Water Tap", "Flush"];
  final dropDownController = TextEditingController();
  final plumberCon = TextEditingController();
  final helperCon = TextEditingController();
  final commodeCon = TextEditingController();
  final pvcPipeCon = TextEditingController();
  final connectorCon = TextEditingController();
  final angleValveCon = TextEditingController();
  final autoFlushCon = TextEditingController();
  final cisternCon = TextEditingController();
  final miscCon = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    plumberCon.text = "800";
    helperCon.text = "540";
    commodeCon.text = "12000";
    pvcPipeCon.text = "315";
    connectorCon.text = "290";
    angleValveCon.text = "1098";
    autoFlushCon.text = "9055";
    cisternCon.text = "3230";
    miscCon.text = "600";
    super.initState();
  }

  @override
  void dispose() {
    dropDownController.dispose();
    plumberCon.dispose();
    helperCon.dispose();
    commodeCon.dispose();
    pvcPipeCon.text = "";
    connectorCon.text = "";
    angleValveCon.text = "";
    autoFlushCon.text = "";
    cisternCon.text = "";
    miscCon.text = "";
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
              //Items Form
              items(),
              const SizedBox(height: 20.0),
              Divider(
                color: grey.withOpacity(0.15),
                thickness: 1.sp,
              ),
              const SizedBox(height: 13.0),
              //quantity
              quantity(),
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
  quantity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Quantity".toUpperCase(), style: roboto(darkBlack, 14.0, 0.0),),
        const SizedBox(height: 20,),
        CustomTextFieldWeb(
          keyboardType: TextInputType.number,
          textFieldWidth: 340.0.w,
          textfieldHeight: 30.0,
          contentTopPadding: -6,
          hintText: "Enter quantity",
          suffixIcon: Text("units", style: roboto(const Color.fromARGB(255, 153, 153, 153), 12.0, 0.0),),
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
                    dropDownController.text = values[value];
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
  items() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Items".toUpperCase(), style: roboto(darkBlack, 14.0, 0.0),),
        SizedBox(height: 25.0.h,),
        CustomTextFieldWeb(
          ontap: (){
            selectItemBottomSheet();
          },
          textController: dropDownController,
          readOnly: true,
          keyboardType: TextInputType.number,
          textFieldWidth: 340.0.w,
          textfieldHeight: 30.0,
          contentTopPadding: -0.5,
          hintText: "Select an Item",
          suffixIcon: const Icon(Icons.expand_more_rounded, size : 22, color: lightGrey,),
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
        //Plumber
        Row(
          children: [
            SizedBox(
              width: 68,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Plumber", style: roboto(black, 13, 0.0),),
                  const SizedBox(height: 2.0),
                  Text('(Per Person)', style: roboto(black, 10, 0.0),)
                ],
              )
            ),
            CustomTextFieldWeb(
              textController: plumberCon,
              keyboardType: TextInputType.number,
              textFieldWidth: 74,
              readOnly: plumberType == "default" ? true : false,
              isReadable: plumberType == "default" ? true : false,
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
                        plumberType = "default";
                        plumberCon.text = "800";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: plumberType == "default" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                      ),
                      child: Center(
                        child: Text("Default", 
                          style: plumberType == "default" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
                        )
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        plumberType = "custom";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: plumberType == "custom" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                        ),
                      child: Center(
                        child: Text("Custom", 
                          style: plumberType == "custom" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
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
        //Helper
        Row(
          children: [
            SizedBox(
              width: 68.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Helper", style: roboto(black, 13, 0.0),),
                  const SizedBox(height: 2.0),
                  Text('(Per Person)', style: roboto(black, 10, 0.0),)
                ],
              )
            ),
            CustomTextFieldWeb(
              textController: helperCon,
              keyboardType: TextInputType.number,
              readOnly: helperType == "default" ? true : false,
              isReadable: helperType == "default" ? true : false,
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
                        helperType = "default";
                        helperCon.text = "540";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: helperType == "default" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                      ),
                      child: Center(
                        child: Text("Default", 
                          style: helperType == "default" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
                        )
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        helperType = "custom";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: helperType == "custom" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                        ),
                      child: Center(
                        child: Text("Custom", 
                          style: helperType == "custom" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
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
        //Commode
        Row(
          children: [
            SizedBox(
              width: 68.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Commode", style: roboto(black, 13, 0.0),),
                  SizedBox(height: 2.0.h,),
                  Text('(Per piece)', style: roboto(black, 10, 0.0),)
                ],
              )
            ),
            CustomTextFieldWeb(
              textController: commodeCon,
              keyboardType: TextInputType.number,
              readOnly: commodeType == "default" ? true : false,
              isReadable: commodeType == "default" ? true : false,
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
                        commodeType = "default";
                        commodeCon.text = "12000";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: commodeType == "default" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                      ),
                      child: Center(
                        child: Text("Default", 
                          style: commodeType == "default" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
                        )
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        commodeType = "custom";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: commodeType == "custom" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                        ),
                      child: Center(
                        child: Text("Custom", 
                          style: commodeType == "custom" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
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
        //PVC Pipe
        Row(
          children: [
            SizedBox(
              width: 68.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("PVC Pipe", style: roboto(black, 13, 0.0),),
                  SizedBox(height: 2.0.h,),
                  Text('(Per piece)', style: roboto(black, 10, 0.0),)
                ],
              )
            ),
            CustomTextFieldWeb(
              textController: pvcPipeCon,
              keyboardType: TextInputType.number,
              readOnly: pvcPipeType == "default" ? true : false,
              isReadable: pvcPipeType == "default" ? true : false,
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
                        pvcPipeType = "default";
                        pvcPipeCon.text = "315";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: pvcPipeType == "default" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                      ),
                      child: Center(
                        child: Text("Default", 
                          style: pvcPipeType == "default" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
                        )
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        pvcPipeType = "custom";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: pvcPipeType == "custom" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                        ),
                      child: Center(
                        child: Text("Custom", 
                          style: pvcPipeType == "custom" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
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
        //Connector
        Row(
          children: [
            SizedBox(
              width: 68.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Connector", style: roboto(black, 13, 0.0),),
                  SizedBox(height: 2.0.h,),
                  Text('(Per piece)', style: roboto(black, 10, 0.0),)
                ],
              )
            ),
            CustomTextFieldWeb(
              textController: connectorCon,
              keyboardType: TextInputType.number,
              readOnly: connectorType == "default" ? true : false,
              isReadable: connectorType == "default" ? true : false,
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
                        connectorType = "default";
                        connectorCon.text = "290";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: connectorType == "default" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                      ),
                      child: Center(
                        child: Text("Default", 
                          style: connectorType == "default" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
                        )
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        connectorType = "custom";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: connectorType == "custom" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                        ),
                      child: Center(
                        child: Text("Custom", 
                          style: connectorType == "custom" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
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
        //Angle Valve
        Row(
          children: [
            SizedBox(
              width: 68.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Angle Valve", style: roboto(black, 13, 0.0),),
                  SizedBox(height: 2.0.h,),
                  Text('(Per piece)', style: roboto(black, 10, 0.0),)
                ],
              )
            ),
            CustomTextFieldWeb(
              textController: angleValveCon,
              keyboardType: TextInputType.number,
              readOnly: angleValveType == "default" ? true : false,
              isReadable: angleValveType == "default" ? true : false,
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
                        angleValveType = "default";
                        angleValveCon.text = "1098";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: angleValveType == "default" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                      ),
                      child: Center(
                        child: Text("Default", 
                          style: angleValveType == "default" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
                        )
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        angleValveType = "custom";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: angleValveType == "custom" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                        ),
                      child: Center(
                        child: Text("Custom", 
                          style: angleValveType == "custom" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
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
        //Auto Flush
        Row(
          children: [
            SizedBox(
              width: 68.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Auto Flush", style: roboto(black, 13, 0.0),),
                  SizedBox(height: 2.0.h,),
                  Text('(Per piece)', style: roboto(black, 10, 0.0),)
                ],
              )
            ),
            CustomTextFieldWeb(
              textController: autoFlushCon,
              keyboardType: TextInputType.number,
              readOnly: autoFlushType == "default" ? true : false,
              isReadable: autoFlushType == "default" ? true : false,
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
                        autoFlushType = "default";
                        autoFlushCon.text = "9055";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: autoFlushType == "default" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                      ),
                      child: Center(
                        child: Text("Default", 
                          style: autoFlushType == "default" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
                        )
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        autoFlushType = "custom";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: autoFlushType == "custom" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                        ),
                      child: Center(
                        child: Text("Custom", 
                          style: autoFlushType == "custom" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
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
        //Cistern
        Row(
          children: [
            SizedBox(
              width: 68.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Cistern", style: roboto(black, 13, 0.0),),
                  SizedBox(height: 2.0.h,),
                  Text('(Per piece)', style: roboto(black, 10, 0.0),)
                ],
              )
            ),
            CustomTextFieldWeb(
              textController: cisternCon,
              keyboardType: TextInputType.number,
              readOnly: cisternType == "default" ? true : false,
              isReadable: cisternType == "default" ? true : false,
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
                        cisternType = "default";
                        cisternCon.text = "3230";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: cisternType == "default" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                      ),
                      child: Center(
                        child: Text("Default", 
                          style: cisternType == "default" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
                        )
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        cisternType = "custom";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: cisternType == "custom" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                        ),
                      child: Center(
                        child: Text("Custom", 
                          style: cisternType == "custom" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
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
        //Misc
        Row(
          children: [
            SizedBox(
              width: 68.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Misc", style: roboto(black, 13, 0.0),),
                  SizedBox(height: 2.0.h,),
                  Text('(Per piece)', style: roboto(black, 10, 0.0),)
                ],
              )
            ),
            CustomTextFieldWeb(
              textController: miscCon,
              keyboardType: TextInputType.number,
              readOnly: miscType == "default" ? true : false,
              isReadable: miscType == "default" ? true : false,
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
                        miscType = "default";
                        miscCon.text = "600";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: miscType == "default" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                      ),
                      child: Center(
                        child: Text("Default", 
                          style: miscType == "default" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
                        )
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        miscType = "custom";
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: miscType == "custom" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                        ),
                      child: Center(
                        child: Text("Custom", 
                          style: miscType == "custom" ? roboto(white, 10.0, 0.0) : roboto(black, 10.0, 0.0),
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