import 'package:flutter/material.dart';
import 'package:capyba_challenge/global/styles/constants.dart';

class CustomInputField extends StatelessWidget {
  final String hint;
  final IconData iconData;
  final TextInputType inputType;
  final String initialValue;
  final EdgeInsets fieldMargin;
  final bool disableTextField;
  final Function onChanged;
  final Function validator;

  CustomInputField({
    @required this.hint,
    @required this.iconData,
    @required this.inputType,
    @optionalTypeArgs this.initialValue,
    @optionalTypeArgs this.fieldMargin,
    @optionalTypeArgs this.disableTextField,
    @optionalTypeArgs this.onChanged,
    @optionalTypeArgs this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: fieldMargin != null ? fieldMargin : EdgeInsets.only(bottom: 24),
      child: TextFormField(
        initialValue: initialValue,
        enabled: disableTextField != null ? disableTextField : null,
        validator: validator,
        onChanged: onChanged,
        cursorColor: Theme.of(context).primaryColor,
        keyboardType: inputType,
        keyboardAppearance: Brightness.dark,
        obscureText: inputType == TextInputType.visiblePassword ? true : false,
        style: InputTextStyle,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: hint,
          prefixIconConstraints: BoxConstraints(maxHeight: 24.0),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: iconData != null
                ? Icon(
                    iconData,
                    color: kMainColor,
                  )
                : Container(),
          ),
          hintStyle: InputTextStyle.copyWith(
            color: kInactiveColor.withOpacity(0.3),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: kInactiveColor,
              width: 1,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: kMainColor,
              width: 1,
            ),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: kInactiveColor,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
