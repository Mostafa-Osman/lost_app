
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lost_app/app/common/themes/app_colors.dart';
import 'package:lost_app/app/common/themes/app_theme.dart';
import 'package:lost_app/app/common/widgets/input_field/password_strength_widget.dart';

class DefaultTextField extends StatefulWidget {
  final String? title;
  final String? hintText;
  final bool readOnly;
  final bool autofocus;
  final Color? enabledBorderColor;
  final TextEditingController? controller;
  final TextAlign? textAlign;
  final String? prefixIconPath;
  final String? suffixIconPath;
  final String? Function(String? value)? validator;
  final void Function(String value)? onChange;
  final void Function(String? value)? onActionPressed;
  final VoidCallback? onPress;
  final VoidCallback? onSuffixIconPressed;
  final int? maxLength;
  final TextInputType? textInputType;
  final bool isPasswordField;
  final Color? fillColor;
  final Color? textInputColor;
  final bool isPasswordStrengthEnabled;
  final TextInputAction? textInputAction;
  final String? fontFamily;

  const DefaultTextField({
    this.title,
    this.hintText,
    this.controller,
    this.textAlign,
    this.prefixIconPath,
    this.suffixIconPath,
    this.validator,
    this.onChange,
    this.onActionPressed,
    this.autofocus = false,
    this.onPress,
    this.enabledBorderColor,
    this.maxLength,
    this.textInputType,
    this.isPasswordField = false,
    this.onSuffixIconPressed,
    this.fillColor,
    this.textInputColor,
    this.isPasswordStrengthEnabled = false,
    this.textInputAction,
    this.readOnly = false,
    this.fontFamily,
  });

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  late bool obscureText;
  FocusNode? focusNode;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController();
    obscureText = widget.isPasswordField;
    focusNode = widget.readOnly ? null : FocusNode();
    focusNode?.addListener(refreshScreen);
  }

  void refreshScreen() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: focusNode?.requestFocus,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null) ...[
            Text(
              widget.title!,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5)
          ],
          TextFormField(
            keyboardType: widget.textInputType,
            inputFormatters: inputFormatters,
            autofocus: widget.autofocus,
            obscuringCharacter: '*',
            textInputAction: widget.textInputAction,
            focusNode: focusNode,
            readOnly: widget.readOnly,
            style: TextStyle(
              fontSize: 14,
              height: 1.7,
              fontFamily: widget.fontFamily,
              color: widget.textInputColor ?? inputTextColor,
            ),
            controller: controller,
            cursorColor: AppColors.lightPrimaryColor,
            decoration: inputDecoration,
            obscureText: obscureText,
            validator: widget.validator,
            textAlign: widget.textAlign ?? TextAlign.start,
            onFieldSubmitted: widget.onActionPressed,
            onTap: () => setState(() {
              widget.onPress?.call();
              focusNode?.requestFocus();
            }),
            onChanged: (v) => setState(() {
              widget.onChange?.call(v);
            }),
          ),
          const SizedBox(height: 5),
          if (widget.isPasswordStrengthEnabled && controller.text.length > 8)
            PasswordStrengthWidget(controller.text),
        ],
      ),
    );
  }

  Color get iconColor => isFocused || controller.text.isNotEmpty
      ? AppColors.lightPrimaryColor
      : AppColors.blackNeutral50;

  List<TextInputFormatter> get inputFormatters =>
      [LengthLimitingTextInputFormatter(widget.maxLength)];

  Color get inputTextColor =>
      isFocused ? AppTheme.lightPrimaryColor : AppColors.darkPrimaryColor;

  bool get isFocused => focusNode != null && focusNode!.hasFocus;

  OutlineInputBorder _buildOutlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(10),
    );
  }

  InputDecoration get inputDecoration => InputDecoration(
        contentPadding: EdgeInsets.zero,
        errorMaxLines: 3,
        filled: true,
        fillColor: widget.fillColor ?? AppColors.fillColor,
        enabledBorder: _buildOutlineInputBorder(
          widget.enabledBorderColor ?? Colors.grey.shade400,
        ),
        border: _buildOutlineInputBorder(Colors.grey.shade400),
        errorBorder: _buildOutlineInputBorder(AppColors.redColor),
        focusedBorder: _buildOutlineInputBorder(
          focusNode != null ? AppTheme.lightPrimaryColor : Colors.grey.shade400,
        ),
        hintText: widget.hintText ?? widget.title,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: Colors.grey.shade500,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SvgPicture.asset(
            widget.prefixIconPath!,
            color: iconColor,
            fit: BoxFit.fill,
          ),
        ),
        suffixIcon: widget.isPasswordField
            ? InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () => setState(() => obscureText = !obscureText),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SvgPicture.asset(
                    obscureText
                        ? 'assets/icons/eye_slash.svg'
                        : 'assets/icons/eye.svg',
                    width: 18,
                    height: 18,
                    color: iconColor,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            : widget.suffixIconPath != null
                ? GestureDetector(
                    onTap: widget.onSuffixIconPressed,
                    child: SvgPicture.asset(
                      widget.suffixIconPath!,
                      width: 7.6,
                      color: iconColor,
                      fit: BoxFit.scaleDown,
                    ),
                  )
                : null,
      );

  @override
  void dispose() {
    focusNode?.dispose();
    focusNode?.removeListener(refreshScreen);
    super.dispose();
  }
}
