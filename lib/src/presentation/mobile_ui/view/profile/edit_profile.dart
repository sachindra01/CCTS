import 'dart:io';
import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_appbar.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_button.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get_storage/get_storage.dart';

class EditProfilePage extends StatefulWidget {
  final String? email, userName, phone, role, bio, profileUrl, userID;
  const EditProfilePage({super.key, this.userName, this.role, this.email, this.phone, this.userID, this.bio, this.profileUrl});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  //Form Key for validation
  final formKey = GlobalKey<FormState>();

  File? file;
  final box = GetStorage();
  String? updateUrl;

  @override
  void initState() {
    initialiseValue();
    userNameController.text = widget.userName?? "";
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: customAppBar(context, "Profile"),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 14.0.w, vertical: 20.0.h),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(height: 14.0,),
                  //Change Profile Image
                  changeProfile(),
                  const SizedBox(height: 35,),
                  formFields(),
                  const SizedBox(height: 10,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  changeProfile() {
    return InkWell(
      onTap: (){
        showBottomSheet();
      },
      child: Container(
        height:  MediaQuery.of(context).size.height * 0.13,
        width: MediaQuery.of(context).size.height * 0.13,
        padding: EdgeInsets.only(bottom: 10.h),
        alignment: Alignment.bottomRight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          image: DecorationImage(
            image: box.read("pickedImage") != null 
            ? FileImage(box.read("pickedImage")) as ImageProvider<Object>
            : const AssetImage("assets/img/profile.png"),
            fit: BoxFit.cover,
          ),
        ),
        //Edit Icon
        child: Container(
          height: 25.0.h,
          width: 25.0.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0.r),
            boxShadow: [
              BoxShadow(
                color: black.withOpacity(0.3),
                offset: const Offset(2, 4),
                blurRadius: 5.r
              )
            ],
            color: grey,
          ),
          child: Icon(Icons.edit, size: 18.sp, color: white,),
        ),
      ),
    );
  }

  formFields(){
    return Column(
      children: [
        CustomTextField(
          readOnly: false,
          obscureText: false,
          textController: userNameController,
          labelText: 'Name',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Name Required';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          labelText: 'Email',
          obscureText: false,
          textController: emailController,
          // validator: (email) => email != null && !EmailValidator.validate(email)
          //   ? "Enter a valid email"
          //   : null,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          readOnly: false,
          obscureText: false,
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
        CustomTextField(
          readOnly: false,
          obscureText: false,
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

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      setState(() {
        file = File(image.path);
        box.write("pickedImage", file);
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print("Failed to upload image: $e");
    }
  }

  showBottomSheet(){
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
                pickImage(ImageSource.camera).then((value) => Navigator.pop(context));
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
                pickImage(ImageSource.gallery).then((value) => Navigator.pop(context));
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
}