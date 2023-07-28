import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_button.dart';
import 'package:ccts/src/presentation/web_ui/widgets/custom_textfield_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterWeb extends StatefulWidget {
  const RegisterWeb({super.key});

  @override
  State<RegisterWeb> createState() => _RegisterWebState();
}

class _RegisterWebState extends State<RegisterWeb> {
  bool isChecked = false;
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10.0.sp),
        child: Column(
          children: [
            //Register Form
            registerForm(),
            SizedBox(height: 6.h,),
            //Privacy Policy
            privacyPolicy(),
            SizedBox(height: 12.h,),
            //Register Button
            registerButton()
          ],
        ),
      ),
    );
  }

  //Register Button
  CustomButton registerButton() {
    return CustomButton(
      width: 85.w,
      text: "Register",
      textStyle: roboto(white, 16.0, 0.0),
      onPressed: (){}, 
      buttonBgColor: violet, 
      fontColor: white,
      buttonRadius: 4.0.r,
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

  //Register form
  Form registerForm() {
    return Form(
      child: Column(
        children: [
          //User Name
          CustomTextFieldWeb(
            textfieldHeight: 56.9.h,
            labelText: "Username",
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 20.h,),
          //Email
          CustomTextFieldWeb(
            textfieldHeight: 56.9.h,
            labelText: "E-mail",
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 20.h,),
          //Password
          CustomTextFieldWeb(
            textfieldHeight: 56.9.h,
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
          SizedBox(height: 20.h,),
          //Confirm Password
          CustomTextFieldWeb(
            textfieldHeight: 56.9.h,
            labelText: "Confirm Password",
            obscureText: obscureConfirmPassword,
            keyboardType: TextInputType.visiblePassword,
            suffix: GestureDetector(
              onTap: (){
                setState(() {
                  obscureConfirmPassword = !obscureConfirmPassword;
                });
              },
              child: Icon(
                obscureConfirmPassword ? Icons.visibility : Icons.visibility_off,
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