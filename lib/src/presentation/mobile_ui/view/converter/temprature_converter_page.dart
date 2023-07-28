import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_appbar.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/land_converter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TemperatureConverterPage extends StatefulWidget {
  const TemperatureConverterPage({super.key});

  @override
  State<TemperatureConverterPage> createState() => _TemperatureConverterPageState();
}

class _TemperatureConverterPageState extends State<TemperatureConverterPage> {
  final TextEditingController fahrenheitText = TextEditingController();
  final TextEditingController celciusText = TextEditingController();
  final TextEditingController kelvinText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBg,
      appBar: customAppBar(context,'Temperature Converter'),
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
          hintText: 'Fahrenheit',
          textController: fahrenheitText,
          suffix: "°F",
          onChange: (val) {
            ///empty textfields if inserted number is removed 
            if(fahrenheitText.text == ""){
              celciusText.text = "";
              kelvinText.text = "";
            }
            ///convert to celcius, Formula = (°F - 32) x 5/9 
            var celcius=  ((double.parse(val) - 32) * 5/9).toStringAsFixed(2);
            celciusText.text= celcius;
            ///convert to kelvin, Formula = (°F + 459.67) x 5/9
            var kelvin =  ((double.parse(val) + 459.67) * 5/9).toStringAsFixed(2);
            kelvinText.text = kelvin;
          },
        ),
        SizedBox(
          height: 12.0.h,
        ),
       LandConverterWidget(
          height: 60.0.h,
          width: double.infinity,
          hintText: 'Celcius',
          textController: celciusText,
          suffix: "°C",
          onChange: (val) {
            ///empty textfields if inserted number is removed 
            if(celciusText.text == ""){
              fahrenheitText.text = "";
              kelvinText.text = "";
            }
            ///convert to fahrenheit, Formula = (°C x 9/5) + 32
            var fahrenheit=  ((double.parse(val)* 9/5) + 32).toStringAsFixed(2);
            fahrenheitText.text=fahrenheit;
            ///convert to kelvin, Formula =  (°C + 273.15)
            var kelvin =  (double.parse(val) + 273.15).toStringAsFixed(2);
            kelvinText.text = kelvin;
          },
        ),
        SizedBox(
          height: 12.0.h,
        ),
        LandConverterWidget(
          height: 60.0.h,
          width: double.infinity,
          hintText: 'Kelvin',
          textController: kelvinText,
          suffix: "K",
          onChange: (val) {
            ///empty textfields if inserted number is removed 
            if(kelvinText.text == ""){
              celciusText.text = "";
              fahrenheitText.text = "";
            }
            ///convert to celcius, Formula =  (K - 273.15)
            var celcius=  (double.parse(val) -273.15).toStringAsFixed(2);
            celciusText.text=celcius;
            ///convert to fahrenheit, Formula =  (K x 9/5) - 459.67
            var fahrenheit =  ((double.parse(val)*9/5) - 459.67).toStringAsFixed(2);
            fahrenheitText.text = fahrenheit;
          },
        ),
        SizedBox(
          height: 12.0.h,
        ),
      ],
    );
  }
}