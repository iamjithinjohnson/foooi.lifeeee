import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foi/utils/assets/svg_assets.dart';
import 'package:foi/widgets/ww_textfield/text_field_base.dart';

class WwTextFieldPassword extends WwTextFieldBase {
  final bool showValidator;
  final String? Function(String?)? customValidator;
  WwTextFieldPassword({
    super.key,
    this.showValidator = false,
    this.customValidator,
    super.title,
    super.controller,
    super.hintText,
    super.suffixTap,
    super.suffixIcon,
    super.obscureText,
    super.textInputAction,
    super.autofillHints,
    super.onFieldSubmitted,
    super.enableBorder,
  }) : super(
         keyboardType: TextInputType.text,
         prefixIcon: SvgPicture.asset(AssetsSvg.passwordOutline),
         maxLines: 1, // mandatory field
         // autofillHints: const [AutofillHints.password],
         validator:
             customValidator ??
             (p0) {
               return showValidator
                   ? p0?.isEmpty == true
                         ? ''
                         : null
                   : null;
             },
       );
}
