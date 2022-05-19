import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    this.controller,
    this.tittle,
    this.onSaved,
    this.onChanged,
    this.textValidation,
    this.suffixIcon,
    this.maxLines,
    this.hint = '',
    this.prefixIcon,
    this.bigField = false,
    this.titleStyle,
    this.hintTitle,
    this.hintStyle,
    this.icon,
    this.prefix,
    this.textHint,
    this.fillColor,
    this.visibleIconOnPress,
    this.keyboardType,
    this.contentPadding,
    this.height = 40,
    this.maxLength,
    this.borderRadius,
    this.obscureText,
    this.title,
    this.textAlign,
    this.enabled = true,
    this.hasShadow = true,
    this.customShadow,
    this.enabledBorder,
    this.onPress,
  });
  final VoidCallback? onPress;
  final String? tittle;
  final String? textValidation;
  final String? hint;
  final String? hintTitle;
  final String? textHint;
  final String? title;
  final TextStyle? titleStyle;
  final int? maxLines;
  final int? maxLength;
  final Function(String)? onSaved;
  final Function(String)? onChanged;
  final VoidCallback? visibleIconOnPress;
  final TextEditingController? controller;
  final BorderRadius? borderRadius;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? icon;
  final Widget? prefix;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final bool? bigField;
  final Color? fillColor;
  final double? height;
  final EdgeInsets? contentPadding;
  final TextStyle? hintStyle;
  final TextAlign? textAlign;
  final bool? enabled;
  final bool? hasShadow;
  final List<BoxShadow>? customShadow;
  final OutlineInputBorder? enabledBorder;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (tittle != null)
          Row(
            children: [
              Text(
                '$tittle',
              ),
              const SizedBox(
                width: 8,
              ),
              if (hint != null)
                Text(
                  '$hint',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontSize: 10,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.normal,
                      ),
                ),
            ],
          ),
        SizedBox(
          height: tittle == null ? 0 : 6,
        ),
        Container(
          height: bigField == true ? null : height ?? 40,
          decoration: BoxDecoration(
            boxShadow: hasShadow != true
                ? []
                : customShadow ??
                    [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 10,
                        spreadRadius: 5,
                      )
                    ],
          ),
          child: TextFormField(
            enabled: enabled,
            onTap: onPress,
            textAlign: textAlign ?? TextAlign.right,
            obscureText: obscureText ?? false,
            controller: controller,
            keyboardType: keyboardType,
            onSaved: (v) => onSaved?.call(v ?? ''),
            onChanged: (v) => onChanged?.call(v),
            cursorColor: Theme.of(context).primaryColor,
            style: const TextStyle(fontWeight: FontWeight.normal),
            inputFormatters: keyboardType == TextInputType.number
                ? [FilteringTextInputFormatter.digitsOnly]
                : [],
            maxLength: maxLength,
            decoration: InputDecoration(
              filled: true,
              fillColor: fillColor ?? Colors.white,
              hintText: title ?? 'اكتب${tittle!}',
              suffixIcon: textHint == 'pass'
                  ? IconButton(
                      icon: Icon(
                        obscureText! ? Icons.visibility_off : Icons.visibility,
                      ),
                      color: Colors.grey,
                      iconSize: 20,
                      onPressed: visibleIconOnPress,
                    )
                  : suffixIcon,
              prefixIcon: prefixIcon,
              prefix: prefix,
              prefixStyle: const TextStyle(color: Colors.black26),
              icon: icon,
              enabledBorder: enabledBorder ??
                  OutlineInputBorder(
                    borderRadius: borderRadius ?? BorderRadius.circular(4),
                    borderSide: BorderSide.none,
                  ),
              focusedBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
              ),
              border: enabledBorder,
              hintStyle: hintStyle ??
                  TextStyle(
                    color: Colors.grey[400],
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
              contentPadding:
                  contentPadding ?? const EdgeInsets.symmetric(horizontal: 4),
              counterText: '',
            ),
            maxLines: maxLines ?? 1,
            validator: (value) =>
                value!.trim().isEmpty ? '$textValidation' : null,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        if (hintTitle == null)
          const SizedBox()
        else
          Text(
            hintTitle!,
            style: hintStyle ??
                Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Colors.grey[200],
                      fontWeight: FontWeight.w700,
                    ),
          )
      ],
    );
  }
}
