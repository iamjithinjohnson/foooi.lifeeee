import 'package:flutter/material.dart';
import 'package:foi/widgets/ww_textfield/text_field_base.dart';

class WwTextFieldTextArea extends WwTextFieldBase {
  final int maximumLines;
  const WwTextFieldTextArea({
    super.key,
    super.title,
    super.controller,
    super.hintText,
    super.onChanged,
    super.maxLength,
    this.maximumLines = 5,
    super.enableBorder,
    super.textInputAction,
    super.enableFocusBorder,
    super.textCapitalization,
    super.minLines,
    super.fillColor,
    super.focusNode,
    super.validator,
    super.required,
    super.enable,
    super.readOnly,
  }) : super(keyboardType: TextInputType.multiline, maxLines: maximumLines);
}
