import 'package:flutter/material.dart';

class InfoTextInput extends StatelessWidget {
  InfoTextInput({
    this.textCapitalization,
    this.keyboardType,
    @required this.textInputAction,
    @required this.labelText,
    @required this.validator,
    @required this.onSaved,
    @required this.onFieldSubmitted,
  });

  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String labelText;
  final Function validator;
  final Function onSaved;
  final Function onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: textCapitalization == null
          ? TextCapitalization.none
          : textCapitalization,
      keyboardType: keyboardType == null ? TextInputType.text : keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(labelText: labelText),
      validator: validator,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
