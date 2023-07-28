import 'package:ccts/src/presentation/mobile_ui/view/converter/area_converter_page.dart';
import 'package:ccts/src/presentation/mobile_ui/view/converter/length_converter_page.dart';
import 'package:ccts/src/presentation/mobile_ui/view/converter/mass_converter_page.dart';
import 'package:ccts/src/presentation/mobile_ui/view/converter/temprature_converter_page.dart';
import 'package:ccts/src/presentation/mobile_ui/view/converter/volume_converter_page.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class ConverterPage extends StatefulWidget {
  const ConverterPage({super.key});

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  final items = ['Length', 'Area', 'Volume','Temperature','Mass'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:customAppBar(context,'Converter List'),
      body:ListView.separated(
        itemCount: items.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(height: 1),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
                leading: const Icon(Icons.abc),
                title:  Text(items[index]),
                onTap: () {
                  switch(items[index]){
                    case 'Length':{
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const LengthConverterPage()));
                    }
                    break;
                     case 'Area':{
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const AreaConverterPage()));
                    }
                    break;
                     case 'Volume':{
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const  VolumeConverterPage()));
                    }
                    break;
                     case 'Temperature':{
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const TemperatureConverterPage()));
                    }
                    break;
                     case 'Mass':{
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const MassConverterPage()));
                    }
                    break;
                    default: { 
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const ConverterPage()));
                    } 
                      break; 
                  }
                },
              ),
          );
        },
      )
    );
  }
}