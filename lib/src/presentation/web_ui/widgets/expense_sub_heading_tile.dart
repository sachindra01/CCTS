import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_button.dart';
import 'package:ccts/src/presentation/web_ui/widgets/labour_and_material_tile.dart';
import 'package:ccts/src/presentation/web_ui/widgets/material_cost_earthwork.dart';
import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpenseSubHeadingTile extends StatefulWidget {
  final VoidCallback ?onRemove, onLabourRemove, onMaterialRemove;
  final List labourList, materialList;
  final String title;
  final bool ?isSideBarOpen;
  const ExpenseSubHeadingTile({super.key, this.onRemove, this.onLabourRemove, this.onMaterialRemove, required this.labourList, required this.materialList, required this.title, this.isSideBarOpen});

  @override
  State<ExpenseSubHeadingTile> createState() => _ExpenseSubHeadingTileState();
}

class _ExpenseSubHeadingTileState extends State<ExpenseSubHeadingTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 32.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Site Work 1.10 heading
          Row(  
            children: [
              SizedBox(
                width: 133.w,
                child: Text(widget.title,
                  style: poppins(grey, 16, 0.0, FontWeight.w400),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Spacer(),
              Visibility(
                visible: widget.isSideBarOpen == true ? false : true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100.w,
                      child: Text("Unit : M2  |  Total Qty(In Fps) : 100  |  Total Qty(In mks) : 0.09".toUpperCase(),
                        style: poppins(brown, 12, 0.0, FontWeight.w400),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 4.0.w,),
                    InkWell(
                      onTap: widget.onRemove,
                      child: SizedBox(
                        width: 26.w,
                        child: Text("Remove",
                          style: poppins(pink, 14, 0.0, FontWeight.w500),
                          textAlign: TextAlign.end,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Visibility(
            visible: widget.isSideBarOpen ?? false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 102.w,
                  child: Text("Unit : M2  |  Total Qty(In Fps) : 100  |  Total Qty(In mks) : 0.09".toUpperCase(),
                    style: poppins(brown, 12, 0.0, FontWeight.w400),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: widget.onRemove,
                  child: SizedBox(
                    width: 22.w,
                    child: Text("Remove",
                    textAlign: TextAlign.end,
                      style: poppins(pink, 14, 0.0, FontWeight.w500),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 9.0.h,),
          //Labour & Material
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Labour
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("-   Labour",
                      style: poppins(violetWeb, 16, 0.0, FontWeight.w600),
                    ),
                    SizedBox(height: 7.0.h,),
                    SizedBox(
                      width: widget.isSideBarOpen == true ? MediaQuery.of(context).size.width * 0.61 : MediaQuery.of(context).size.width * 0.39,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.labourList.length,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index)
                        {
                          if(widget.isSideBarOpen == true){
                            return SizedBox(
                              width: 390.w,
                              child: MaterialEarthworkTile(
                                onRemove: (){
                                  setState(() {
                                    widget.labourList.removeAt(index);
                                  });
                                },
                              ),
                            );
                          } else{
                            return LabourAndMaterialTile(
                              onRemove: (){
                                setState(() {
                                  widget.labourList.removeAt(index);
                                });
                              },
                            );
                          }
                        }
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    //Add Labour
                    SizedBox(
                      width:  widget.isSideBarOpen == true ? MediaQuery.of(context).size.width * 0.61 : MediaQuery.of(context).size.width * 0.39,
                      child: Row(
                        children: [
                          const Spacer(),
                          CustomButton(
                            height: 40,
                            width: 35.w,
                            text: "+ Add Labour", 
                            textStyle: roboto(white, 14, 0.0, FontWeight.w500),
                            buttonRadius: 100,
                            onPressed: (){
                              setState(() {
                                widget.labourList.add(
                                  {
                                    "quantity" : 1,
                                    "labourTopic" : "Skilled",
                                    "cost" : "Rs.100",
                                  }
                                );
                              });
                            }, 
                            buttonBgColor: violet, 
                            fontColor: white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //Material
              Visibility(
                visible: widget.isSideBarOpen == true ? false : true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("-   Material",
                      style: poppins(violetWeb, 16, 0.0, FontWeight.w600),
                    ),
                    SizedBox(height: 7.0.h,),
                    SizedBox(
                      width: widget.isSideBarOpen == true ? MediaQuery.of(context).size.width * 0.61 : MediaQuery.of(context).size.width * 0.39,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.materialList.length,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index)
                        {
                          if(widget.isSideBarOpen == true){
                            return SizedBox(
                              width: 390.w,
                              child: MaterialEarthworkTile(
                                onRemove: (){
                                  setState(() {
                                    widget.materialList.removeAt(index);
                                  });
                                },
                              ),
                            );
                          } else{
                            return LabourAndMaterialTile(
                              onRemove: (){
                                setState(() {
                                  widget.materialList.removeAt(index);
                                });
                              },
                            );
                          }
                        }
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    //Add Material
                    SizedBox(
                      width:  widget.isSideBarOpen == true ? MediaQuery.of(context).size.width * 0.61 : MediaQuery.of(context).size.width * 0.39,
                      child: Row(
                        children: [
                          const Spacer(),
                          CustomButton(
                            height: 40,
                            width: 35.w,
                            text: "+ Add Material", 
                            textStyle: roboto(white, 14, 0.0, FontWeight.w500),
                            buttonRadius: 100,
                            onPressed: (){
                              setState(() {
                                widget.materialList.add(
                                  {
                                    "quantity" : 1,
                                    "labourTopic" : "labour",
                                    "cost" : "Rs.100",
                                  }
                                );
                              });
                            }, 
                            buttonBgColor: violet, 
                            fontColor: white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          //Material
          Visibility(
            visible: widget.isSideBarOpen ?? false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("-   Material",
                  style: poppins(violetWeb, 16, 0.0, FontWeight.w600),
                ),
                SizedBox(height: 7.0.h,),
                SizedBox(
                    width: widget.isSideBarOpen == true ? MediaQuery.of(context).size.width * 0.61 : MediaQuery.of(context).size.width * 0.39,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.materialList.length,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index)
                      {
                        if(widget.isSideBarOpen == true){
                          return SizedBox(
                            width: 390.w,
                            child: MaterialEarthworkTile(
                              onRemove: (){
                                setState(() {
                                  widget.materialList.removeAt(index);
                                });
                              },
                            ),
                          );
                        } else{
                          return LabourAndMaterialTile(
                            onRemove: (){
                              setState(() {
                                widget.materialList.removeAt(index);
                              });
                            },
                          );
                        }
                      }
                    ),
                  ),
                SizedBox(
                  height: 6.h,
                ),
                //Add Material
                SizedBox(
                  width:  widget.isSideBarOpen == true ? MediaQuery.of(context).size.width * 0.61 : MediaQuery.of(context).size.width * 0.39,
                  child: Row(
                    children: [
                      const Spacer(),
                      CustomButton(
                        height: 40,
                        width: 35.w,
                        text: "+ Add Material", 
                        textStyle: roboto(white, 14, 0.0, FontWeight.w500),
                        buttonRadius: 100,
                        onPressed: (){
                          setState(() {
                            widget.materialList.add(
                              {
                                "quantity" : 1,
                                "labourTopic" : "labour",
                                "cost" : "Rs.100",
                              }
                            );
                          });
                        }, 
                        buttonBgColor: violet, 
                        fontColor: white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}