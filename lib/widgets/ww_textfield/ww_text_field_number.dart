import 'package:flutter/services.dart';
import 'package:foi/widgets/ww_textfield/text_field_base.dart';

class WwTextFieldNumber extends WwTextFieldBase {
  final bool showValidator;
  final int? phoneMaxLength;

  WwTextFieldNumber({
    super.key,
    this.showValidator = true,
    this.phoneMaxLength,
    super.title,
    super.controller,
    super.labelText,
    super.onChanged,
    super.suffixIcon,
    super.suffixTap,
    super.autofocus,
    super.maxLength,
    super.required,
    super.textInputAction,
    super.hintText,
    super.autovalidateMode,
    super.enableBorder,
  }) : super(
         keyboardType: TextInputType.number,
         inputFormatters: [
           FilteringTextInputFormatter.allow(RegExp(r'[0-9+.]')),
           if (phoneMaxLength != null)
             LengthLimitingTextInputFormatter(phoneMaxLength),
         ],
         validator: (p0) {
           if (!showValidator) return null;

           if (p0?.isEmpty == true) return '';

           return null;
         },
       );
}
