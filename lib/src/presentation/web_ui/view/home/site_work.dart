import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/data/json_asset/app_data.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_button.dart';
import 'package:ccts/src/presentation/web_ui/view/profile/profile_web.dart';
import 'package:ccts/src/presentation/web_ui/view/side_bar/sidebar_icon_tile.dart';
import 'package:ccts/src/presentation/web_ui/view/side_bar/sidenav_category_expansion_tile.dart';
import 'package:ccts/src/presentation/web_ui/widgets/add_material_tile.dart';
import 'package:ccts/src/presentation/web_ui/widgets/custom_textfield_web.dart';
import 'package:ccts/src/presentation/web_ui/widgets/expense_heading_tile.dart';
import 'package:ccts/src/presentation/web_ui/widgets/material_popup_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SiteWorkPage extends StatefulWidget {
  const SiteWorkPage({super.key});

  @override
  State<SiteWorkPage> createState() => _SiteWorkPageState();
}

class _SiteWorkPageState extends State<SiteWorkPage> with SingleTickerProviderStateMixin{

  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() { 
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  List laborMaterial = [];
  List siteList = [];
  List labourList = [];
  List materialList = [];
  
  bool isSideBarOpen = false;
  String selectedNavItem = "";
  TextEditingController expenseHeadingController = TextEditingController();
  String selectedCategory = "Earth Work";
  int changeColorandSize = 0;
  List<bool> isEarthChecked = List<bool>.filled(earthWorkItems.length, false);
  List selectedEarthWorks= [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.4),
      appBar: AppBar(
        backgroundColor: white,
        leading: const SizedBox(),
        leadingWidth: 56,
        elevation: 0.5,
        title: Row(
          children: [
            Image.asset(
              'assets/img/logo.png',
              width: 18,
              height: 14,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 4,),
            Text("CCTS", style: roboto(black, 22, 0.0, FontWeight.w900),),
          ],
        ),
        actions: [
          Row(
            children: [
              Text("Free Test", style: roboto(appbarWebFontColor, 16.0, 0.0),),
              SizedBox(width: 7.w,),
              Text("Catalog", style: roboto(appbarWebFontColor, 16.0, 0.0),),
              SizedBox(width: 7.w,),
              Text("Help", style: roboto(appbarWebFontColor, 16.0, 0.0),),
              SizedBox(width: 8.w,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileWeb()));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.0),
                    border: Border.all(color: violet,)
                  ),
                  child: Text("Profile", style: roboto(violet, 16.0, 0.0),)),
              ),
              SizedBox(width: 16.w,)
            ],
          ),
        ],
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 28),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Site Name", style: poppins(black, 36.0, 0.0, FontWeight.w700),),
                  Text("Stories : 3   Area : 2500m2".toUpperCase(), style: poppins(grey, 16.0, 0.0),),
                  const SizedBox(height: 36,),
                  //Site List
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: jsonSiteList.length,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index)
                    {
                      return ExpenseHeadingTile(
                        isSideBarOpen: isSideBarOpen,
                        layoutList: jsonSiteList[index]["layout"] as List ,
                        labourList: labourList,
                        materialList: materialList,
                        title: jsonSiteList[index]["siteTitle"].toString(),
                        onRemove: () {
                          setState(() {
                            jsonSiteList .removeAt(index);
                          });
                        },
                      );
                    }
                  ),
                  SizedBox(height: 40.h,),
                  //- - Add New Expenses Heading - -
                  Row(
                    children: [
                      CustomTextFieldWeb(
                        ontap: () {
                          popUp();
                          setState(() {
                            selectedCategory = "Earth Work";
                            isEarthChecked = List<bool>.filled(earthWorkItems.length, false);
                            selectedEarthWorks.clear();
                          });
                        },
                        textController: expenseHeadingController,
                        keyboardType: TextInputType.number,
                        textFieldWidth: 87.w,
                        textfieldHeight: 45,
                        hintTextSize: 16,
                        inputFontSize: 16,
                        contentTopPadding: 7,
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
                            jsonSiteList.add(
                              {
                                "siteTitle": expenseHeadingController.text.isEmpty ? "No Title" : expenseHeadingController.text.trim(),
                                "layout" : [],
                              }
                            );
                          });
                        }, 
                        buttonBgColor: violet, 
                        fontColor: white,
                      )
                    ],
                  ),
                ],
                ),
              ),
            ),
          ),
          //SideNav
          SizedBox( 
            width: isSideBarOpen ? 338 : 58,
            height: MediaQuery.of(context).size.height,
            child: Row(
              children: [
                //Side Nav Expansion Section
                isSideBarOpen
                ?Container(
                  height: MediaQuery.of(context).size.height,
                  width: 280,
                  padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                  color: sideNavExpansionBg,
                  child: SingleChildScrollView(
                    child: selectedNavItem == "Category"
                      ?Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Calculation", style: roboto(black, 20, 0.0, FontWeight.w700),),
                          const SizedBox(height: 10,),
                          SizedBox(
                            width: 300,
                            child: ListView.separated(
                              separatorBuilder: (context, index) => const SizedBox(height: 10,),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: category.length,
                              itemBuilder: (context, index){
                                return SideNavCategoryExpansionTile(
                                  categoryTitle: category[index]["name"].toString(),
                                  expansionBody: Column(
                                    children: [
                                      const SizedBox(height: 10,),
                                      category[index]["page"] as Widget,
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      )
                      : selectedNavItem == "Calculator"
                        ?Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Something", style: roboto(black, 20, 0.0, FontWeight.w700),),
                            Container(
                              height: 48,
                              width: 400,
                              color: Colors.green,
                            ),
                          ],
                        )
                        :selectedNavItem == "Misc" 
                          ? const Text("Misc")
                          :const SizedBox(),
                  ),
                )
                :const SizedBox(),
                //Side Nav Icon Section
                Container(
                  height: MediaQuery.of(context).size.height,
                  padding: const EdgeInsets.only(top: 15),
                  width: 58,
                  color: const Color(0xffF3F6F9),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(height: 14,),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: sideNavItems.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                    itemBuilder: (BuildContext context, int index){
                    return SideBarIconTile(
                      ontap: (){
                        setState(() {
                          if(isSideBarOpen == true && selectedNavItem == sideNavItems[index]["itemName"]){
                            isSideBarOpen = false;
                            selectedNavItem = "";
                          }else{
                            isSideBarOpen = true;
                            selectedNavItem = sideNavItems[index]["itemName"].toString();
                          }
                        });
                      },
                      itemIcon: sideNavItems[index]["itemIcon"] as Icon,
                      iconBgColor: selectedNavItem == sideNavItems[index]["itemName"] ? green : lightGrey.withOpacity(0.3),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void popUp() {
    showDialog(
      context: context, 
      builder: (context) 
      {
        return  StatefulBuilder(
          builder:(context, setState) {
            return SingleChildScrollView(
              child: Dialog(
                insetPadding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.height * 0.06
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Column(
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
                                  height: MediaQuery.of(context).size.height *0.59,
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
                                            selectedCategory = workCategory[index];
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
                            height: MediaQuery.of(context).size.height *0.65,
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
                                height: MediaQuery.of(context).size.height * 0.57,
                                child: ListView.builder(
                                  padding:EdgeInsets.only(right:4.5.w, left: 0),
                                  shrinkWrap: true,
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
                                            isEarthChecked = List<bool>.filled(earthWorkItems.length, false);
                                            isEarthChecked[index] = val!;
                                            if (val == true) {
                                              selectedEarthWorks.clear();
                                              selectedEarthWorks.add(
                                                {"title" :earthWorkItems[index]['title'],
                                                "description" : earthWorkItems[index]['description']
                                                }
                                              );
                                            } else {
                                              selectedEarthWorks.removeAt(index);
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
                            setState((){
                              selectedCategory = "Earth Work";
                              isEarthChecked = List<bool>.filled(earthWorkItems.length, false);
                              selectedEarthWorks.clear();
                            });
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
                          onPressed: (){
                            setState(() {
                              jsonSiteList.add(
                                {
                                  "siteTitle": selectedCategory,
                                  "layout" : selectedEarthWorks.isEmpty 
                                  ? []
                                  : [
                                    {
                                      "layoutTitle" : selectedEarthWorks[0]['title'],
                                      "labourList" : [],
                                      "materialList" : [],
                                    }
                                  ],
                                }
                              );
                            });
                            Navigator.pop(context);
                          }, 
                          buttonBgColor: violet, 
                          fontColor: white,
                          buttonRadius: 100,
                        ),
                        SizedBox(width: 5.w,)
                      ],
                    ),
                    const SizedBox(height: 10.0,)
                  ],
                ),
              ),
            );
          }
        );
      },
    ).then((value) {
      setState(() {
        jsonSiteList;
      });
    });
  }
}