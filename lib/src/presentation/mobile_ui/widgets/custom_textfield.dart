import 'package:ccts/src/config/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final double? textfieldHeight, textFieldWidth, hintTextSize, labelTextSize;
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
  final TextStyle? style;
  final TextStyle? hintsstyle;
  final int? maxlines;
  final bool? textFieldFocus;
  const CustomTextField({
    Key? key, this.labelText, this.hintTextColor, this.textfieldHeight, this.prefixIcon, this.suffixIcon, this.prefixText, this.suffixText, this.obscureText, this.validator, this.keyboardType, this.textController, this.initialValue, this.onChange, this.textFieldWidth, this.hintText, this.hintTextSize, this.labelTextSize, this.prefix, this.suffix, this.readOnly, this.ontap, this.isReadable, this.maxlines, this.style, this.hintsstyle, this.textFieldFocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: textfieldHeight ?? 60.h,
      width: textFieldWidth,
      alignment: Alignment.center,
      padding: EdgeInsets.only(
        left: 10.0.w,
        right: 10.0.w,
      ),
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
      child: TextFormField(
        autofocus:textFieldFocus??false ,
        onTap: ontap,
        controller: textController,
        initialValue: initialValue,
        obscureText: maxlines == null ? false : obscureText ?? false,
        keyboardType: keyboardType,
        onChanged: onChange,
        style: roboto(isReadable == true ? const Color.fromARGB(255, 153, 153, 153) : black, 15, 0.0),
        readOnly: readOnly ?? false,
        maxLines: maxlines,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(0.0.w, 3.8.h, 0.0.w, 3.8.h),
          prefixIconConstraints: BoxConstraints(
            minWidth: 12.0.w
          ),
          suffixIconConstraints: BoxConstraints(
            minWidth: 12.0.w
          ),
          border: InputBorder.none,
          hintText: hintText,
          labelText: labelText,
          hintStyle: hintsstyle?? roboto(hintTextColor ?? const Color.fromARGB(255, 153, 153, 153), hintTextSize ?? 15, 0.0),
          labelStyle: style??roboto(hintTextColor ?? const Color.fromARGB(255, 153, 153, 153), labelTextSize ?? 15, 0.0),
          prefixIcon: Padding(
            padding: EdgeInsets.only(top: 1.5.h, right: 5.0.w),
            child: prefixIcon,
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.only(top: 1.5.h, left: 10.0.w),
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