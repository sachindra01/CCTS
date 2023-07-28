import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_appbar.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/land_converter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MassConverterPage extends StatefulWidget {
  const MassConverterPage({super.key});

  @override
  State<MassConverterPage> createState() => _MassConverterPageState();
}

class _MassConverterPageState extends State<MassConverterPage> {
   final TextEditingController kiloGram = TextEditingController();
   final TextEditingController gram = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: formBgColor,
      appBar: customAppBar(context,'Mass Converter'),
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
          hintText: 'Kilogram',
          textController: kiloGram,
          suffix: "kg",
          onChange: (val) {
            if(kiloGram.text == ""){
              gram.text='';
            }else{
             var gValue=  (double.parse(val)*1000).toString();
              gram.text=gValue;

            }
          },
        ),
        const SizedBox(
          height: 10,
        ),
       LandConverterWidget(
          height: 60.0.h,
          width: double.infinity,
          hintText: 'Gram',
          textController: gram,
          suffix: "g",
          onChange: (val) {
             if(gram.text == ""){
              kiloGram.text ='';
            }else{
             /// kg to g
             var gValue=  (double.parse(val)/1000).toString();
              kiloGram.text=gValue;

            }
          },
        ),
        
      ],
    );
  }
}