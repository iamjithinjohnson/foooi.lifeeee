import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:foi/widgets/ww_country_picker/country_phone_util.dart';
import 'package:foi/widgets/ww_textfield/ww_text_field_phone.dart';
import 'package:get/get.dart';

class WwTextFieldPhonePicker extends StatefulWidget {
  const WwTextFieldPhonePicker({
    super.key,
    required this.onChanged,
    required this.controller,
    required this.hintText,
    this.enable = true,
    this.enableBorder = false,
  });
  final Function(CountryCode countryCode, int maxLength) onChanged;
  final TextEditingController controller;
  final String hintText;
  final bool enable;
  final bool enableBorder;
  @override
  State<WwTextFieldPhonePicker> createState() => _WwTextFieldPhonePickerState();
}

class _WwTextFieldPhonePickerState extends State<WwTextFieldPhonePicker> {
  int? maxLengthPhone = 10;
  String? regexPatternPhone =
      r'^[6-9]\d{9}$'; // Default regex pattern for India

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WwCountryPickerAuth(
          onChanged: (code, maxLength, regexPattern) {
            setState(() {
              maxLengthPhone = maxLength;
              regexPatternPhone = regexPattern;
            });
            widget.onChanged(code, maxLength);
          },
        ),
        SizedBox(width: 10),
        Expanded(
          child: WwTextFieldPhone(
            enableBorder: widget.enableBorder,
            enable: widget.enable,
            controller: widget.controller,
            hintText: widget.hintText,
            phoneMaxLength: maxLengthPhone,
            enableFocusBorder: false,
            showValidator: false,
            prefixCustom: const SizedBox(),
            textInputAction: TextInputAction.next,
            regexPattern: regexPatternPhone,
          ),
        ),
      ],
    );
  }
}

class WwCountryPickerAuth extends StatelessWidget {
  final Function(CountryCode countryCode, int maxLength, String regexPattern)
  onChanged;
  const WwCountryPickerAuth({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: CountryCodePicker(
        onChanged: (CountryCode countryCode) {
          // Get the max length for this country and pass it along with the country code
          final maxLength = CountryPhoneUtil.getMaxPhoneLength(countryCode);
          final regexPattern = CountryPhoneUtil.getPhoneRegexPattern(
            countryCode,
          );

          onChanged(countryCode, maxLength, regexPattern);
        },
        initialSelection: 'IN',
        favorite: const ['IN', 'US', 'CA', 'UK'],
        showCountryOnly: false,
        showOnlyCountryWhenClosed: false,
        alignLeft: false,
        flagWidth: 24,
        padding: const EdgeInsets.all(8),
        textStyle: Get.textTheme.bodyMedium,
      ),
    );
  }
}
