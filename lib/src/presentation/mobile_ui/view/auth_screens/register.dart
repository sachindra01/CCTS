import 'package:ccts/src/common/read_write.dart';
import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/presentation/mobile_ui/view/auth_screens/login_and_register.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_button.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isChecked = false;
  bool isRegistered = false;
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  String userId = "1";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10.0.sp),
        child: Column(
          children: [
            //Register Form
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.0.sp),
              child: registerForm(),
            ),
            SizedBox(height: 6.h,),
            //Privacy Policy
            subscribe(),
            SizedBox(height: 6.h,),
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
      text: "Register",
      textStyle: roboto(white, 16.0, 0.0),
      onPressed: () async{
        setState(() {
          userId = userId == "3" ? "3" : "2";
        });
        write("userId", userId);
        Navigator.of(context).push(MaterialPageRoute(builder: ((context) => LoginAndRegister(
          userId: userId,
        ))));
      }, 
      buttonBgColor: violet, 
      fontColor: white,
      buttonRadius: 4.0.r,
    );
  }

  //subscribe button
  subscribe(){
    //subscribe button
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
          value: isRegistered, 
          onChanged: (value){
            setState(() {
              isRegistered = value!;
              userId = isRegistered == true ? "3" : "1";
            });
          }
        ),
        Text("Subscribe Us", style: roboto(black, 12.0, 0.0)),
      ],
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
          value: isChecked, 
          onChanged: (value){
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
          const CustomTextField(
            labelText: "Username",
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 20.h,),
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
          SizedBox(height: 20.h,),
          //Confirm Password
          CustomTextField(
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