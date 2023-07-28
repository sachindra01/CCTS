import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/presentation/mobile_ui/view/project_page/view_image.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_appbar.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_button.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_textfield.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:html_editor_enhanced/html_editor.dart'; 
import 'package:image_picker/image_picker.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  //Form Key for validation
  final formKey = GlobalKey<FormState>();

  //Editor controllers
  var userInputDescription= "";
  HtmlEditorController descriptionController = HtmlEditorController();

  //Text Controllers
  final TextEditingController titleController = TextEditingController();

  //To store image
  File? file;
  final box = GetStorage();
  var imageList = [];

  @override
  void initState() {
    getBlogImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "New Post"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0.sp),
          child: Column(
            children: [
              //Display Selected Image
              imageList.isNotEmpty
              ? showSelectedImage()
              :const SizedBox(),
              SizedBox(height: 10.h,),
              //Add image
              selectImage(),
              const SizedBox(
                height: 20,
              ),
              //Form Fields
              formFields()
            ],
          ),
        ),
      ),
    );
  }

  //Select Image
  selectImage() {
    return InkWell(
      onTap: ()=>showImageSelectionBottomSheet(),
      child: Container(
        decoration: BoxDecoration(
          color: violet.withOpacity(0.1),
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
              Text(imageList.isEmpty ? "Select Image" : "Select More Images", style: roboto(grey.withOpacity(0.9), 15, 0.0),)
            ],
          ),
        ),
      ),
    );
  }

  //Show Picked Image
  showSelectedImage() {
    return CarouselSlider.builder(
      itemCount: imageList.length,
      options: CarouselOptions(
        aspectRatio: 1.5,
        reverse: true,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        enlargeStrategy: CenterPageEnlargeStrategy.scale,
        viewportFraction: 0.6,
      ),
      itemBuilder: (context, index, realIndex){
        return  Stack(
          children: [
            InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ViewImages(imagesFiles: [imageList[index]]))),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: Image.file(File(imageList[index].path),
                  // height: 20.h,
                  width: 300.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //Remove Image
            Positioned(
              top: 4.h,
              right: 6.w,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    imageList.removeAt(index);
                    //Update GetStoreage list
                    box.write("blogImages", imageList);
                  });
                },
                child: Container(
                  height: 26.h,
                  width: 26.h,
                  decoration: BoxDecoration(
                    color: black,
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
    );
  }

  //Text Form Fields
  formFields(){
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Title
          CustomTextField(
            obscureText: false,
            readOnly: false,
            textController: titleController,
            labelText: 'Title',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Title Name Required';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          //Post Description
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10.sp),
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
            child: HtmlEditor(
              controller: descriptionController,
              callbacks: Callbacks(
                onChangeContent: (content) {
                  setState(() {
                    userInputDescription = content!;
                  });           
                },
              ),
              htmlEditorOptions: const HtmlEditorOptions(
                hint: 'Description',
                shouldEnsureVisible: true,
                //initialText: "<p>text content initial, if any</p>",
              ),
              //tool bar options
              htmlToolbarOptions: const HtmlToolbarOptions(
                toolbarPosition: ToolbarPosition.aboveEditor,
                defaultToolbarButtons: [
                  StyleButtons(),
                  FontButtons(),
                  FontSettingButtons(),
                  ColorButtons(),
                  ParagraphButtons(lineHeight: false, caseConverter: false),
                  ListButtons(),
                  ParagraphButtons(),
                  InsertButtons(),
                  OtherButtons(),
                ]
              ),
            ),
          ),
          const SizedBox(height: 20,),
          //Preview
          Text("Description Preview", style: roboto(black, 18, 0.0, FontWeight.w500),),
          Html(data: userInputDescription),
          const SizedBox(height: 20,),
          CustomButton(
            fontColor: white,
            buttonBgColor: violet,
            text: 'Add Post',
            onPressed:()=> publishBlog(),
          ),
        ],
      ),
    );
  }

  //Pick an image
  Future pickPostImages(ImageSource source) async {
    try {
      if(source == ImageSource.camera){
        //From Camera
        final cameraImage = await ImagePicker().pickImage(source: source);
        if(cameraImage != null){
          setState(() {
            imageList.add(cameraImage);
            box.write("blogImages", imageList);
          });
        }
      } else{
        //From Gallery
        List<XFile> image = await ImagePicker().pickMultiImage();
        if (image.isNotEmpty){
          setState(() {
            // file = File(image);
            imageList.addAll(image);
            box.write("blogImages", imageList);
          });
        }
      }
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print("Failed to upload image: $e");
    }
  }
  //Show image selection bottom sheet
  showImageSelectionBottomSheet(){
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
                pickPostImages(ImageSource.camera).then((value) => Navigator.pop(context));
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
                pickPostImages(ImageSource.gallery).then((value) => Navigator.pop(context));
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

  //Get Blog image list
  getBlogImage() async{
    var savedImg = await box.read("blogImages");
    if(savedImg != null){
      setState(() {
        // imageList = savedImg;
      });
    }
  }

  //Pubish Blog
  publishBlog(){
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
  }
}