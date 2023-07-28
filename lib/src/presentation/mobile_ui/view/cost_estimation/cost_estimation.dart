import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/data/json_asset/app_data.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/calculation_category_tile.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CostEstimation extends StatefulWidget {
  const CostEstimation({super.key});

  @override
  State<CostEstimation> createState() => _CostEstimationState();
}

class _CostEstimationState extends State<CostEstimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Cost  Estimation"),
      body : SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:14.0.w, vertical: 12.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8.0.w),
                child: Text("Category".toUpperCase(), style: roboto(black, 16.0, 0.5),),
              ),
              SizedBox(
                height: 18.0.h,
              ),
              //Category section
              ListView.builder(
                padding: EdgeInsets.only(left: 1.8.w, right: 0.0),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 1,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Wrap(
                    children: List.generate(category.length, (index) => 
                      CalculationCategoryTile(
                        labour:category[index]['labour'] as List,
                        material:category[index]['material'] as List,
                        imageUrl: category[index]['image'].toString(), 
                        name: category[index]['name'].toString(),
                        backgroundColor: white,
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: ((context) => category[index]['page'] as Widget)));
                        }
                      )
                    ),
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}