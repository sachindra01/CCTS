import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_appbar.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/land_converter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AreaConverterPage extends StatefulWidget {
  const AreaConverterPage({super.key});

  @override
  State<AreaConverterPage> createState() => _AreaConverterPageState();
}

class _AreaConverterPageState extends State<AreaConverterPage> {
  final TextEditingController sqMeterText = TextEditingController();
  final TextEditingController sqCentiMeterText = TextEditingController();
  final TextEditingController sqInchesText = TextEditingController();
  final TextEditingController sqFeetText = TextEditingController();
  final TextEditingController sqKiloMeterText = TextEditingController();
  final TextEditingController sqMilliMeterText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBg,
      appBar: customAppBar(context,'Area Converter'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top:10.0.h, left: 10.w, right: 10.0.w, bottom: 0.0.h),
          padding: EdgeInsets.fromLTRB(10.0.w, 14.0.h, 10.0.w, 4.0.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0.r),
            color: formBgColor,
          ),
          child: listTextfield(),
        ),
      ),
    );
  }

  listTextfield() {
    return Column(
      children: [
        LandConverterWidget(
          height: 60.0.h,
          width: double.infinity,
          hintText: 'Square Meters',
          textController: sqMeterText,
          suffix: "m2",
          onChange: (val) {
            ///empty textfields if inserted number is removed 
            if(sqMeterText.text == ""){
              sqCentiMeterText.text = "";
              sqInchesText.text = "";
              sqFeetText.text = "";
              sqKiloMeterText.text = "";
              sqMilliMeterText.text = "";
            }
            ///convert to sqCentimeter
            var sqCentiMeter=  (double.parse(val)*10000).toString();
            sqCentiMeterText.text=sqCentiMeter;
            ///convert to sqInch
            var sqInch =  (double.parse(val)*1550.0031).toString();
            sqInchesText.text = sqInch;
            ///convert to sqFeet
            var sqFeet = (double.parse(val)*10.76391042).toString();
            sqFeetText.text = sqFeet;
            ///convert to sqMilliMeters
            var sqMilliMeters =  (double.parse(val)*1000000).toString();
            sqMilliMeterText.text = sqMilliMeters;
            ///convert to sqKilometers
            var sqKm = (double.parse(val)*0.000001).toString();
            sqKiloMeterText.text = sqKm;
          },
        ),
        SizedBox(
          height: 12.0.h,
        ),
        LandConverterWidget(
          height: 60.0.h,
          width: double.infinity,
          hintText: 'Square Centimeters',
          textController: sqCentiMeterText,
          suffix: "cm2",
          onChange: (val) {
            ///empty textfields if inserted number is removed 
            if(sqCentiMeterText.text == ""){
              sqMeterText.text = "";
              sqInchesText.text = "";
              sqFeetText.text = "";
              sqKiloMeterText.text = "";
              sqMilliMeterText.text = "";
            }
            ///convert to sqareMeter
            var sqMeter=  (double.parse(val)*0.0001).toString();
            sqMeterText.text= sqMeter;
            ///convert to sqInch
            var sqInch =  (double.parse(val)*0.15500031).toString();
            sqInchesText.text = sqInch;
            ///convert to sqFeet
            var sqFeet = (double.parse(val)*0.001076391042).toString();
            sqFeetText.text = sqFeet;
            ///convert to sqMilliMeters
            var sqMilliMeters =  (double.parse(val)*100).toString();
            sqMilliMeterText.text = sqMilliMeters;
            ///convert to sqKilometers
            var sqKm = (double.parse(val)*0.0000000001).toString();
            sqKiloMeterText.text = sqKm;
          },
        ),
        SizedBox(
          height: 12.0.h,
        ),
        LandConverterWidget(
          height: 60.0.h,
          width: double.infinity,
          hintText: 'Square Inches',
          textController: sqInchesText,
          suffix: "in2",
          onChange: (val) {
            ///empty textfields if inserted number is removed 
            if(sqInchesText.text == ""){
              sqCentiMeterText.text = "";
              sqMeterText.text = "";
              sqFeetText.text = "";
              sqKiloMeterText.text = "";
              sqMilliMeterText.text = "";
            }
            ///convert to sqareMeter
            var sqMeter=  (double.parse(val)*0.00064516).toString();
            sqMeterText.text= sqMeter;
            ///convert to sqCentiMeter
            var sqCentiMeter =  (double.parse(val)*6.4516).toString();
            sqCentiMeterText.text = sqCentiMeter;
            ///convert to sqFeet
            var sqFeet = (double.parse(val)*0.006944444444).toString();
            sqFeetText.text = sqFeet;
            ///convert to sqMilliMeters
            var sqMilliMeters =  (double.parse(val)*645.16).toString();
            sqMilliMeterText.text = sqMilliMeters;
            ///convert to sqKilometers
            var sqKm = (double.parse(val)*0.0000000254).toString();
            sqKiloMeterText.text = sqKm;
          },
        ),
        SizedBox(
          height: 12.0.h,
        ),
        LandConverterWidget(
          height: 60.0.h,
          width: double.infinity,
          hintText: 'Square Feet',
          textController: sqFeetText,
          suffix: "ft2",
          onChange: (val) {
            ///empty textfields if inserted number is removed 
            if(sqFeetText.text == ""){
              sqCentiMeterText.text = "";
              sqInchesText.text = "";
              sqMeterText.text = "";
              sqKiloMeterText.text = "";
              sqMilliMeterText.text = "";
            }
            ///convert to sqareMeter
            var sqMeter=  (double.parse(val)*0.09290304).toString();
            sqMeterText.text= sqMeter;
            ///convert to sqCentimeter
            var sqInch = (double.parse(val)*929.0304).toString();
            sqInchesText.text = sqInch;
            ///convert to sqInch
            var sqCentiMeter =  (double.parse(val)*144).toString();
            sqInchesText.text = sqCentiMeter;
            ///convert to sqMilliMeters
            var sqMilliMeters =  (double.parse(val)*92903.04).toString();
            sqMilliMeterText.text = sqMilliMeters;
            ///convert to sqKilometers
            var sqKm = (double.parse(val)*0.000009290304).toString();
            sqKiloMeterText.text = sqKm;
          },
        ),
        SizedBox(
          height: 12.0.h,
        ),
        LandConverterWidget(
          height: 60.0.h,
          width: double.infinity,
          hintText: 'Square Millimeters',
          textController: sqMilliMeterText,
          suffix: "mm2",
          onChange: (val) {
            ///empty textfields if inserted number is removed 
            if(sqMilliMeterText.text == ""){
              sqCentiMeterText.text = "";
              sqInchesText.text = "";
              sqFeetText.text = "";
              sqKiloMeterText.text = "";
              sqMeterText.text = "";
            }
            ///convert to sqCentimeter
            var sqCentiMeter=  (double.parse(val)*0.01).toString();
            sqCentiMeterText.text=sqCentiMeter;
            ///convert to sqInch
            var sqInch =  (double.parse(val)*0.0015500031).toString();
            sqInchesText.text = sqInch;
            ///convert to sqFeet
            var sqFeet = (double.parse(val)*0.00001076391042).toString();
            sqFeetText.text = sqFeet;
            ///convert to sqMeter
            var sqMeter = (double.parse(val)*0.000001).toString();
            sqMeterText.text = sqMeter;
            ///convert to sqKilometers
            var sqKm = (double.parse(val)/1000000000000).toString();
            sqKiloMeterText.text = sqKm;
          },
        ),
        SizedBox(
          height: 12.0.h,
        ),
        LandConverterWidget(
          height: 60.0.h,
          width: double.infinity,
          hintText: 'Square Kilometers',
          textController: sqKiloMeterText,
          suffix: "m2",
          onChange: (val) {
            ///empty textfields if inserted number is removed 
            if(sqKiloMeterText.text == ""){
              sqCentiMeterText.text = "";
              sqInchesText.text = "";
              sqFeetText.text = "";
              sqMeterText.text = "";
              sqMilliMeterText.text = "";
            }
            ///convert to sqCentimeter
            var sqCentiMeter=  (double.parse(val)*10000000000).toString();
            sqCentiMeterText.text=sqCentiMeter;
            ///convert to sqInch
            var sqInch =  (double.parse(val)*1550003100).toString();
            sqInchesText.text = sqInch;
            ///convert to sqFeet
            var sqFeet = (double.parse(val)*10763910.42).toString();
            sqFeetText.text = sqFeet;
            ///convert to sqMilliMeters
            var sqMilliMeters =  (double.parse(val)*1000000000000).toString();
            sqMilliMeterText.text = sqMilliMeters;
            ///convert to sqMeter
            var sqMeter = (double.parse(val)*1000000).toString();
            sqMeterText.text = sqMeter;
          },
        ),
        SizedBox(
          height: 12.0.h,
        ),
      ],
    );
  }
}

