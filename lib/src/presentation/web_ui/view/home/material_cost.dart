import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/data/json_asset/app_data.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_button.dart';
import 'package:ccts/src/presentation/web_ui/view/dashboard_web/dashboard_page.dart';
import 'package:ccts/src/presentation/web_ui/widgets/custom_textfield_web.dart';
import 'package:ccts/src/presentation/web_ui/widgets/material_costbox._tile.dart';
import 'package:ccts/src/presentation/web_ui/widgets/material_popup_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/add_material_tile.dart';

class MaterialCostPage extends StatefulWidget {
  const MaterialCostPage({super.key});

  @override
  State<MaterialCostPage> createState() => _MaterialCostPageState();
}

class _MaterialCostPageState extends State<MaterialCostPage> {
  List x = [];
  List y = [];
  final addBoxController = TextEditingController(); String selectedCategory = "Earth Work";
  int changeColorandSize = 0;
  List<bool> isEarthChecked = List<bool>.filled(earthWorkItems.length, false);
  List selectedEarthWorks= [];
  @override
  Widget build(BuildContext context) {
    return DashboardPage(
      route: 'materialPage',
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 35),
        child: Column(
          children: [
            SizedBox(            
              width: 393.w,
              child: Text("Site Name", style: poppins(black, 36.0, 0.0, FontWeight.w700),)
            ),
            const SizedBox(height: 18,),
            //earth work
            SizedBox(
              width: 393.w,
              child: earthWork(),
            ),
            const SizedBox(height: 50,),
            //advertise
            SizedBox(
              width: 393.w,
              child: advertise(),
            ),
          ],
        ),
      ),
    );
  }
  
  //earthwork calculation
  earthWork() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("1.00 Earth Work", style: poppins(black, 24.0, 0.0, FontWeight.w700),),
        const SizedBox(height: 34,),
        Text("3. LAYOUT AND SETTING OUT OF THE BUILDING INCLUDING SITE CLEARANCE",
            style: poppins(grey, 16, 0.0, FontWeight.w400,),
            maxLines: 3,
        ),
        const SizedBox(height: 13.0,),
        ListView.builder(
          shrinkWrap: true,
          itemCount: y.length,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context,index)
          {
            return  MaterialCostBoxTile(
              title: y[index],
              length: x.length, 
              totalPrice: "Rs: ${x.length * 100000}", 
              remove: (){
                setState(() {
                  x.remove("a");
                });
              }, 
              add: (){
                setState(() {
                  x.add("a");
                });
              }, 
              onSave: (){},
              removeBox: (){
                setState(() {
                  y.remove(y[index].toString());
                });
              },
            );
          }
        ),
        const SizedBox(height: 18.0,),
        //show total button
        SizedBox(
          width: 393.0.w,
          child: Row(
            children: [
              CustomTextFieldWeb(
                textController: addBoxController,
                keyboardType: TextInputType.number,
                textFieldWidth: 87.w,
                textfieldHeight: 45,
                hintText: "- - Add New Expenses heading - - ",
                suffixIcon: const Icon(Icons.expand_more_rounded, color: lightGrey,),
              ),
              SizedBox(
                width: 6.0.w,
              ),
              CustomButton(
                height: 40,
                width: 90,
                text: "Add", 
                textStyle: roboto(white, 14, 0.0, FontWeight.w500),
                buttonRadius: 100,
                onPressed: (){
                  setState(() {
                    y.add(addBoxController.text.toString());
                  });
                }, 
                buttonBgColor: violet, 
                fontColor: white,
              ),
              const Spacer(),
              CustomTextFieldWeb(
                keyboardType: TextInputType.number,
                textFieldWidth: 87.2.w,
                textfieldHeight: 45,
                hintText: "- - - - - - - - - - -",
                suffixIcon: const Icon(Icons.expand_more_rounded, color: lightGrey,),
              ),
              const SizedBox(width: 24,),
              CustomButton(
                height: 40,
                width: 100,
                text: "Show Total", 
                textStyle: roboto(white, 14, 0.0, FontWeight.w500),
                buttonRadius: 100,
                onPressed: popUp, 
                buttonBgColor: violet, 
                fontColor: white,
              )
            ],
          ),
        ),
      ],
    );
  }
  
  //advertise
  advertise() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Related Material Suppliers", style: poppins(grey, 16.0, 0.0, FontWeight.w700),),
        const SizedBox(height: 10.0,),
        SizedBox(
          width: 393.0.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Spacer(),
                  Text("View all", style: poppins(grey, 14, 0.0),)
                ],
              ),
              const SizedBox(height: 5.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/img/ad.png",
                    height: 100,
                    width: 74.6.w,
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    "assets/img/ad.png",
                    height: 100,
                    width: 74.6.w,
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    "assets/img/ad.png",
                    height: 100,
                    width: 74.6.w,
                    fit: BoxFit.fill,
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 30,),
      ],
    );
  }

  void popUp() {
    showDialog(context: context, builder: (context) {
      return  StatefulBuilder(
        builder:(context, setState) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.height * 0.06
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left : 20.0, bottom: 5.0, top: 15),
                      child: Text("SELECT CATEGORY", style: poppins(grey.withOpacity(0.7), 22, 0.0, FontWeight.w500),),
                    ),
                    Divider(
                      color: lightGrey.withOpacity(0.5),
                      thickness: 1.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left:4.5.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 76.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10,),
                                Text("Material Cost", style: poppins(grey.withOpacity(0.7), 12.5, 0.0, FontWeight.w600)),
                                const SizedBox(height: 10,),
                                SizedBox(
                                  height: 395,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: workCategory.length,
                                    itemBuilder: (context,index)
                                    {
                                      return MaterialCostPopupTile(
                                        title: workCategory[index],
                                        color: changeColorandSize == index
                                              ? const Color(0xFFEEEEEE)
                                              : const Color.fromARGB(255, 247, 247, 247),
                                        ontap: (){
                                          setState(() {
                                            workCategory[index] == "Earth Work" 
                                            ? selectedCategory = "Earth Work" 
                                            : workCategory[index] == "Concrete Work"
                                            ? selectedCategory = "Concrete Work"
                                            : workCategory[index] == "Painting Work"
                                            ? selectedCategory =  "Painting Work"
                                            : selectedCategory = "Earth Work"; 
                                            changeColorandSize = index;
                                          });
                                        },
                                      );
                                    }
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 500 - 69,
                            child: VerticalDivider(
                              color: lightGrey.withOpacity(0.5),
                              thickness: 1.5,
                              width: 4.w,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                color: Colors.white,
                                padding: const EdgeInsets.only(top: 10, bottom: 5),
                                child: Text("  + Add", style: poppins(black, 15, 0.0, FontWeight.w600))
                              ),
                              SizedBox(
                                width:238.w ,
                                child: Divider(
                                  color: lightGrey.withOpacity(0.5),
                                  thickness: 1.0,
                                ),
                              ),
                              SizedBox(
                                width: 238.w,
                                height: 385 - 4,
                                child: ListView.builder(
                                  padding:EdgeInsets.only(right:4.5.w, left: 0),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: selectedCategory == "Earth Work" 
                                            ? earthWorkItems.length 
                                            : selectedCategory == "Painting Work" 
                                            ? paintingWorkItems.length
                                            : selectedCategory == "Concrete Work"
                                            ? concreteWorkItems.length
                                            : earthWorkItems.length ,
                                  itemBuilder: (context,index)
                                  {
                                    return AddMaterialTile(
                                      title: selectedCategory == "Earth Work" 
                                            ? earthWorkItems[index]['title'].toString()
                                            : selectedCategory == "Painting Work" 
                                            ? paintingWorkItems[index]['title'].toString()
                                            : selectedCategory == "Concrete Work"
                                            ? concreteWorkItems[index]['title'].toString()
                                            : earthWorkItems[index]['title'].toString(),  
                                      description: selectedCategory == "Earth Work" 
                                            ? earthWorkItems[index]['description'].toString()
                                            : selectedCategory == "Painting Work" 
                                            ? paintingWorkItems[index]['description'].toString()
                                            : selectedCategory == "Concrete Work"
                                            ? concreteWorkItems[index]['description'].toString()
                                            : earthWorkItems[index]['description'].toString(),
                                      checkbox: Checkbox(
                                        activeColor: violet.withOpacity(0.7),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4.0.r),
                                        ),
                                        side: MaterialStateBorderSide.resolveWith(
                                          (states) => const BorderSide(width: 1.5, color: lightGrey),
                                        ),
                                        value: isEarthChecked[index],
                                        onChanged: (val) {
                                          setState(() {
                                          isEarthChecked[index] = val!;
                                            if (val == true) {
                                              selectedEarthWorks.add(earthWorkItems[index]);
                                            } else {
                                              selectedEarthWorks.remove(earthWorkItems[index]);
                                            }
                                          });
                                        },
                                      ),
                                    );
                                  }
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 74,
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 74,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(4.0),
                        bottomRight: Radius.circular(4.0)
                      )
                    ),
                    child: Column(
                      children: [
                        Divider(
                          color: lightGrey.withOpacity(0.5),
                          thickness: 1.0,
                        ),
                        const SizedBox(height: 5,),
                        Row(
                          children: [
                            const Spacer(),
                            CustomButton(
                              height: 38,
                              width: 80,
                              text: "Cancel",
                              onPressed: (){
                                Navigator.pop(context);
                              }, 
                              buttonBgColor: pink, 
                              fontColor: white,
                              buttonRadius: 100,
                            ),
                            SizedBox( width: 4.w,),
                            CustomButton(
                              height: 38,
                              width: 80,
                              text: "Save",
                              onPressed: (){}, 
                              buttonBgColor: violet, 
                              fontColor: white,
                              buttonRadius: 100,
                            ),
                            SizedBox(width: 5.w,)
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }
      );
    },
    );
  }
}