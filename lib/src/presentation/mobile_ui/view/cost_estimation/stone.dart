import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/data/json_asset/app_data.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_appbar.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_button.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_dialog.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_textfield.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoneCalculation extends StatefulWidget {
  const StoneCalculation({super.key});

  @override
  State<StoneCalculation> createState() => _StoneCalculationState();
}

class _StoneCalculationState extends State<StoneCalculation> {
  //Custom and default flag
  String selectUnit = "meter";
  String labourRateType = "default";
  String skilledLabourRateType = "default";
  String stoneRateType = "default";
  List values = ["Stone Soiling", "Random rubble in 1:4 C/S Mortar", "Random rubble in 1:6 C/S Mortar"];

  //Rate Contollers 
  final qualityController = TextEditingController();
  final labourCon = TextEditingController();
  final skilledLabourCon = TextEditingController();
  final stoneCon = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  //Dimension Controller
  //For meter
  final lenghtCon = TextEditingController();
  final breadthCon = TextEditingController();
  final thicknessCon = TextEditingController();
  //For Feet
  final lengthFeetCon = TextEditingController();
  final breadthFeetCon = TextEditingController();
  final thicknessFeetCon = TextEditingController();
  final lengthInchCon = TextEditingController();
  final thicknessInchCon = TextEditingController();
  final breadthInchCon = TextEditingController();

  //to store user inputed value
  var length = 0.0;
  var breadth = 0.0;
  var thickness = 0.0;

  //Initial rates
  var labour = "740.00";
  var skilledLabour = "1050.00";
  var stone = "1950";

  //For calculation handeling
  double totalCost = 0.00;
  double totalArea = 0.00;
  bool isCalculated = false; //To show calculation details
  bool isUserInputEmpty = false; //Detect if user has input any dimension
  List resultDetailsList = [];//Store rate data
  List dimensionResultList = [];//Store dimension data
  //Scroll controller
  late ScrollController scrollController;
  
  //To check initial dropdown data
  indexQualitySelector(){
    for (int i=0; i<values.length;i++) {
      if (values[i] == qualityController.text) {
        return i; 
      }
    }
  }

  @override
  void initState() {
    qualityController.text = values[0];
    labourCon.text = labour;
    skilledLabourCon.text = skilledLabour;
    stoneCon.text = stone;
    scrollController = ScrollController()..addListener((){setState(() {});});
    super.initState();
  }

