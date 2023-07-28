import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_appbar.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_button.dart';
import 'package:ccts/src/presentation/web_ui/widgets/custom_textfield_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:file_picker/file_picker.dart';

class EditProfilePageWeb extends StatefulWidget {
  const EditProfilePageWeb({super.key, this.firstName, this.lastName, this.role, this.email, this.phone, this.userID, this.bio, this.profileUrl});
  final int? userID;
  final String? email, firstName, lastName, phone, role, bio, profileUrl;

  @override
  State<EditProfilePageWeb> createState() => _EditProfilePageWebState();
}

class _EditProfilePageWebState extends State<EditProfilePageWeb> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  //Form Key for validation
  final formKey = GlobalKey<FormState>();

  final box = GetStorage();
  String? updateUrl;  
  dynamic webfiles;
  dynamic webfileName;

  @override
  void initState() {
    initialiseValue();
    firstNameController.text = widget.firstName?? "";
    lastNameController.text = widget.lastName ?? "";
    phoneController.text = widget.phone ?? "";
    emailController.text = widget.email ?? "";
    roleController.text = widget.role ?? "";
    bioController.text = widget.bio ?? "";
    updateUrl = widget.profileUrl;
    super.initState();
  }

  initialiseValue() async{
    setState(() { });
  }

  @override
  void dispose() {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext contexwt) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: customAppBar(contexwt, "Edit Profile"),
      body: SafeArea(
        child: screenWidth < 610 ?
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 15.0.h),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(height: 10.0,),
                  //Change Profile Image
                  changeProfile(),
                  const SizedBox(height: 35,),
                  formFields(),
                  const SizedBox(height: 10,)
                ],
              )
            ),
          ),
        )
        :
        SingleChildScrollView(
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width/1.82,
                height: MediaQuery.of(context).size.height,
                color: const Color(0xffD3E9F8),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      left: 50,
                      child: Image.asset(
                          'assets/img/construction.png', 
                          fit: BoxFit.cover,
                          height:500 ,
                      ),
                    ),
                    Positioned(
                      top: 70,
                      left: 125,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Complete", style: roboto(black, 48, 0.0, FontWeight.w200),),
                          Text("Construction",style: roboto(black, 64, 0.0, FontWeight.w800),),
                          Text("Tracking System",style: roboto(black, 36, 0.0, FontWeight.w800),),
                        ],
                      )
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal : 16.0.w),
                  child: Column(
                    children: [
                      //Change Profile Image
                      changeProfile(),
                      const SizedBox(height: 35,),
                      formFields(),
                      const SizedBox(height: 10,)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  changeProfile() {
    return Stack(
      alignment: Alignment.center,
      children:  [
        GestureDetector(
          onTap: (){
            pickFile();
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100.r),
            child : box.read(("editProfile")) != null 
            ? Image.memory(
              box.read(("editProfile")),
              height: 100.h,
              width: 100.h,
              fit: BoxFit.cover,
            )
            :Image.asset(
              "assets/img/profile.png",
              height:  100.h,
              width: 100.h,
              fit: BoxFit.cover,
            )
          ),
        ),
        Positioned(
          bottom: 8,
          right: 0.01,
          child: InkWell(
            onTap: (){
              pickFile();
            },
            child: const CircleAvatar(
              radius: 12,
              backgroundColor:Color.fromARGB(255, 151, 151, 151),
              child: Icon(
                Icons.edit,
                color: Colors.white,
                size:  15,
              ),
            ),
          ),
        )
      ]
    );
  }

  formFields(){
    return Column(
      children: [
        CustomTextFieldWeb(
          textfieldHeight: 50,
          readOnly: false,
          textController: firstNameController,
          labelText: 'First Name',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'First Name Required';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextFieldWeb(
          textfieldHeight: 50,
          readOnly: false,
          textController: lastNameController,
          labelText: 'Last Name',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Last Name Required';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextFieldWeb(
          textfieldHeight: 50,
          labelText: 'Email',
          textController: emailController,
          // validator: (email) => email != null && !EmailValidator.validate(email)
          //   ? "Enter a valid email"
          //   : null,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextFieldWeb(
          textfieldHeight: 50,
          readOnly: false,
          labelText: 'Phone',
          textController: phoneController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Contact is Required';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextFieldWeb(
          textfieldHeight: 50,
          readOnly: false,
          labelText: 'Note',
          textController: bioController,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomButton(
          fontColor: white,
          buttonBgColor: violet,
          text: 'Update',
          onPressed:()async {
            final isValid = formKey.currentState!.validate();
            if (!isValid) return;
          },
        ),
      ],
    );
  }

  Future pickFile()async{
    FilePickerResult? filePicker = await FilePicker.platform.pickFiles();
    if(filePicker != null){
      setState(() {
        webfiles = filePicker.files.first.bytes;
        box.write("editProfile", webfiles);
      });
    }
  }
}