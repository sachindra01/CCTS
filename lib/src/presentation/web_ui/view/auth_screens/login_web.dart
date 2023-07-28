import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_button.dart';
import 'package:ccts/src/presentation/web_ui/view/home/site_work.dart';
import 'package:ccts/src/presentation/web_ui/widgets/custom_textfield_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginWeb extends StatefulWidget {
  const LoginWeb({super.key});

  @override
  State<LoginWeb> createState() => _LoginWebState();
}

class _LoginWebState extends State<LoginWeb> {
  bool isChecked = false;
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left : 10, right: 10, top: 20),
        child: Column(
          children: [
            //Login Form
            loginForm(),
            const SizedBox(height: 12),
            //Privacy Policy
            privacyPolicy(),
            const SizedBox(height: 22),
            //Submit Button
            signInButton(),
          ],
        ),
      ),
    );
  }

  //Login Form
  Form loginForm() {
    return Form(
      child: Column(
        children: [
          //Email
          CustomTextFieldWeb(
            textfieldHeight: 56.9.h,
            labelText: "E-mail",
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 18),
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
          const SizedBox(height: 18),
          //OTP
          CustomTextFieldWeb(
            textfieldHeight: 56.9.h,
            labelText: "OTP",
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }

  //Privacy Policy
  Row privacyPolicy() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
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

  //Bottom Segment
  CustomButton signInButton() {
    return CustomButton(
      width: 85.w,
      text: "Sign In",
      textStyle: roboto(white, 16.0, 0.0),
      onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const SiteWorkPage())));
      }, 
      buttonBgColor: violet,
      buttonRadius: 4.0.r,
      fontColor: white,
    );
  }
}

