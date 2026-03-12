import 'package:foi/widgets/ww_textfield/text_field_base.dart';

class WwTextField extends WwTextFieldBase {
  final bool showValidator;

  const WwTextField({
    this.showValidator = false,
    super.key,
    super.title,
    super.controller,
    super.hintText,
    super.onChanged,
    super.suffixIcon,
    super.suffixTap,
    super.prefixIcon,
    super.filled,
    super.labelText,
    super.maxLength,
    super.required,
    super.maxLines,
    super.readOnly,
    super.textCapitalization,
    super.autofocus,
    super.textInputAction,
    super.enableBorder,
    super.validator,
    super.focusNode,
    super.keyboardType,
    super.autovalidateMode,
    super.enable,
    super.onFieldSubmitted,
    super.onTap,
    super.textAlign,
    super.style,
  });
}
