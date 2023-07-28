import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/data/json_asset/app_data.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_appbar.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_button.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_dialog.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_textfield.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConcreteWorks extends StatefulWidget {
  const ConcreteWorks({super.key});

  @override
  State<ConcreteWorks> createState() => _ConcreteWorksState();
}

class _ConcreteWorksState extends State<ConcreteWorks> {
  //Flag to control default and custom selection
  String selectUnit = "meter";
  String rateType = "default";
  String labourType = "default";
  String skilledLabourType = "default";
  String agg40mmType = "default";
  String agg20mmType = "default";
  String cementType = "default";
  String sandType = "default";

  //Rate Controllers
  final qualityController = TextEditingController();
  final labourCon = TextEditingController();
  final skilledLabourCon = TextEditingController();
  final agg40mmCon = TextEditingController();
  final agg20mmCon = TextEditingController();
  final cementCon = TextEditingController();
  final sandCon = TextEditingController();
  List values = [
    "Foundation (1:3:6 Mix)", 
    "Foundation (1:2:4 Mix)", 
    "Super Structure (1:2:4 Mix)",
    "Super Structure (1:1:5:3 Mix)",
  ];

  //Dimension Controller
  //For meter
  final lenghtCon = TextEditingController();
  final breadthCon = TextEditingController();
  final heightCon = TextEditingController();
  //For Feet
  final lengthFeetCon = TextEditingController();
  final breadthFeetCon = TextEditingController();
  final heightFeetCon = TextEditingController();
  final lengthInchCon = TextEditingController();
  final heightInchCon = TextEditingController();
  final breadthInchCon = TextEditingController();

  //Calculation handeling
  double totalCost = 0.00;
  double totalArea = 0.00;
  bool isCalculated = false; //To show calculation details
  bool isUserInputEmpty = false; //Detect if user has input any dimension
  List resultDetailsList = [];//Store rate data
  List dimensionResultList = [];//Store dimension data
  
  //to store user inputed value
  var length = 0.0;
  var breadth = 0.0;
  var height = 0.0;

