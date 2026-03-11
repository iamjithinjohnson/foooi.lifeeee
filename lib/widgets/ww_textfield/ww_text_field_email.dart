import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foi/utils/assets/svg_assets.dart';

import 'package:foi/widgets/ww_textfield/text_field_base.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

class WwTextFieldEmail extends WwTextFieldBase {
  WwTextFieldEmail({
    super.key,
    super.title,
    super.controller,
    super.hintText,
    super.onChanged,
    super.autofocus,
    super.readOnly,
    super.textInputAction,
    super.enableBorder,
    super.autofillHints,
    super.required,
    super.autovalidateMode,
    super.enable,
  }) : super(
         keyboardType: TextInputType.emailAddress,
         prefixIcon: SvgPicture.asset(AssetsSvg.emailOutline),
         validator: (v) {
           if (v == null || v.isEmpty) {
             return required ? 'Please enter an email address' : null;
           }

           if (!GetUtils.isEmail(v)) {
             return 'Please enter a valid email address';
           }

           // Removed TLD validation to accept all valid email formats
           // GetUtils.isEmail() already validates the email structure

           // final emailPattern = RegExp(
           //   r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
           // );

           // if (!emailPattern.hasMatch(v)) {
           //   return 'Please enter a valid email address';
           // }

           return null;
         },
       );
}
