
import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/data/json_asset/app_data.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_button.dart';
import 'package:ccts/src/presentation/web_ui/view/side_bar/site_cleareance_saved_result_tile.dart';
import 'package:ccts/src/presentation/web_ui/widgets/custom_textfield_web.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SiteCleranceWeb extends StatefulWidget {
  const SiteCleranceWeb({super.key});

  @override
  State<SiteCleranceWeb> createState() => _SiteCleranceWebState();
}

class _SiteCleranceWebState extends State<SiteCleranceWeb> {

  var totalCost = "0.00";
  String selectUnit = "meter";
  String labourRateType = "default";
  
  final labourCon= TextEditingController();
  final lengthController = TextEditingController();
  final breadthController = TextEditingController();

  //For saved results
  var savedResultList = [];
  bool isCalculated = false;

  @override
  void initState() {
    labourCon.text = "740";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //dimensionContainer
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal :10, vertical: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0.r),
            color: formBgColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //dimension form
              dimension(),
              const SizedBox(height: 20.0,),
              Divider(
                color: grey.withOpacity(0.15),
                thickness: 1.sp,
              ),
              const SizedBox(height: 13.0,),
              //rate form
              rate(),
            ],
          ),
        ),
        //resultContainer
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
        Container(
          margin: const EdgeInsets.only(bottom:10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                height: 36.0,
                width: 108.0,
                text: "CALCULATE", 
                onPressed: (){
                  isCalculated = true;
                  totalCostCalculation();
                }, 
                buttonBgColor: violet, 
                fontColor: white,
                textStyle: roboto(white, 13.0, 0.2, FontWeight.w500),
              ),
              CustomButton(
                height: 36.0,
                width: 108.0,
                text: "SAVE", 
                onPressed: (){
                  onSave();
                }, 
                buttonBgColor: violet, 
                fontColor: white,
                textStyle: roboto(white, 13.0, 0.2, FontWeight.w500),
              ),
            ],
          ),
        ),

        //Saved result
        savedResultList.isNotEmpty ?
        savedResult()
        :const SizedBox(),
      ],
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
              prefixIconConstraints: BoxConstraints(
                minWidth: 12.0.w
              ),
              suffixIconConstraints: BoxConstraints(
                minWidth: 12.0.w
              ),
              border: InputBorder.none,
              labelText: "Select Province",
              hintStyle: roboto(const Color.fromARGB(255, 153, 153, 153),  15, 0.0),
              labelStyle: roboto( const Color.fromARGB(255, 153, 153, 153),  15, 0.0),
              suffixIcon: Padding(
                padding: EdgeInsets.only(top: 1.5.h, left: 10.0.w),
                child: const Icon(Icons.expand_more_rounded, color: lightGrey,),
              ),
            ),
          ),
        ),
      ],
    );
  }

  //dimension form
  dimension() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("Dimensions".toUpperCase(), style: roboto(darkBlack, 14.0, 0.0,FontWeight.w400),),
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
        const SizedBox(height: 20.0,),
        //length
        selectUnit == "meter"
        ? Row(
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
              suffixIcon: Text("m", style: roboto(const Color.fromARGB(255, 153, 153, 153), 12.0, 0.0),),
            )
          ],
        )
        : Row(
          children: [
            SizedBox(
              width: 68,
              child: Text("Length", style: roboto(black, 13, 0.0),)
            ),
            const CustomTextFieldWeb(
              keyboardType: TextInputType.number,
              textFieldWidth: 74.0,
              textfieldHeight: 28.0,
              hintText: "Feet",
              contentTopPadding: -13,
            ),
            const Spacer(),
            const CustomTextFieldWeb(
              keyboardType: TextInputType.number,
              textFieldWidth: 74.0,
              textfieldHeight: 28.0,
              hintText: "Inch",
              contentTopPadding: -13,
            ),
          ],
        ),
        const SizedBox(height: 10.0,),
        //breadth
        selectUnit == "meter"
        ? Row(
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
              suffixIcon: Text("m", style: roboto(const Color.fromARGB(255, 153, 153, 153), 12.0, 0.0),),
            )
          ],
        )
        : Row(
          children: [
            SizedBox(
              width: 68,
              child: Text("Breadth", style: roboto(black, 13, 0.0),)
            ),
            const CustomTextFieldWeb(
              keyboardType: TextInputType.number,
              textFieldWidth: 74.0,
              textfieldHeight: 28.0,
              hintText: "Feet",
              contentTopPadding: -13,
            ),
            const Spacer(),
            const CustomTextFieldWeb(
              keyboardType: TextInputType.number,
              textFieldWidth: 74.0,
              textfieldHeight: 28.0,
              hintText: "Inch",
              contentTopPadding: -13,
            ),
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
        Text('RATE  ', style: roboto(darkBlack, 14.0, 0.0,FontWeight.w400),),
        const SizedBox(height: 15.0,),
        //Labour
        Row(
          children: [
            SizedBox(
              width: 68,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Labour", style: roboto(black, 13, 0.0),),
                  const SizedBox(height: 2.0,),
                  Text('(Per Person)', style: roboto(black, 10, 0.0),)
                ],
              )
            ),
            CustomTextFieldWeb(
              textController: labourCon,
              isReadable: labourRateType == "default" ? true : false,
              readOnly: labourRateType == "default" ? true : false,
              keyboardType: TextInputType.number,
              textFieldWidth: 74,
              textfieldHeight: 28,
              contentTopPadding: -3.5,
              prefixIcon: Text("रु", style: roboto(const Color.fromARGB(255, 153, 153, 153), 16, 0.0),),
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
      ],
    );
  }
  
  //result
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
        "breadth" : breadthController.text.toString(),
        "labour" : labourCon.text.toString(),
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
              return SiteCleranceSavedTile(
                length: savedResultList[index]["length"],
                breadth: savedResultList[index]["breadth"], 
                labour: savedResultList[index]["labour"],
                totalCost: savedResultList[index]["totalCost"],
              );
            }, 
            separatorBuilder: (context, index) => const SizedBox(),
          ),
        ],
      ),
    );
  }

  //Total cost
  void totalCostCalculation(){
    var totalCostCalc = int.parse(lengthController.text.isEmpty ? "0" : lengthController.text) * int.parse(breadthController.text.isEmpty ? "0" : breadthController.text) + double.parse(labourCon.text);
    setState(() {
      totalCost = totalCostCalc.toString();
    });
  }
  
}