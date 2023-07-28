import 'package:ccts/src/common/read_write.dart';
import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/presentation/mobile_ui/view/home/home_page.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_button.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  final String? userId;
  const Login({super.key,  this.userId});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isChecked = false;
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10.0.sp),
        child: Column(
          children: [
            //Login Form
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.0.sp),
              child: loginForm(),
            ),
            SizedBox(height: 6.h,),
            //Privacy Policy
            privacyPolicy(),
            SizedBox(height: 12.h,),
            //Submit Button
            signInButton(),
            SizedBox(height: 40.h,),
            //Bottom segment
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Complete", style: roboto(black, 16.0, 0.0, FontWeight.w200),),
                    Text("Construction", style: roboto(black, 20.0, 0.0, FontWeight.w800),),
                    Text("Tracking System", style: roboto(black, 14.0, 0.0, FontWeight.w800),),
                  ],
                ),
                Image.asset(
                  "assets/img/loginPic.png",
                  width: 184.w,
                  height: 144.h,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //Bottom Segment
  CustomButton signInButton() {
    return CustomButton(
      text: "Sign In",
      textStyle: roboto(white, 16.0, 0.0),
      onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: ((context) => HomePage(
          registerId: read("userId") == "" ? "1" : read("userId"),
        ))));
      }, 
      buttonBgColor: violet,
      buttonRadius: 4.0.r,
      fontColor: white,
    );
  }

  //Privacy Policy
  Row privacyPolicy() {
    return Row(
      children: [
        Checkbox(
          activeColor: green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0.r),
          ),
          side: MaterialStateBorderSide.resolveWith(
            (states) => const BorderSide(width: 1.0, color: lightGrey),
          ),
          value: isChecked, onChanged: (value){
            setState(() {
              isChecked = value!;
            });
          }
        ),
        Text("I accept terms of the offer of ", style: roboto(black, 12.0, 0.0)),
        InkWell(
          onTap: (){},
          child: Text("the privacy policy", style:  roboto(violet, 12.0, 0.0))
        ),
      ],
    );
  }

  //Login Form
  Form loginForm() {
    return Form(
      child: Column(
        children: [
          //Email
          const CustomTextField(
            labelText: "E-mail",
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 20.h,),
          //Password
          CustomTextField(
            labelText: "Password",
            obscureText: obscurePassword,
            keyboardType: TextInputType.visiblePassword,
            suffix: GestureDetector(
              onTap: (){
                setState(() {
                  obscurePassword = !obscurePassword;
                });
              },
              child: Icon(
                obscurePassword ? Icons.visibility : Icons.visibility_off,
                size: 20,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

