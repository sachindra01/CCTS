import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_appbar.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/land_converter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LengthConverterPage extends StatefulWidget {
  const LengthConverterPage({super.key});

  @override
  State<LengthConverterPage> createState() => _LengthConverterPageState();
}

class _LengthConverterPageState extends State<LengthConverterPage> {
   final TextEditingController kiloMeter = TextEditingController();
   final TextEditingController meterText = TextEditingController();
   final TextEditingController centimeterText = TextEditingController();
   final TextEditingController millimeterText = TextEditingController();
   final TextEditingController inchesText = TextEditingController();
   final TextEditingController feetText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: formBgColor,
      appBar: customAppBar(context,'Length Converter'),
      ///list of textfield used
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
          child: conversionWidget(),
        ),
      ),
    );
  }

  conversionWidget(){
    return  Column(
      children: [
        LandConverterWidget(
          height: 60.0.h,
          width: double.infinity,
          hintText: 'Kilometer',
          textController: kiloMeter,
          suffix: "km",
          onChange: (val) {
            if(kiloMeter.text == ""){
              meterText.text = "";
              centimeterText.text = "";
              millimeterText.text = "";
              inchesText.text = "";
              feetText.text = "";
            }else{
            /// km to meter
            var metervalue=  (double.parse(val)*1000).toString();
            meterText.text=metervalue;

           /// km to centimeter
            var centiMeter =  (double.parse(val)*100000).toString();
            centimeterText.text = centiMeter;

             /// km to milimeter
            var milimeter =  (double.parse(val)*1000000 ).toString();
            millimeterText.text = milimeter;


          ///kilometer to inches
          var inchValue=  (double.parse(val)*39370.1).toString();
          inchesText.text = inchValue;

          ///kilometer to foot
          var footValue=  (double.parse(val)*3280.84).toString();
          feetText.text =footValue;

            }
          
          },
        ),
        const SizedBox(
          height: 10,
        ),
       LandConverterWidget(
          height: 60.0.h,
          width: double.infinity,
          hintText: 'Meter',
          textController: meterText,
          suffix: "m",
          onChange: (val) {
            if(meterText.text == ""){
              kiloMeter.text = "";
              centimeterText.text = "";
              millimeterText.text = "";
              inchesText.text = "";
              feetText.text = "";
            }else{
                /// meter to km
             var kmmetervalue=  (double.parse(val)/1000).toString();
            kiloMeter.text=kmmetervalue;
            
            /// meter to centimeter
          var metervalue=  (double.parse(val)*100).toString();
          centimeterText.text=metervalue;

           /// meter to milimeter
          var milimetervalue=  (double.parse(val)*1000).toString();
            millimeterText.text = milimetervalue;

          ///meter to inches
          var inchValue=  (double.parse(val)*39.3701).toString();
          inchesText.text = inchValue;

          ///meter to foot
          var footValue=  (double.parse(val)*3.25084).toString();
          feetText.text =footValue;

            }
          
          },
        ),
        const SizedBox(
          height: 10,
        ),
       LandConverterWidget(
          height: 60.0.h,
          width: double.infinity,
          hintText: 'Centimeter',
          textController: centimeterText,
          suffix: "cm",
          onChange: (val) {
             if(centimeterText.text == ""){
              kiloMeter.text = "";
              meterText.text = "";
              millimeterText.text = "";
              inchesText.text = "";
              feetText.text = "";
            }else{
              ///  centimeter to km
              var centiMeter =  (double.parse(val)/100000).toString();
              kiloMeter.text = centiMeter;

              ///centimeter to meter
              var centimetervalue=  (double.parse(val)/100).toString();
              meterText.text=centimetervalue;

                ///centimeter to mili
                  var miliValue = (double.parse(val)*10).toString();
                  millimeterText.text = miliValue;

                ///centimeter to inches
                  var inchValue = (double.parse(val)*0.393701).toString();
                  inchesText.text = inchValue;

                  /// centimeter to feet
                  var footValue = (double.parse(val)*0.0328084).toString();
                  feetText.text = footValue;
              }

          },
        ),
        const SizedBox(
          height: 10,
        ),
          LandConverterWidget(
          height: 60.0.h,
          width: double.infinity,
          hintText: 'Millimeter',
          textController: millimeterText,
          suffix: "mm",
          onChange: (val) {
            if(millimeterText.text == ""){
              kiloMeter.text = "";
              meterText.text = "";
              centimeterText.text = "";
              inchesText.text = "";
              feetText.text = "";
            }else{
              ///  milimeter to km
              var milimeter =  (double.parse(val)/1000000 ).toString();
              kiloMeter.text = milimeter;

              /// mili to centimeter
              var miliValue = (double.parse(val)/10).toString();
              centimeterText.text = miliValue;

              /// millimeter to meter
              var milimetervalue=  (double.parse(val)/1000).toString();
                meterText.text = milimetervalue;

              ///milimeter to inch
              var inchvalue=  (double.parse(val)*0.039).toString();
              inchesText.text = inchvalue;

              ///milimeter to foot
              var footValue=  (double.parse(val)*0.0032).toString();
              feetText.text = footValue;

            }
          },
        ),
        const SizedBox(
          height: 10,
        ),
       LandConverterWidget(
          height: 60.0.h,
          width: double.infinity,
          hintText: 'Inch',
          textController: inchesText,
          suffix: "in",
          onChange: (val){
            ///clearing if textfield empty case
            if(inchesText.text == ""){
              kiloMeter.text = "";
              meterText.text = "";
              centimeterText.text = "";
              millimeterText.text = "";
              feetText.text = "";
            }else{
              /// inches to km
              var kmValue=  (double.parse(val)/39370.1).toString();
              kiloMeter.text = kmValue;
              
              ///inches to meter
              var inchValue=  (double.parse(val)/39.3701).toString();
              meterText.text=inchValue;

              ///inches to centimeter
              var centivalue = (double.parse(val)/0.393701).toString();
              centimeterText.text = centivalue;

              ///inches to feet
              var feetvalue = (double.parse(val)*0.0833).toString();
              feetText.text =feetvalue;

              /// inch to mili
                var inchvalue=  (double.parse(val)/0.039).toString();
                millimeterText.text = inchvalue;
            }

          },
        ),
        const SizedBox(
          height: 10,
        ),
        LandConverterWidget(
          height: 60.0.h,
          width: double.infinity,
          hintText: 'Feet',
          textController: feetText,
          suffix: "ft",
          onChange: (val){
             ///clearing if textfield empty case
            if(feetText.text == ""){
              meterText.text = "";
              kiloMeter.text = "";
              centimeterText.text = "";
              millimeterText.text = "";
              inchesText.text = "";
            }else{

             ///foot to km
              var kmValue=  (double.parse(val)/3280.84).toString();
              feetText.text =kmValue;

              ///foot to meter
              var footValue=  (double.parse(val)/3.25084).toString();
              meterText.text=footValue;

                /// foot to centimeter
              var centiValue = (double.parse(val)*0.0328084).toString();
              centimeterText.text = centiValue;

              ///feet to inch
              var feetvalue = (double.parse(val)/0.0833).toString();
              feetText.text =feetvalue;

                /// foot to milli
                var miliValue=  (double.parse(val)*0.0032).toString();
                millimeterText.text = miliValue;
            }
          },
        ),
      ],
    );
  }
}