  //Initial rates
  var labour = "740.00";
  var skilledLabour = "1050.00";
  var agg40mm = "1850";
  var agg20mm = "1845";
  var cement = "17854";
  var sand = "2050";

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
    agg40mmCon.text = agg40mm;
    agg20mmCon.text = agg20mm;
    cementCon.text = cement;
    sandCon.text = sand;
    scrollController = ScrollController()..addListener((){setState(() {});});
    super.initState();
  }

  @override
  void dispose() {
    qualityController.dispose();
    labourCon.dispose();
    skilledLabourCon.dispose();
    agg40mmCon.dispose();
    agg20mmCon.dispose();
    cementCon.dispose();
    sandCon.dispose();
    lenghtCon.dispose();
    breadthCon.dispose();
    heightCon.dispose();
    heightFeetCon.dispose();
    heightInchCon.dispose();
    lengthFeetCon.dispose();
    breadthFeetCon.dispose();
    lengthInchCon.dispose();
    breadthInchCon.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBg,
      appBar: customAppBar(context, "Concrete Works"),
      body: Stack(
        children: [
          ListView(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            children: [
              //Location selection Form
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
                    //Select Location
                    selectLocation(),
                  ],
                ),
              ),
              //Calculation Form
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 10.0.h, left: 10.0.w, right: 10.0.w),
                padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 14.0.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0.r),
                  color: formBgColor,
                ),
                child: Column(
                  children: [
                    //Dimesion Form
                    dimension(),
                    SizedBox(height: 25.0.h,),
                    Divider(
                      color: grey.withOpacity(0.15),
                      thickness: 1.sp,
                    ),
                    SizedBox(height: 18.0.h,),
                    //Quality Picker
                    selectQuality(),
                    SizedBox(height: 25.0.h,),
                    Divider(
                      color: grey.withOpacity(0.15),
                      thickness: 1.sp,
                    ),
                    SizedBox(height: 18.0.h,),
                    //Rate Form
                    rate(),
                  ],
                )
              ),
              //Results
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
          //Calculate Button
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: formBgColor,
              padding: EdgeInsets.all(12.0.sp),
              child: CustomButton(
                text: "Calculate".toUpperCase(),
                textStyle: roboto(white, 17.0, 0.2, FontWeight.w500),
                onPressed: (){
                  calculate();
                }, 
                buttonBgColor: violet, 
                fontColor: white,
                buttonRadius: 4.0.r,
              ),
            ),
          )
        ],
      ),
    );
  }

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
              prefixIconConstraints: BoxConstraints(
                minWidth: 12.0.w
              ),
              suffixIconConstraints: BoxConstraints(
                minWidth: 12.0.w
              ),
              border: InputBorder.none,
              labelText: "Select District",
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
                for(int i = 0; i < concreteRate.length; i++){
                  if(concreteRate[i]["name"] == item['label']){
                    setState(() {
                      labourCon.text = concreteRate[i]["labourPrice"].toString();
                      labour  = concreteRate[i]["labourPrice"].toString();
                      skilledLabourCon.text  = concreteRate[i]["skilledLabourPrice"].toString();
                      skilledLabour  = concreteRate[i]["skilledLabourPrice"].toString();
                      agg40mmCon.text  = concreteRate[i]["agg40mm"].toString();
                      agg40mm  = concreteRate[i]["agg40mm"].toString();
                      agg20mmCon.text  = concreteRate[i]["agg20mm"].toString();
                      agg20mm  = concreteRate[i]["agg20mm"].toString();
                      cement  = concreteRate[i]["cementPrice"].toString();
                      cementCon.text  = concreteRate[i]["cementPrice"].toString();
                      sand  = concreteRate[i]["sandPrice"].toString();
                      sandCon.text  = concreteRate[i]["sandPrice"].toString();
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

  //Select Quality
  selectQuality() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Quality".toUpperCase(), style: roboto(darkBlack, 16.0, 0.0),),
        SizedBox(height: 25.0.h,),
        CustomTextField(
          ontap: (){
            selectItemBottomSheet();
          },
          textController: qualityController,
          readOnly: true,
          keyboardType: TextInputType.number,
          textFieldWidth: 340.0.w,
          textfieldHeight: 45.0.h,
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
                          heightCon.clear();
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
                              height = 0.0;
                              heightCon.clear();
                              
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
                          heightFeetCon.clear();
                          heightFeetCon.clear();
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
                              height = 0.0;
                              heightFeetCon.clear();
                              heightInchCon.clear();

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
            Text("Height", style: roboto(black, 15, 0.0),),
            const Spacer(),
            CustomTextField(
              textController: heightCon,
              keyboardType: TextInputType.number,
              textFieldWidth: 230.0.w,
              textfieldHeight: 45.0.h,
              hintText: "Enter Height",
              suffixIcon: Text(
                "m",
                style: roboto(const Color.fromARGB(255, 153, 153, 153), 14.0, 0.0),
              ),
              onChange: (val){
                setState(() {
                  if(val != ""){
                    height = double.parse(val);
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
              child: Text("Height", style: roboto(black, 15, 0.0),)
            ),
            CustomTextField(
              textController: heightFeetCon,
              keyboardType: TextInputType.number,
              textFieldWidth: 108.0.w,
              textfieldHeight: 45.0.h,
              hintText: "Feet",
              onChange: (val){
                setState(() {
                  if(val != ""){
                    height = double.parse(val) + (double.parse(heightInchCon.text.isEmpty ? "0.00" : heightInchCon.text) * 0.0833);
                  }
                });
              },
            ),
            CustomTextField(
              textController: heightInchCon,
              keyboardType: TextInputType.number,
              textFieldWidth: 108.0.w,
              textfieldHeight: 45.0.h,
              hintText: "Inch",
              onChange: (val){
                setState(() {
                  if(val != ""){
                    height = (double.parse(val) * 0.0833) + double.parse(heightFeetCon.text.isEmpty ? "0.00" : heightFeetCon.text);
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
                });
              },
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
         Text('RATE', style: roboto(darkBlack, 16.0, 0.0,FontWeight.w400),),
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
              keyboardType: TextInputType.number,
              textFieldWidth: 108.0.w,
              readOnly: labourType == "default" ? true : false,
              isReadable: labourType == "default" ? true : false,
              textfieldHeight: 45.0.h,
              prefixIcon: Text("रु", style: roboto(const Color.fromARGB(255, 153, 153, 153), 17.0, 0.0),),
              hintTextSize: 14.0.sp,
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
                        labourType = "default";
                        labourCon.text = labour;
                      });
                    },
                    child: Container(
                      width: 51.5.w,
                      decoration: BoxDecoration(
                        color: labourType == "default" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                      ),
                      child: Center(
                        child: Text("Default", 
                          style: labourType == "default" ? roboto(white, 11.0, 0.0) : roboto(black, 11.0, 0.0),
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
                      width: 51.5.w,
                      decoration: BoxDecoration(
                        color: labourType == "custom" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                        ),
                      child: Center(
                        child: Text("Custom", 
                          style: labourType == "custom" ? roboto(white, 11.0, 0.0) : roboto(black, 11.0, 0.0),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Skilled Labour", style: roboto(black, 15, 0.0),),
                  SizedBox(height: 2.0.h,),
                  Text('(Per Person)', style: roboto(black, 10.5, 0.0),)
                ],
              )
            ),
            CustomTextField(
              textController: skilledLabourCon,
              keyboardType: TextInputType.number,
              readOnly: skilledLabourType == "default" ? true : false,
              isReadable: skilledLabourType == "default" ? true : false,
              textFieldWidth: 108.0.w,
              textfieldHeight: 45.0.h,
              prefixIcon: Text("रु", style: roboto(const Color.fromARGB(255, 153, 153, 153), 17.0, 0.0),),
              hintTextSize: 14.0.sp,
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
                        skilledLabourType = "default";
                        skilledLabourCon.text = skilledLabour;
                      });
                    },
                    child: Container(
                      width: 51.5.w,
                      decoration: BoxDecoration(
                        color: skilledLabourType == "default" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                      ),
                      child: Center(
                        child: Text("Default", 
                          style: skilledLabourType == "default" ? roboto(white, 11.0, 0.0) : roboto(black, 11.0, 0.0),
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
                      width: 51.5.w,
                      decoration: BoxDecoration(
                        color: skilledLabourType == "custom" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                        ),
                      child: Center(
                        child: Text("Custom", 
                          style: skilledLabourType == "custom" ? roboto(white, 11.0, 0.0) : roboto(black, 11.0, 0.0),
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
        //Agg 40mm
        Row(
          children: [
            SizedBox(
              width: 88.0.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Agg. 40mm", style: roboto(black, 15, 0.0),),
                  SizedBox(height: 2.0.h,),
                  Text('(per cu.m.)', style: roboto(black, 10.5, 0.0),)
                ],
              )
            ),
            CustomTextField(
              textController: agg40mmCon,
              keyboardType: TextInputType.number,
              readOnly: agg40mmType == "default" ? true : false,
              isReadable: agg40mmType == "default" ? true : false,
              textFieldWidth: 108.0.w,
              textfieldHeight: 45.0.h,
              prefixIcon: Text("रु", style: roboto(const Color.fromARGB(255, 153, 153, 153), 17.0, 0.0),),
              hintTextSize: 14.0.sp,
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
                        agg40mmType = "default";
                        agg40mmCon.text = agg40mm;
                      });
                    },
                    child: Container(
                      width: 51.5.w,
                      decoration: BoxDecoration(
                        color: agg40mmType == "default" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                      ),
                      child: Center(
                        child: Text("Default", 
                          style: agg40mmType == "default" ? roboto(white, 11.0, 0.0) : roboto(black, 11.0, 0.0),
                        )
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        agg40mmType = "custom";
                      });
                    },
                    child: Container(
                      width: 51.5.w,
                      decoration: BoxDecoration(
                        color: agg40mmType == "custom" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                        ),
                      child: Center(
                        child: Text("Custom", 
                          style: agg40mmType == "custom" ? roboto(white, 11.0, 0.0) : roboto(black, 11.0, 0.0),
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
        //Agg 20mm
        Row(
          children: [
            SizedBox(
              width: 88.0.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Agg 20mm", style: roboto(black, 15, 0.0),),
                  SizedBox(height: 2.0.h,),
                  Text("(per cu.m.)", style: roboto(black, 10.5, 0.0),)
                ],
              )
            ),
            CustomTextField(
              textController: agg20mmCon,
              keyboardType: TextInputType.number,
              readOnly: agg20mmType == "default" ? true : false,
              isReadable: agg20mmType == "default" ? true : false,
              textFieldWidth: 108.0.w,
              textfieldHeight: 45.0.h,
              prefixIcon: Text("रु", style: roboto(const Color.fromARGB(255, 153, 153, 153), 17.0, 0.0),),
              hintTextSize: 14.0.sp,
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
                        agg20mmType = "default";
                        agg20mmCon.text = agg20mm;
                      });
                    },
                    child: Container(
                      width: 51.5.w,
                      decoration: BoxDecoration(
                        color: agg20mmType == "default" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                      ),
                      child: Center(
                        child: Text("Default", 
                          style: agg20mmType == "default" ? roboto(white, 11.0, 0.0) : roboto(black, 11.0, 0.0),
                        )
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        agg20mmType = "custom";
                      });
                    },
                    child: Container(
                      width: 51.5.w,
                      decoration: BoxDecoration(
                        color: agg20mmType == "custom" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                        ),
                      child: Center(
                        child: Text("Custom", 
                          style: agg20mmType == "custom" ? roboto(white, 11.0, 0.0) : roboto(black, 11.0, 0.0),
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
              width: 88.0.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Cement", style: roboto(black, 15, 0.0),),
                  SizedBox(height: 2.0.h,),
                  Text("(per m.t)", style: roboto(black, 10.5, 0.0),)
                ],
              )
            ),
            CustomTextField(
              textController: cementCon,
              keyboardType: TextInputType.number,
              readOnly: cementType == "default" ? true : false,
              isReadable: cementType == "default" ? true : false,
              textFieldWidth: 108.0.w,
              textfieldHeight: 45.0.h,
              prefixIcon: Text("रु", style: roboto(const Color.fromARGB(255, 153, 153, 153), 17.0, 0.0),),
              hintTextSize: 14.0.sp,
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
                        cementType = "default";
                        cementCon.text = cement;
                      });
                    },
                    child: Container(
                      width: 51.5.w,
                      decoration: BoxDecoration(
                        color: cementType == "default" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                      ),
                      child: Center(
                        child: Text("Default", 
                          style: cementType == "default" ? roboto(white, 11.0, 0.0) : roboto(black, 11.0, 0.0),
                        )
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        cementType = "custom";
                      });
                    },
                    child: Container(
                      width: 51.5.w,
                      decoration: BoxDecoration(
                        color: cementType == "custom" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                        ),
                      child: Center(
                        child: Text("Custom", 
                          style: cementType == "custom" ? roboto(white, 11.0, 0.0) : roboto(black, 11.0, 0.0),
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
              width: 88.0.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sand", style: roboto(black, 15, 0.0),),
                  SizedBox(height: 2.0.h,),
                  Text("(per cu.m.)", style: roboto(black, 10.5, 0.0),)
                ],
              )
            ),
            CustomTextField(
              textController: sandCon,
              keyboardType: TextInputType.number,
              textFieldWidth: 108.0.w,
              textfieldHeight: 45.0.h,
              prefixIcon: Text("रु", style: roboto(const Color.fromARGB(255, 153, 153, 153), 17.0, 0.0),),
              hintTextSize: 14.0.sp,
              readOnly: sandType == "default" ? true : false,
              isReadable: sandType == "default" ? true : false,
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
                        sandType = "default";
                        sandCon.text = sand;
                      });
                    },
                    child: Container(
                      width: 51.5.w,
                      decoration: BoxDecoration(
                        color: sandType == "default" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                      ),
                      child: Center(
                        child: Text("Default", 
                          style: sandType == "default" ? roboto(white, 11.0, 0.0) : roboto(black, 11.0, 0.0),
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
                      width: 51.5.w,
                      decoration: BoxDecoration(
                        color: sandType == "custom" ? violet.withOpacity(0.8) : white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r))
                        ),
                      child: Center(
                        child: Text("Custom", 
                          style: sandType == "custom" ? roboto(white, 11.0, 0.0) : roboto(black, 11.0, 0.0),
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

  //Calculate
  calculate(){
    //To remove focused keyboard
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      if(length == 0 || breadth == 0 || height == 0){
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

      //Calculate Total Cost and Are
      totalCost = length * breadth + double.parse(labourCon.text) + double.parse(skilledLabourCon.text) + double.parse(agg40mmCon.text) + double.parse(agg20mmCon.text) + double.parse(cementCon.text) + double.parse(sandCon.text);
      totalArea = length * breadth * height;


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
          "type" : "Height",
          "value" : "$height",
        },
      ]);
      //For rate
      resultDetailsList.addAll(
        [
          {
            "itemName" : "Labour",
            "quantity" : "1.5 man Days",
            "cost" : "रु  ${double.parse(labourCon.text).toStringAsFixed(2)}"
          },
          {
            "itemName" : "Skilled Lb.",
            "quantity" : "1.5 man Days",
            "cost" : "रु  ${double.parse(skilledLabourCon.text).toStringAsFixed(2)}"
          },
          {
            "itemName" : "Agg. 20mm",
            "quantity" : "2 cu.m",
            "cost" : "रु  ${double.parse(agg20mmCon.text).toStringAsFixed(2)}"
          },
          {
            "itemName" : "Agg. 40mm",
            "quantity" : "2 cu.m",
            "cost" : "रु  ${double.parse(agg40mmCon.text).toStringAsFixed(2)}"
          },
          {
            "itemName" : "Cement",
            "quantity" : "2 m.t",
            "cost" : "रु  ${double.parse(cementCon.text).toStringAsFixed(2)}"
          },
          {
            "itemName" : "Sand",
            "quantity" : "1 cu.m",
            "cost" : "रु  ${double.parse(sandCon.text).toStringAsFixed(2)}"
          },
        ]
      );
    });
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
                      child: Text(dimensionResultList[index]["type"].toString(), style: dimensionResultList[index]["type"] == "Area" ? roboto(black, 16.0, 0.4, FontWeight.w500) : roboto(grey, 15, 0.0),)
                    ),
                    SizedBox(
                      width: 100.w,
                      child: Text(dimensionResultList[index]["value"].toString(), style: dimensionResultList[index]["type"] == "Area" ?  roboto(black, 16, 0.0) : roboto(grey, 15, 0.0), textAlign: TextAlign.end,)
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
        ),
      ],
    );
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
}