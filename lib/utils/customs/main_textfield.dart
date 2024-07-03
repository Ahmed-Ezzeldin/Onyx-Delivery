import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onyx_delivery/services/localization/app_language.dart';
import 'package:onyx_delivery/services/theme/app_colors.dart';

enum Validator {
  required,
  userId,
  password,
}

class MainTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final String? label;
  final Widget? icon;
  final bool isObscure;
  final bool isReadOnly;
  final bool? enableInteractiveSelection;
  final bool isAutofocus;
  final bool isFilled;
  final bool isDense;
  final Color? fillColor;
  final Color? cursorColor;
  final int maxLines;
  final double borderRadius;
  final double borderWidth;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? errorText;
  final String? matchedValue;
  final FocusNode? focusNode;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextInputAction textInputAction;
  final EdgeInsetsGeometry? contentPadding;
  final Validator? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextDirection? textDirection;
  final Function(PointerDownEvent)? onTapOutside;
  final Function()? onTap;
  final Function(String? x)? onChanged;
  final Function(String? x)? onFieldSubmitted;

  const MainTextField({
    required this.controller,
    this.hint,
    this.label,
    this.icon,
    this.isObscure = false,
    this.isReadOnly = false,
    this.isAutofocus = false,
    this.isFilled = false,
    this.isDense = false,
    this.enableInteractiveSelection,
    this.fillColor,
    this.cursorColor = AppColors.primaryColor,
    this.maxLines = 1,
    this.borderRadius = 10,
    this.borderWidth = 1.2,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.prefixIcon,
    this.errorText,
    this.matchedValue,
    this.focusNode,
    this.textAlign = TextAlign.start,
    this.textStyle,
    this.hintStyle,
    this.labelStyle,
    this.textInputAction = TextInputAction.next,
    this.contentPadding,
    this.validator,
    this.inputFormatters,
    this.textDirection,
    this.onTapOutside,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InputBorder? border = this.border ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: Colors.grey, width: borderWidth),
        );
    InputBorder? enabledBorder = this.enabledBorder ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: Colors.grey, width: borderWidth),
        );
    InputBorder? focusedBorder = this.focusedBorder ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: AppColors.primaryColor, width: borderWidth),
        );
    InputBorder? errorBorder = this.errorBorder ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: Colors.red, width: borderWidth),
        );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        cursorWidth: 1.5,
        cursorColor: cursorColor,
        cursorRadius: const Radius.circular(5),
        obscureText: isObscure,
        readOnly: isReadOnly,
        enableInteractiveSelection: enableInteractiveSelection,
        keyboardType: keyboardType,
        style: textStyle ?? const TextStyle(fontSize: 14, color: AppColors.black, fontWeight: FontWeight.normal),
        maxLines: maxLines,
        autofocus: isAutofocus,
        focusNode: focusNode,
        textInputAction: textInputAction,
        textAlign: textAlign!,
        textDirection: textDirection,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          isDense: isDense,
          filled: isFilled,
          fillColor: fillColor,
          focusColor: Colors.teal,
          icon: icon,
          hintText: hint,
          labelText: label,
          errorText: errorText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintStyle: hintStyle ?? const TextStyle(fontSize: 14, color: AppColors.black, fontWeight: FontWeight.normal),
          labelStyle: labelStyle,
          contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          border: border,
          enabledBorder: enabledBorder,
          focusedBorder: focusedBorder,
          errorBorder: errorBorder,
          errorMaxLines: 2,
        ),
        validator: (value) {
          switch (validator) {
            case Validator.required:
              if (value!.trim().isEmpty) {
                return "Required".localize(context);
              }
              return null;
            case Validator.userId:
              if ("$value".trim().isEmpty) {
                return "Please enter your user ID".localize(context);
              }
              return null;
            case Validator.password:
              if ("$value".trim().isEmpty) {
                return "Please enter your password".localize(context);
              }
              return null;
            default:
              return null;
          }
        },
        onTapOutside: onTapOutside ?? (_) => FocusScope.of(context).unfocus(),
        onTap: onTap,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }
}
