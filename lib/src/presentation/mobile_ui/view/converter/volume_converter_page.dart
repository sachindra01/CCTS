import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_appbar.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/land_converter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VolumeConverterPage extends StatefulWidget {
  const VolumeConverterPage({super.key});

  @override
  State<VolumeConverterPage> createState() => _VolumeConverterPageState();
}

class _VolumeConverterPageState extends State<VolumeConverterPage> {
   final TextEditingController ltrs = TextEditingController();
   final TextEditingController mltrs = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: formBgColor,
      appBar: customAppBar(context,'Volume Converter'),
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
          hintText: 'Liter',
          textController: ltrs,
          suffix: "l",
          onChange: (val) {
            if(ltrs.text == ""){
              mltrs.text='';
            }else{
              /// l to ml
             var gValue=  (double.parse(val)*1000).toString();
              mltrs.text=gValue;

            }
          },
        ),
        const SizedBox(
          height: 10,
        ),
       LandConverterWidget(
          height: 60.0.h,
          width: double.infinity,
          hintText: 'Mililiter',
          textController: mltrs,
          suffix: "ml",
          onChange: (val) {
             if(mltrs.text == ""){
              ltrs.text ='';
            }else{
             /// ml to l
             var gValue=  (double.parse(val)/1000).toString();
              ltrs.text=gValue;

            }
          },
        ),
        
      ],
    );
  }
}