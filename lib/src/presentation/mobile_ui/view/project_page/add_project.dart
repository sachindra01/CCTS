import 'dart:io';

import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/data/json_asset/app_data.dart';
import 'package:ccts/src/presentation/mobile_ui/view/project_page/view_image.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_appbar.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_button.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_textfield.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class AddProject extends StatefulWidget {
  final bool? update;
  final String? projectTitle, district, address, clientName, clientPhone, clientEmail, totalSiteArea, totalBuildingArea, totalEstBudget, larpurjaUrl, buildingDesignUrl;
  const AddProject({super.key, this.projectTitle, this.address, this.clientName, this.clientPhone, this.clientEmail, this.totalSiteArea, this.totalBuildingArea, this.totalEstBudget, this.larpurjaUrl, this.buildingDesignUrl, this.update, this.district});

  @override
  State<AddProject> createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  final TextEditingController projectTitleCon = TextEditingController();
  final TextEditingController addressCon = TextEditingController();
  final TextEditingController clientNameCon = TextEditingController();
  final TextEditingController clientEmailCon = TextEditingController();
  final TextEditingController clientPhoneCon = TextEditingController();
  final TextEditingController totalSiteAreaCon = TextEditingController();
  final TextEditingController totalBuildingAreaCon = TextEditingController();
  final TextEditingController totalEstBudgetCon = TextEditingController();


  //Form Key for validation
  final formKey = GlobalKey<FormState>();

  //for image url
  String? updateLalpurja;
  String? updateBuildingDesigns;

  //List for lalpurja image
  var lalpurjaImageList = [];

  //List for building image
  var buildingImageList = [];


  @override
  void initState() {
    initialiseValue();
    projectTitleCon.text = widget.projectTitle?? "";
    addressCon.text = widget.address ?? "";
    clientNameCon.text = widget.clientName ?? "";
    clientEmailCon.text = widget.clientEmail ?? "";
    clientPhoneCon.text = widget.clientPhone ?? "";
    totalSiteAreaCon.text = widget.totalSiteArea ?? "";
    totalBuildingAreaCon.text = widget.totalBuildingArea ?? "";
    totalEstBudgetCon.text = widget.totalEstBudget ?? "";
    updateLalpurja = widget.larpurjaUrl;
    updateBuildingDesigns = widget.buildingDesignUrl;
    super.initState();
  }

  initialiseValue() async{
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: customAppBar(context, widget.update == true ? "Update Profile" : "Add Project"),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric( horizontal: 14.0.w, vertical: 5.0.h),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: 14.0.h,),
                  formFields(),
                  SizedBox(height: 18.h,),
                  lalpurjaImage(),
                  SizedBox(height: 18.h,),
                  buildingsImage(),
                  SizedBox(height: 30.h, ),
                  CustomButton(
                    fontColor: white,
                    buttonBgColor: violet,
                    text: 'SAVE',
                    onPressed:() async {
                      final isValid = formKey.currentState!.validate();
                      if (!isValid) return;
                    },
                  ),
                  SizedBox(height: 20.0.h,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //textfiels for adding project
  formFields(){
    return Column(
      children: [
        CustomTextField(
          readOnly: false,
          textController: projectTitleCon,
          labelText: 'Project Title',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Project Tilte Required';
            }
            return null;
          },
        ),
        SizedBox(
          height: 14.h,
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(
            left: 10.0.w,
            right: 10.0.w,
          ),
          height: 60.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.r),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 223, 223, 223),
                offset: const Offset(0, 5),
                blurRadius: 5.r
              )
            ]
          ),
          child: DropdownFormField<Map<String, dynamic>>(
            decoration:InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10.0.w, 3.8.h, 10.0.w, 3.8.h),
              prefixIconConstraints: BoxConstraints(
                minWidth: 12.0.w
              ),
              suffixIconConstraints: BoxConstraints(
                minWidth: 12.0.w
              ),
              border: InputBorder.none,
              labelText:  "Slect Disctrict",
              hintStyle: roboto(const Color.fromARGB(255, 153, 153, 153), 15, 0.0),
              labelStyle: roboto(const Color.fromARGB(255, 153, 153, 153), 15, 0.0),
            ),
            displayItemFn: (dynamic item) => Text(
              (item ?? {})['label'] ?? '',
              style: roboto(black, 16.0, 0.0),
            ),
            findFn: (dynamic str) async => municipalityList,
            selectedFn: (dynamic item1, dynamic item2) {
              if (item1 != null && item2 != null) {
                return item1['label'] == item2['label'];
              }
              return false;
            },
            filterFn: (dynamic item, str) => item['label'].toLowerCase().indexOf(str.toLowerCase()) >= 0,
            dropdownItemFn: (dynamic item, int position, bool focused,bool selected, Function() onTap) =>
            ListTile(
              title: Text(item['label']),
              tileColor: focused ? const Color.fromARGB(20, 0, 0, 0) : Colors.transparent,
              onTap: (){
                onTap();
              }
            ),
          ),
        ),
        SizedBox(height: 14.h,),
        CustomTextField(
          readOnly: false,
          textController: addressCon,
          labelText: 'Address',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Address Required';
            }
            return null;
          },
        ),
        SizedBox(
          height: 14.h,
        ),
        CustomTextField(
          labelText: 'Client Name',
          textController: clientNameCon,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Clinet Name Required';
            }
            return null;
          },
        ),
        SizedBox(
          height: 14.h,
        ),
        CustomTextField(
          readOnly: false,
          labelText: 'Client Email',
          textController: clientEmailCon,
        ),
        SizedBox(
          height: 14.h,
        ),
        CustomTextField(
          readOnly: false,
          labelText: 'Client Phone',
          textController: clientPhoneCon,
        ),
        SizedBox(
          height: 14.h,
        ),
        CustomTextField(
          readOnly: false,
          labelText: 'Total Site Area',
          textController: totalSiteAreaCon,
        ),
        SizedBox(
          height: 14.h,
        ),
        CustomTextField(
          readOnly: false,
          labelText: 'Total Building Area',
          textController: totalBuildingAreaCon,
        ),
        SizedBox(
          height: 14.h,
        ),
        CustomTextField(
          readOnly: false,
          labelText: 'Total Estimated Budget',
          textController: totalEstBudgetCon,
        ),
      ],
    );
  }

  //show and add image of lalpurja
  lalpurjaImage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height:  lalpurjaImageList.length == 2 ? 168.h : lalpurjaImageList.length == 3 ? 116.h : 225.h,
          decoration: BoxDecoration(
            border: Border.all(color:violet.withOpacity(0.5), width: 1.5.sp),
          ),
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => 
                ViewImages(
                  imagesFiles: lalpurjaImageList.isNotEmpty ? lalpurjaImageList:  null,
                )
              ));
            },
            child: lalpurjaImageList.isNotEmpty ?
            lalpurjaImageList.length < 2 ?
            Padding(
              padding: EdgeInsets.all(6.w),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.r),
                    child: Image.file(File(lalpurjaImageList[0].path), 
                      height: 222.h,
                      width:double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 4.h,
                    right: 6.w,
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          lalpurjaImageList.clear();
                        });
                      },
                      child: Container(
                        height: 28.h,
                        width: 28.h,
                        decoration: BoxDecoration(
                          color: black.withOpacity(0.8),
                          border: Border.all(color: grey, width: 1.5.sp),
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        alignment: Alignment.center,
                        child: Icon(Icons.clear, size: 15.sp, color: white,),
                      ),
                    ),
                  )
                ],
              ),
            )
            :
            GridView.builder(
              itemCount: lalpurjaImageList.length > 6 ? 6 : lalpurjaImageList.length,
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.w),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: lalpurjaImageList.length < 3 ? 2 : 3,
                mainAxisSpacing: 10.0.h,
                crossAxisSpacing: 10.0.w,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4.r),
                      child: Image.file(File(lalpurjaImageList[index].path), 
                        height: lalpurjaImageList.length == 2 ? 166.h :  lalpurjaImageList.length == 3 ? 114.h : 111.h,
                        width: lalpurjaImageList.length == 2 ? 166.h :  lalpurjaImageList.length == 3 ? 114.h : 111.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 4.h,
                      right: 6.w,
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            lalpurjaImageList.removeAt(index);
                          });
                        },
                        child: Container(
                          height: 22.h,
                          width: 22.h,
                          decoration: BoxDecoration(
                            color: black.withOpacity(0.8),
                            border: Border.all(color: grey, width: 1.5.sp),
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                        alignment: Alignment.center,
                        child: Icon(Icons.clear, size: 15.sp, color: white,),
                        ),
                      ),
                    )
                  ],
                );
              },
            ) :
            Padding(
              padding: EdgeInsets.all(6.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: updateBuildingDesigns != null 
                ? Image.network(
                  widget.buildingDesignUrl!,
                  height: 65.h, 
                  width: 65.h, 
                  fit: BoxFit.cover,
                )
                : Image.network(
                  "https://images.unsplash.com/photo-1619418602850-35ad20aa1700?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGRvY3VtZW50c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
                  height: 65.h, 
                  width: 65.h, 
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ),
        GestureDetector(
          onTap: (){
            showBottomSheet(true);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              border:  Border(
                right: BorderSide(
                  color:violet.withOpacity(0.5), width: 1.5.sp
                ),
                left: BorderSide(
                  color:violet.withOpacity(0.5), width: 1.5.sp
                ),
                bottom: BorderSide(
                  color:violet.withOpacity(0.5), width: 1.5.sp
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical :12.0.w, horizontal: 6.w),
              child: Row (
                children: [
                  SizedBox(
                    width: 5.w,
                  ),
                  Icon(Icons.image, color: grey.withOpacity(0.9),),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(lalpurjaImageList.isEmpty ? "Add Images of Lalpurja" : "Add More Images of Lalpurja", style: roboto(grey.withOpacity(0.9), 15, 0.0),),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  //show and add image of buildings
  buildingsImage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: buildingImageList.length == 2 ? 168.h : buildingImageList.length == 3 ? 116.h : 225.h,
          decoration: BoxDecoration(
            border: Border.all(color:violet.withOpacity(0.5), width: 1.5.sp),
          ),
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => 
                ViewImages(
                  imagesFiles: buildingImageList.isNotEmpty ? buildingImageList :  null,
                )
              ));
            },
            child: buildingImageList.isNotEmpty
            ?buildingImageList.length < 2 ?
            Padding(
              padding: EdgeInsets.all(6.w),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.r),
                    child: Image.file(File(buildingImageList[0].path), 
                      height: 222.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 4.h,
                    right: 6.w,
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          buildingImageList.clear();
                        });
                      },
                      child: Container(
                        height: 28.h,
                        width: 28.h,
                        decoration: BoxDecoration(
                          color: black.withOpacity(0.8),
                          border: Border.all(color: grey, width: 1.5.sp),
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                      alignment: Alignment.center,
                      child: Icon(Icons.clear, size: 15.sp, color: white,),
                      ),
                    ),
                  )
                ],
              ),
            ) :
            GridView.builder(
              itemCount: buildingImageList.length > 6 ? 6 : buildingImageList.length,
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.w),
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: buildingImageList.length < 3 ? 2 : 3,
                mainAxisSpacing: 10.0.h,
                crossAxisSpacing: 10.0.w,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4.r),
                      child: Image.file(File(buildingImageList[index].path), 
                        height: buildingImageList.length == 2 ? 166.h :  buildingImageList.length == 3 ? 114.h : 111.h,
                        width: buildingImageList.length == 2 ? 166.h :  buildingImageList.length == 3 ? 114.h : 111.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 4.h,
                      right: 6.w,
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            buildingImageList.removeAt(index);
                          });
                        },
                        child: Container(
                          height: 22.h,
                          width: 22.h,
                          decoration: BoxDecoration(
                            color: black.withOpacity(0.8),
                            border: Border.all(color: grey, width: 1.5.sp),
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                        alignment: Alignment.center,
                        child: Icon(Icons.clear, size: 15.sp, color: white,),
                        ),
                      ),
                    )
                  ],
                );
              },
            ) :
            Padding(
              padding: EdgeInsets.all(6.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: updateBuildingDesigns != null 
                ? Image.network(
                  widget.buildingDesignUrl!,
                  height: 65.h, 
                  width: 65.h, 
                  fit: BoxFit.cover,
                )
                : Image.network(
                  "https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8aG91c2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                  height: 65.h, 
                  width: 65.h, 
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ),
        GestureDetector(
          onTap: (){
            showBottomSheet(false);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              border:  Border(
                right: BorderSide(
                  color:violet.withOpacity(0.5), width: 1.5.sp
                ),
                left: BorderSide(
                  color:violet.withOpacity(0.5), width: 1.5.sp
                ),
                bottom: BorderSide(
                  color:violet.withOpacity(0.5), width: 1.5.sp
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical :12.0.w, horizontal: 6.w),
              child: Row(
                children: [
                  SizedBox(
                    width: 5.w,
                  ),
                  Icon(Icons.image, color: grey.withOpacity(0.9),),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(buildingImageList.isEmpty ? "Add Images of Buildings" : "Add More Images of Buildings", style: roboto(grey.withOpacity(0.9), 15, 0.0),)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
  
  //bottomsheet to choose pictures from gallery or camera
  showBottomSheet([lalpurja]){
    showModalBottomSheet(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.2,
      ),
      context: context,
      builder: (ctx) => Padding(
        padding: const EdgeInsets.only(top: 20.0, bottom: 10.0) ,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                lalpurja == true ?  pickLalpurjaImage(ImageSource.camera)
                .then((value) => Navigator.pop(context)) :
                pickBuildingsImage(ImageSource.camera)
                .then((value) => Navigator.pop(context));
              },
              child: SizedBox(
                width: 280.0,
                height: 50.0,
                child:  Row(
                  children: const[
                    Icon(Icons.camera),
                    SizedBox(width: 15,),
                    Text('Camera', style: TextStyle(fontSize: 16),),
                  ],
                ),
              ),
            ),
            const Divider(),
            const SizedBox(height: 15,),
            InkWell(
              onTap: () {
                lalpurja == true ?  pickLalpurjaImage(ImageSource.gallery).then((value) => Navigator.pop(context))
                 : pickBuildingsImage(ImageSource.gallery).then((value) => Navigator.pop(context));
              },
              child:  SizedBox(
                width: 280.0,
                height: 50.0,
                child:  Row(
                  children: const[
                    Icon(Icons.image),
                    SizedBox(width: 15,),
                    Text('Gallery', style: TextStyle(fontSize: 16),),
                  ],
                ),
              ),
            ),
          ],
        )
      ),
    );
  }

  //pick lalpurja image from galley or camera
  Future pickLalpurjaImage(ImageSource source) async {
    try {
      if(source == ImageSource.camera){
        //From Camera
        final cameraImage = await ImagePicker().pickImage(source: source);
        if(cameraImage != null){
          setState(() {
            lalpurjaImageList.add(cameraImage);
          });
        }
      } else{
        //From Gallery
        List<XFile> image = await ImagePicker().pickMultiImage();
        if (image.isNotEmpty){
          setState(() {
            lalpurjaImageList.addAll(image);
          });
        }
      }
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print("Failed to upload image: $e");
    }
  }

  //pick buildings image from gallery or camera
  Future pickBuildingsImage(ImageSource source) async {
    try {
      if(source == ImageSource.camera){
        //From Camera
        final cameraImage = await ImagePicker().pickImage(source: source);
        if(cameraImage != null){
          setState(() {
            buildingImageList.add(cameraImage);
          });
        }
      } else{
        //From Gallery
        List<XFile> image = await ImagePicker().pickMultiImage();
        if (image.isNotEmpty){
          setState(() {
            // file = File(image);
            buildingImageList.addAll(image);
          });
        }
      }
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print("Failed to upload image: $e");
    }
  }

}