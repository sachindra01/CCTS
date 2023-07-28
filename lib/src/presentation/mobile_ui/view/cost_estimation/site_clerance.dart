
import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/data/json_asset/app_data.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_appbar.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_button.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_dialog.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_textfield.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SiteClerance extends StatefulWidget { 
  const SiteClerance({super.key});

  @override
  State<SiteClerance> createState() => _SiteCleranceState();
} 

class _SiteCleranceState extends State<SiteClerance> {
  //Flag to control default and custom selection
  String selectUnit = "meter";
  String labourRateType = "default";

  //Dimension Controller
  //For meter
  final lenghtCon = TextEditingController();
  final breadthCon = TextEditingController();
  //For Feet
  final lengthFeetCon = TextEditingController();
  final breadthFeetCon = TextEditingController();
  final lengthInchCon = TextEditingController();
  final breadthInchCon = TextEditingController();

  //Rate Controllers
  final labourCon = TextEditingController();

  //Scroll controller
  late ScrollController scrollController;
  //to store user inputed value
  var length = 0.0;
  var breadth = 0.0;

  //for calculation
  double totalCost = 0.00;
  double totalArea = 0.00;
  bool isCalculated = false; //To show calculation details
  bool isUserInputEmpty = true; //Detect if user has input any dimension
  List resultDetailsList = [];//Store rate data
  List dimensionResultList = [];//Store dimension data

  //Initial rates
  var labour = "740.00";

  @override
  void initState() {
    labourCon.text = labour;
    scrollController = ScrollController()..addListener((){setState(() {});});
    super.initState();
  }
  
  @override
  void dispose() {
    scrollController.dispose();
    lenghtCon.dispose();
    breadthCon.dispose();
    lengthFeetCon.dispose();
    breadthFeetCon.dispose();
    lengthInchCon.dispose();
    breadthInchCon.dispose();
    labourCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBg,
      appBar: customAppBar(context,"Site Clerance"),
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
                    //rate form
                    rate(),
                  ],
                ),
              ),
              //resultContainer
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
                for(int i = 0; i <siteClerancePrice.length; i++){
                  if(siteClerancePrice[i]["name"] == item['label']){
                    setState(() {
                      labourCon.text = siteClerancePrice[i]["labourPrice"].toString();
                      labour  = siteClerancePrice[i]["labourPrice"].toString();
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
              isReadable: labourRateType == "default" ? true : false,
              readOnly: labourRateType == "default" ? true : false,
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
      ],
    );
  }

  //Calculate
  calculate(){
    //To remove focused keyboard
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      if(length == 0 || breadth == 0){
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

      //Calculate Total Cost and Area
      totalCost = length * breadth + double.parse(labourCon.text);
      totalArea = length * breadth;

      //Store calculation details to display
      resultDetailsList.clear();//clear previous data
      dimensionResultList.clear();//clear previous data
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
      ]);
      //For rate
      resultDetailsList.addAll(
        [
          {
            "itemName" : "Labour",
            "quantity" : "${isUserInputEmpty ? 0 : 2} man Days",
            "cost" : "रु  ${(isUserInputEmpty ? 0 : double.parse(labourCon.text)).toStringAsFixed(2)}"
          },
          {
            "itemName" : "Overhead",
            "quantity" : "${isUserInputEmpty ? 0 : 3}% of Labour",
            "cost" : "रु  ${(isUserInputEmpty ? 0: double.parse(labourCon.text) * 0.03).toStringAsFixed(2)}"
          }
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