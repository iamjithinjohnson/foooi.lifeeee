import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foi/widgets/ww_textfield/text_field_base.dart';

class WwTextFieldPhone extends WwTextFieldBase {
  final bool showValidator;
  final int? phoneMaxLength;
  final Widget? prefixCustom;
  final String? regexPattern;

  WwTextFieldPhone({
    super.key,
    this.showValidator = false,
    this.phoneMaxLength,
    this.prefixCustom,
    this.regexPattern,
    super.title,
    super.controller,
    super.labelText,
    super.onChanged,
    super.suffixIcon,
    super.suffixTap,
    super.autofocus,
    super.required,
    super.readOnly,
    super.hintText,
    super.textInputAction,
    super.enableBorder,
    super.fillColor,
    super.enable,
    super.enableFocusBorder,
  }) : super(
         keyboardType: TextInputType.phone,
         autovalidateMode: AutovalidateMode.onUserInteraction,
         prefixIcon: null,
         //  prefixIcon: prefixCustom ?? SvgPicture.asset(AssetsSvg.phoneOutline),
         inputFormatters: [
           LengthLimitingTextInputFormatter(phoneMaxLength),
           // FilteringTextInputFormatter.allow(
           //     RegExp(regexPattern ?? r'[0-9+]')),
           // if (phoneMaxLength != null)
           //   LengthLimitingTextInputFormatter(phoneMaxLength),
         ],
         validator: (p0) {
           if (!showValidator) return null;

           if (p0?.isEmpty == true) return '';

           if (phoneMaxLength != null && p0!.length != phoneMaxLength) {
             return 'Phone number must be $phoneMaxLength digits';
           }

           if (regexPattern != null && !RegExp(regexPattern).hasMatch(p0!)) {
             return 'Please enter a valid phone number';
           }

           return null;
         },
       );

  @override
  Widget build(BuildContext context) {
    debugPrint('Regex pattern: $regexPattern');
    debugPrint('Max length: $phoneMaxLength');
    return super.build(context);
  }
}