  @override
  void dispose() {
    qualityController.dispose();
    labourCon.dispose();
    skilledLabourCon.dispose();
    stoneCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBg,
      appBar: customAppBar(context,"Stone Works"),
      body: Stack(
        children: [
          ListView(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            children: [
              //location Container
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top:10.0.h, left: 10.w, right: 10.0.w, bottom: 0.0.h),
                padding: EdgeInsets.fromLTRB(12.0.w, 22.0.h, 12.0.w, 14.0.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0.r),
                  color: formBgColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //select location
                    selectLocation(),
                  ],
                ),
              ),
              //dimensionContainer
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top:10.0.h, left: 10.w, right: 10.0.w, bottom: 0.0.h),
                padding: EdgeInsets.symmetric(horizontal :12.0.w, vertical: 14.0.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0.r),
                  color: formBgColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //dimension form
                    dimension(),
                    SizedBox(height: 25.0.h,),
                    Divider(
                      color: grey.withOpacity(0.15),
                      thickness: 1.sp,
                    ),
                    SizedBox(height: 18.0.h,),
                    //quality picker
                    quality(),
                    SizedBox(height: 25.0.h,),
                    Divider(
                      color: grey.withOpacity(0.15),
                      thickness: 1.sp,
                    ),
                    SizedBox(height: 18.0.h,),
                    //rate form
                    rate(),
                  ],
                ),
              ),
              //rate Container
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top:10.0.h, left: 10.w, right: 10.0.w, bottom: 80.0.h),
                padding: EdgeInsets.fromLTRB(12.0.w, 22.0.h, 12.0.w, 14.0.h),
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
            ],
          ),
          //calculation button
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: formBgColor,
              padding: EdgeInsets.all(12.sp),
              child: CustomButton(
                text: "CALCULATE", 
                onPressed: (){
                  calculate();
                }, 
                buttonBgColor: violet, 
                fontColor: white,
                buttonRadius: 4.r,
                textStyle: roboto(white, 17.0, 0.2, FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    );
  }

  //location
  selectLocation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("SELECT LOCATION".toUpperCase(), style: roboto(darkBlack, 16.0, 0.0,FontWeight.w400),),
        SizedBox(height: 25.0.h,),
        Container(
          height: 60.0.h,
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
          child: DropdownFormField<Map<String, dynamic>>(
            decoration: InputDecoration(
              // contentPadding: EdgeInsets.fromLTRB(0.0.w, 4.2.h, 0.0.w, 3.8.h),
              prefixIconConstraints: BoxConstraints(
                minWidth: 12.0.w
              ),
              suffixIconConstraints: BoxConstraints(
                minWidth: 12.0.w
              ),
              border: InputBorder.none,
              labelText: "Select Disctict",
              hintStyle: roboto(const Color.fromARGB(255, 153, 153, 153),  15, 0.0),
              labelStyle: roboto( const Color.fromARGB(255, 153, 153, 153),  15, 0.0),
              suffixIcon: Padding(
                padding: EdgeInsets.only(top: 1.5.h, left: 10.0.w),
                child: const Icon(Icons.expand_more_rounded, color: lightGrey,),
              ),
            ),
            displayItemFn: (dynamic item) => Text(
              (item ?? {})['label'] ?? '',
              style: roboto(black, 16.0, 0.0),
            ),
            findFn: (dynamic str) async => municipalityList,
            selectedFn: (dynamic item1, dynamic item2) {
              if (item1 != null && item2 != null) {
                return item1['label'] == item2['label'];
              }
              return false;
            },
            filterFn: (dynamic item, str) => item['label'].toLowerCase().indexOf(str.toLowerCase()) >= 0,
            dropdownItemFn: (dynamic item, int position, bool focused,bool selected, Function() onTap) =>
            ListTile(
              title: Text(item['label']),
              tileColor: focused ? const Color.fromARGB(20, 0, 0, 0) : Colors.transparent,
              onTap: (){
                onTap();
                for(int i = 0; i < stoneRate.length; i++){
                  if(stoneRate[i]["name"] == item['label']){
                    setState(() {
                      labourCon.text = stoneRate[i]["labourPrice"].toString();
                      labour  = stoneRate[i]["labourPrice"].toString();
                      skilledLabourCon.text  = stoneRate[i]["skilledLabourPrice"].toString();
                      skilledLabour  = stoneRate[i]["skilledLabourPrice"].toString();
                      stoneCon.text  = stoneRate[i]["stonePrice"].toString();
                      stone  = stoneRate[i]["stonePrice"].toString();
                    });
                  }
                }
              }
            ),
          )
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
            Text("Dimensions".toUpperCase(), style: roboto(darkBlack, 16.0, 0.0),),
            const Spacer(),
            Container(
              height: 35.0.h,
              width: 134.0.w,
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
                      if(isCalculated == false){
                        setState(() {
                          selectUnit = "meter";
                          lenghtCon.clear();
                          breadthCon.clear();
                          thicknessCon.clear();
                        });
                      } else{
                        customDialogBox(
                          context, 
                          "CHANGE UNIT? \n\n All your previous data will be lost.", 
                          //On Yes
                          (){
                            setState(() {
                              selectUnit = "meter";
                              isCalculated = false;
                              length = 0.0;
                              lenghtCon.clear();
                              breadth = 0.0;
                              breadthCon.clear();
                              thickness = 0.0;
                              thicknessCon.clear();
                              
                              //Clear reslut details
                              resultDetailsList.clear();
                              dimensionResultList.clear();
                              totalCost = 0.00;
                              totalArea = 0.00;
                            });
                            Navigator.pop(context);
                          },
                          // On No
                          (){
                            Navigator.pop(context);
                          }
                        );
                      }
                    },
                    child: Container(
                      width: 66.0.w,
                      decoration: BoxDecoration(
                        color: selectUnit == "meter" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                      ),
                      child: Center(
                        child: Text("Meter", 
                          style: selectUnit == "meter" ? roboto(white, 14.0, 0.0) : roboto(black, 14.0, 0.0),
                        )
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      if(isCalculated == false){
                        setState(() {
                          selectUnit = "feet";
                          lengthFeetCon.clear();
                          lengthInchCon.clear();
                          breadthFeetCon.clear();
                          breadthInchCon.clear();
                        });
                      } else{
                        customDialogBox(
                          context, 
                          "CHANGE UNIT? \n\n All your previous data will be lost.",
                          //On Yes
                          (){
                            setState(() {
                              selectUnit = "feet";
                              isCalculated = false;
                              length = 0.0;
                              lengthFeetCon.clear();
                              lengthInchCon.clear();
                              breadth = 0.0;
                              breadthFeetCon.clear();
                              breadthInchCon.clear();
                              thickness = 0.0;
                              thicknessFeetCon.clear();
                              thicknessInchCon.clear();

                              //Clear reslut details
                              resultDetailsList.clear();
                              dimensionResultList.clear();
                              totalCost = 0.00;
                              totalArea = 0.00;
                            });
                            Navigator.pop(context);
                          },
                          //On No
                          (){
                            Navigator.pop(context);
                          }
                        );
                      }
                    },
                    child: Container(
                      width: 66.0.w,
                      decoration: BoxDecoration(
                        color: selectUnit == "feet" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                        ),
                      child: Center(
                        child: Text("Feet",
                          style: selectUnit == "feet" ? roboto(white, 14.0, 0.0) : roboto(black, 14.0, 0.0),
                        )
                      )
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 25.0.h,),
        selectUnit == "meter"
        ?Row(
          children: [
            Text("Length", style: roboto(black, 15, 0.0),),
            const Spacer(),
            CustomTextField(
              textController: lenghtCon,
              keyboardType: TextInputType.number,
              textFieldWidth: 230.0.w,
              textfieldHeight: 45.0.h,
              hintText: "Enter Length",
              suffixIcon: Text(
                "m",
                style: roboto(const Color.fromARGB(255, 153, 153, 153), 14.0, 0.0),
              ),
              onChange: (val){
                setState(() {
                  if(val != ""){
                    length = double.parse(val);
                  }else{
                    length = 0;
                  }
                });
              },
            )
          ],
        ):Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 70.0.w,
              child: Text("Length", style: roboto(black, 15, 0.0),)
            ),
            CustomTextField(
              textController: lengthFeetCon,
              keyboardType: TextInputType.number,
              textFieldWidth: 108.0.w,
              textfieldHeight: 45.0.h,
              hintText: "Feet",
              onChange: (val){
                setState(() {
                  if(val != ""){
                    length = double.parse(val) + (double.parse(lengthInchCon.text.isEmpty ? "0.00" : lengthInchCon.text) * 0.0833);
                  }else{
                    length = 0;
                  }
                });
              },
            ),
            CustomTextField(
              textController: lengthInchCon,
              keyboardType: TextInputType.number,
              textFieldWidth: 108.0.w,
              textfieldHeight: 45.0.h,
              hintText: "Inch",
              onChange: (val){
                setState(() {
                  if(val != ""){
                    length = (double.parse(val) * 0.0833) + double.parse(lengthFeetCon.text.isEmpty ? "0.00" : lengthFeetCon.text);
                  }else{
                    length = 0;
                  }
                });
              },
            )
          ],
        ),
        SizedBox(height: 15.0.h,),
        selectUnit == "meter"
        ?Row(
          children: [
            Text("Thickness", style: roboto(black, 15, 0.0),),
            const Spacer(),
            CustomTextField(
              textController: thicknessCon,
              keyboardType: TextInputType.number,
              textFieldWidth: 230.0.w,
              textfieldHeight: 45.0.h,
              hintText: "Enter Thickness",
              suffixIcon: Text(
                "m",
                style: roboto(const Color.fromARGB(255, 153, 153, 153), 14.0, 0.0),
              ),
              onChange: (val){
                setState(() {
                  if(val != ""){
                    thickness = double.parse(val);
                  }else{
                    thickness = 0;
                  }
                });
              },
            )
          ],
        )
        :Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 70.0.w,
              child: Text("Thickness", style: roboto(black, 15, 0.0),)
            ),
            CustomTextField(
              textController: thicknessFeetCon,
              keyboardType: TextInputType.number,
              textFieldWidth: 108.0.w,
              textfieldHeight: 45.0.h,
              hintText: "Feet",
              onChange: (val){
                setState(() {
                  if(val != ""){
                    thickness = double.parse(val) + (double.parse(thicknessInchCon.text.isEmpty ? "0.00" : thicknessInchCon.text) * 0.0833);
                  }else{
                    thickness = 0;
                  }
                });
              },
            ),
            CustomTextField(
              textController: thicknessInchCon,
              keyboardType: TextInputType.number,
              textFieldWidth: 108.0.w,
              textfieldHeight: 45.0.h,
              hintText: "Inch",
              onChange: (val){
                setState(() {
                  if(val != ""){
                    thickness = (double.parse(val) * 0.0833) + double.parse(thicknessFeetCon.text.isEmpty ? "0.00" : thicknessFeetCon.text);
                  }else{
                    thickness = 0;
                  }
                });
              },
            )
          ],
        ),
        SizedBox(height: 15.0.h,),
        selectUnit == "meter"
        ?Row(
          children: [
            Text("Breadth", style: roboto(black, 15, 0.0),),
            const Spacer(),
            CustomTextField(
              textController: breadthCon,
              keyboardType: TextInputType.number,
              textFieldWidth: 230.0.w,
              textfieldHeight: 45.0.h,
              hintText: "Enter Breadth",
              suffixIcon: Text(
                "m",
                style: roboto(const Color.fromARGB(255, 153, 153, 153), 14.0, 0.0),
              ),
              onChange: (val){
                setState(() {
                  if(val != ""){
                    breadth = double.parse(val);
                  }else{
                    breadth = 0;
                  }
                });
              },
            )
          ],
        )
        :Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 70.0.w,
              child: Text("Breadth", style: roboto(black, 15, 0.0),)
            ),
            CustomTextField(
              textController: breadthFeetCon,
              keyboardType: TextInputType.number,
              textFieldWidth: 108.0.w,
              textfieldHeight: 45.0.h,
              hintText: "Feet",
              onChange: (val){
                setState(() {
                  if(val != ""){
                    breadth = double.parse(val) + (double.parse(breadthInchCon.text.isEmpty ? "0.00" : breadthInchCon.text)*  0.0833);
                  }
                  else{
                    breadth = 0;
                  }
                });
              },
            ),
            CustomTextField(
              textController: breadthInchCon,
              keyboardType: TextInputType.number,
              textFieldWidth: 108.0.w,
              textfieldHeight: 45.0.h,
              hintText: "Inch",
              onChange: (val){
                setState(() {
                  if(val != ""){
                    breadth = (double.parse(val) * 0.0833) + double.parse(breadthFeetCon.text.isEmpty ? "0.00" : breadthFeetCon.text);
                  }
                  else{
                    breadth = 0;
                  }
                });
              },
            )
          ],
        ),
      ],
    );
  }

  //quality picker
  quality() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Quality".toUpperCase(), style: roboto(darkBlack, 16.0, 0.0),),
        SizedBox(height: 25.0.h,),
        CustomTextField(
          ontap: (){
            showModalBottomSheet(
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
                              child: Text("Cancel",style: roboto(violet, 16.0, 0.0),),
                              onPressed: (){
                                Navigator.pop(context);
                              },
                            ),
                            MaterialButton(
                              child: Text("Done",style: roboto(violet, 16.0, 0.0),),
                              onPressed: (){
                                if(qualityController.text == ''){
                                  setState(() {
                                  qualityController.text = values[0];
                                  });
                                }
                                Navigator.pop(context);
                              },
                            )
                          ]
                        ),
                      ),
                      Expanded(
                        child: CupertinoPicker(
                          scrollController: FixedExtentScrollController(initialItem: indexQualitySelector()),
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
          },
          textController: qualityController,
          readOnly: true,
          keyboardType: TextInputType.number,
          textFieldWidth: 340.0.w,
          textfieldHeight: 45.0.h,
          hintText: "Select an Item",
          suffixIcon: const Icon(Icons.expand_more_rounded, color: lightGrey,),
        ),
      ],
    );
  }
  
  //rate form
  rate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('RATE  ', style: roboto(darkBlack, 16.0, 0.0,FontWeight.w400),),
        SizedBox(height: 25.0.h,),
        //Labour
        Row(
          children: [
            SizedBox(
              width: 88.0.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Labour", style: roboto(black, 15, 0.0),),
                  SizedBox(height: 2.0.h,),
                  Text('(Per Person)', style: roboto(black, 10.5, 0.0),)
                ],
              )
            ),
            CustomTextField(
              textController: labourCon,
              readOnly: labourRateType == "default" ? true : false,
              isReadable: labourRateType == "default" ? true : false,
              keyboardType: TextInputType.number,
              textFieldWidth: 108.0.w,
              textfieldHeight: 45.0.h,
              prefixIcon: Text("रु", style: roboto(const Color.fromARGB(255, 153, 153, 153), 18.5, 0.0),),
            ),
            const Spacer(),
            Container(
              height: 30.0.h,
              width: 105.0.w,
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
                        labourCon.text = labour;
                      });
                    },
                    child: Container(
                      width: 51.5.w,
                      decoration: BoxDecoration(
                        color: labourRateType == "default" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                      ),
                      child: Center(
                        child: Text("Default", 
                          style: labourRateType == "default" ? roboto(white, 11.0, 0.0) : roboto(black, 11.0, 0.0),
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
                      width: 51.5.w,
                      decoration: BoxDecoration(
                        color: labourRateType == "custom" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                      ),
                      child: Center(
                        child: Text("Custom", 
                          style: labourRateType == "custom" ? roboto(white, 11.0, 0.0) : roboto(black, 11.0, 0.0),
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
              width: 88.0.w,
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Skilled Labour", style: roboto(black, 15, 0.0), maxLines: 2,),
                  SizedBox(height: 2.0.h,),
                  Text('(Per Person)', style: roboto(black, 10.5, 0.0),)
                ],
              )
            ),
            CustomTextField(
              textController: skilledLabourCon,
              readOnly: skilledLabourRateType == "default" ? true : false,
              isReadable: skilledLabourRateType == "default" ? true : false,
              keyboardType: TextInputType.number,
              textFieldWidth: 108.0.w,
              textfieldHeight: 45.0.h,
              prefixIcon: Text("रु", style: roboto(const Color.fromARGB(255, 153, 153, 153), 18.5, 0.0),),
            ),
            const Spacer(),
            Container(
              height: 30.0.h,
              width: 105.0.w,
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
                        skilledLabourCon.text = skilledLabour;
                      });
                    },
                    child: Container(
                      width: 51.5.w,
                      decoration: BoxDecoration(
                        color: skilledLabourRateType == "default" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                      ),
                      child: Center(
                        child: Text("Default", 
                          style: skilledLabourRateType == "default" ? roboto(white, 11.0, 0.0) : roboto(black, 11.0, 0.0),
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
                      width: 51.5.w,
                      decoration: BoxDecoration(
                        color: skilledLabourRateType == "custom" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                        ),
                      child: Center(
                        child: Text("Custom", 
                          style: skilledLabourRateType == "custom" ? roboto(white, 11.0, 0.0) : roboto(black, 11.0, 0.0),
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
        //Stone
        Row(
          children: [
            SizedBox(
              width: 88.0.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Stone", style: roboto(black, 15, 0.0),),
                  SizedBox(height: 2.0.h,),
                  Text('(Per cu.m.)', style: roboto(black, 10.5, 0.0),)
                ],
              )
            ),
            CustomTextField(
              textController: stoneCon,
              readOnly: stoneRateType == "default" ? true : false,
              isReadable: stoneRateType == "default" ? true : false,
              keyboardType: TextInputType.number,
              textFieldWidth: 108.0.w,
              textfieldHeight: 45.0.h,
              prefixIcon: Text("रु", style: roboto(const Color.fromARGB(255, 153, 153, 153), 18.5, 0.0),),
            ),
            const Spacer(),
            Container(
              height: 30.0.h,
              width: 105.0.w,
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
                        stoneRateType = "default";
                        stoneCon.text = stone;
                      });
                    },
                    child: Container(
                      width: 51.5.w,
                      decoration: BoxDecoration(
                        color: stoneRateType == "default" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                      ),
                      child: Center(
                        child: Text("Default", 
                          style: stoneRateType == "default" ? roboto(white, 11.0, 0.0) : roboto(black, 11.0, 0.0),
                        )
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        stoneRateType = "custom";
                      });
                    },
                    child: Container(
                      width: 51.5.w,
                      decoration: BoxDecoration(
                        color: stoneRateType == "custom" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                        ),
                      child: Center(
                        child: Text("Custom", 
                          style: stoneRateType == "custom" ? roboto(white, 11.0, 0.0) : roboto(black, 11.0, 0.0),
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

  //Total Cost Calclation
  void totalCostCalculation(){
    
  }

  //Calculate
  calculate(){
    //To remove focused keyboard
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      //Check if user input is empty
      if(length == 0 || breadth == 0 || thickness == 0){
        isUserInputEmpty = true;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(milliseconds: 1000),
            backgroundColor: red.withOpacity(0.9),
            dismissDirection: DismissDirection.up,
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height - 100,
              right: 20.w,
              left: 20.w),
            behavior: SnackBarBehavior.floating,
            content: Text("Please fill all the Dimensions.", style: roboto(white, 14, 0.0),),
          )
        );
        scrollController.animateTo(
        scrollController.position.minScrollExtent,
        duration: const Duration(milliseconds: 800), 
          curve: Curves.elasticInOut,
        );
        return;
      }else{
        isUserInputEmpty = false;
      }
      //Control Scroll
      scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 800), 
        curve: Curves.elasticInOut,
      );

      //Calculation status
      isCalculated = true;

      //Total Calculations
      totalCost = length * breadth * thickness + double.parse(labourCon.text) + double.parse(skilledLabourCon.text) + double.parse(stoneCon.text);
      totalArea = length * breadth * thickness;

      //To show calculation details
      resultDetailsList.clear();
      dimensionResultList.clear();
      //For Dimension
      dimensionResultList.addAll([
        {
          "type" : "Length",
          "value" : "$length",
        },
        {
          "type" : "Breadth",
          "value" : "$breadth",
        },
        {
          "type" : "Thickness",
          "value" : "$thickness",
        },
      ]);
      //For rate
      resultDetailsList.addAll(
        [
          {
            "itemName" : "Labour",
            "quantity" : "${isUserInputEmpty ? 0 : 1.5} man days",
            "cost" : "रु  ${(isUserInputEmpty ? 0 : double.parse(labourCon.text)).toStringAsFixed(2)}"
          },
          {
            "itemName" : "Skilled Lb.",
            "quantity" : "${isUserInputEmpty ? 0 : 1.5} man days",
            "cost" : "रु  ${(isUserInputEmpty ? 0 : double.parse(skilledLabourCon.text)).toStringAsFixed(2)}"
          },
          {
            "itemName" : "Stone",
            "quantity" : "${isUserInputEmpty ? 0 : 1.5} cu.m",
            "cost" : "रु  ${(isUserInputEmpty ? 0 : double.parse(stoneCon.text)).toStringAsFixed(2)}"
          },
        ]
      );
    });
  }

  //result
  result() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Result".toUpperCase(), style: roboto(darkBlack, 16.0, 0.0,FontWeight.w400),),
        SizedBox(height: 25.0.h,),
        //Dimension Results
        dimensionResultDetails(),
        Divider(
          color: grey.withOpacity(0.15),
          thickness: 1.sp,
        ),
        SizedBox(height: 12.0.h,),
        //Total Area
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total Area ".toUpperCase(),style: roboto(black, 16, 0.0),),
            SizedBox(width: 20.0.w,),
            Flexible(
              child: Text("${totalArea.toStringAsFixed(2)} ${selectUnit == "meter" ? "sq.m" : "ft"}",style: roboto(black, 20, 0.0, FontWeight.w600, ), )
            ),
          ],
        ),
        SizedBox(height: 40.0.h,),
        //Rate result details
        rateResultDetails(),
        Divider(
          color: grey.withOpacity(0.15),
          thickness: 1.sp,
        ),
        SizedBox(height: 12.0.h,),
        //Total Cost
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total Cost ".toUpperCase(),style: roboto(black, 16, 0.0),),
            SizedBox(width: 20.0.w,),
            Flexible(
              child: Text("रु ${(isUserInputEmpty ? 0 : totalCost).toStringAsFixed(2)}",style: roboto(black, 20, 0.0, FontWeight.w600, ), )
            ),
          ],
        ),
      ],
    );
  }

  //Dimension Calculation Result Daeaitls
  dimensionResultDetails(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Dimensions", style: roboto(black, 15.0, 0.0)),
        SizedBox(height: 14.0.h,),
        //Dimension Calculation
        dimensionResultList.isEmpty ?
        const SizedBox()
        :Padding(
          padding: EdgeInsets.only(bottom: 18.0.h),
          child: ListView.separated(
            itemCount: dimensionResultList.length,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context , index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0.r),
                  color:  Colors.grey.withOpacity(0.1),
                ),
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100.w,
                      child: Text(dimensionResultList[index]["type"].toString(), style: roboto(grey, 15, 0.0),)
                    ),
                    SizedBox(
                      width: 100.w,
                      child: Text(dimensionResultList[index]["value"].toString(), style: roboto(grey, 15, 0.0),)
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 5.h,),
          ),
        ),
      ],
    );
  }

  //Rate result Details
  rateResultDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Rate Headings
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 100.w,
              child: Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Text("Items",style: roboto(black, 15, 0.0),),
              )
            ),
            SizedBox(
              width: 100.w,
              child: Padding(
                padding: EdgeInsets.only(left: 2.w),
                child: Text("Quantity",style: roboto(black, 15, 0.0),),
              )
            ),
            SizedBox(
              width: 100.w,
              child: Text("Cost",style: roboto(black, 15, 0.0),)
            ),
          ],
        ),
        SizedBox(height: 18.0.h,),
        //Calculation details List
        resultDetailsList.isEmpty ?
        const SizedBox()
        :Padding(
          padding: EdgeInsets.only(bottom: 18.0.h),
          child: ListView.separated(
            itemCount: resultDetailsList.length,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context , index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0.r),
                  color: Colors.grey.withOpacity(0.1),
                ),
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100.w,
                      child: Text(resultDetailsList[index]["itemName"].toString(),style: roboto(grey, 15, 0.0),)
                    ),
                    SizedBox(
                      width: 100.w,
                      child: Text(resultDetailsList[index]["quantity"].toString(),style: roboto(grey, 15, 0.0),)
                    ),
                    SizedBox(
                      width: 100.w,
                      child: Padding(
                        padding: EdgeInsets.only(left : 5.0.w),
                        child: Text(resultDetailsList[index]["cost"].toString(),style: roboto(grey, 15, 0.0),),
                      )
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 5.h,),
          ),
        )
      ],
    );
  }
}