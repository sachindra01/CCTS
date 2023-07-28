import 'package:ccts/src/config/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFieldWeb extends StatelessWidget {
  final double? textfieldHeight, textFieldWidth, hintTextSize, labelTextSize, contentTopPadding, inputFontSize;
  final TextEditingController? textController;
  final Widget? prefixIcon, suffixIcon;
  final String? prefixText, suffixText;
  final Widget? prefix, suffix;
  final String ?labelText, hintText;
  final String? initialValue;
  final Color? hintTextColor;
  final bool? obscureText, readOnly, isReadable;
  final String? Function(String?)? validator;
  final Function(String)? onChange;
  final TextInputType? keyboardType;
  final VoidCallback? ontap;
  const CustomTextFieldWeb({
    Key? key, this.labelText, this.hintTextColor, this.textfieldHeight, this.prefixIcon, this.suffixIcon, this.prefixText, this.suffixText, this.obscureText, this.validator, this.keyboardType, this.textController, this.initialValue, this.onChange, this.textFieldWidth, this.hintText, this.hintTextSize, this.labelTextSize, this.prefix, this.suffix, this.readOnly, this.ontap, this.isReadable, this.contentTopPadding, this.inputFontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: textfieldHeight ?? 60,
      width: textFieldWidth,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(
        left: 10,
        right: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const[
          BoxShadow(
            color:  Color.fromARGB(255, 223, 223, 223),
            offset:  Offset(0, 5),
            blurRadius: 5
          )
        ]
      ),
      child: TextFormField(
        onTap: ontap,
        controller: textController,
        initialValue: initialValue,
        obscureText: obscureText ?? false,
        keyboardType: keyboardType,
        onChanged: onChange,
        style: roboto(isReadable == true ? const Color.fromARGB(255, 153, 153, 153) : black, inputFontSize ?? 14, 0.0),
        readOnly: readOnly ?? false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(0.0, prefixIcon == null ? contentTopPadding ?? 3.8 : contentTopPadding?? 8, 0.0, 3.8),
          prefixIconConstraints: BoxConstraints(
            minWidth: 3.2.w
          ),
          suffixIconConstraints: BoxConstraints(
            minWidth: 3.2.w
          ),
          border: InputBorder.none,
          hintText: hintText,
          labelText: labelText,
          hintStyle: roboto(hintTextColor ?? const Color.fromARGB(255, 153, 153, 153), hintTextSize ?? 14, 0.0),
          labelStyle: roboto(hintTextColor ?? const Color.fromARGB(255, 153, 153, 153), labelTextSize ?? 14, 0.0),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(top: 0, right: 5.0),
            child: prefixIcon,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(top: 1.5, left: 10.0),
            child: suffixIcon,
          ),
          prefix: prefix,
          suffix: suffix,
          prefixText: prefixText,
          suffixText: suffixText,
        ),
      ),
    );
  }
}