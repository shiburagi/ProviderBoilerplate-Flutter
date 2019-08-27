import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider_boilerplate/components/form_field.dart';

class DecorTextField extends StatelessWidget {
  DecorTextField({
    this.variant = FormFieldVariant.default_,
    this.decoration = const InputDecoration(),
    this.formFieldColor = FormFieldColor.primary,
    Key key,
    this.controller,
    this.initialValue,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.style,
    this.strutStyle,
    this.textDirection,
    this.showCursor,
    this.minLines,
    this.maxLength,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.buildCounter,
    this.cardEffect = false,
    this.elevation = 1.0,
  }) : super(
          key: key,
        );
  final InputDecoration decoration;
  final FormFieldVariant variant;
  final FormFieldColor formFieldColor;
  final TextEditingController controller;
  final String initialValue;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization = TextCapitalization.none;
  final TextInputAction textInputAction;
  final TextStyle style;
  final StrutStyle strutStyle;
  final TextDirection textDirection;
  final TextAlign textAlign = TextAlign.start;
  final bool autofocus = false;
  final bool readOnly = false;
  final bool showCursor;
  final bool obscureText = false;
  final bool autocorrect = true;
  final bool autovalidate = false;
  final bool maxLengthEnforced = true;
  final int maxLines = 1;
  final int minLines;
  final bool expands = false;
  final int maxLength;
  final ValueChanged<String> onChanged;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onFieldSubmitted;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final List<TextInputFormatter> inputFormatters;
  final bool enabled = true;
  final double cursorWidth = 2.0;
  final Radius cursorRadius;
  final Color cursorColor;
  final Brightness keyboardAppearance;
  final EdgeInsets scrollPadding = const EdgeInsets.all(20.0);
  final bool enableInteractiveSelection = true;
  final InputCounterWidgetBuilder buildCounter;

  final bool cardEffect;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    ThemeData data = Theme.of(context);
    return cardEffect
        ? Card(
            elevation: elevation,
            child: buildTheme(data),
          )
        : buildTheme(data);
  }

  Theme buildTheme(ThemeData data) {
    return Theme(
      data: data.copyWith(
        primaryColor: formFieldColor == FormFieldColor.primary
            ? data.primaryColor
            : data.accentColor,
      ),
      child: TextFormField(
        key: key,
        controller: controller,
        focusNode: focusNode,
        decoration: getDecoration(variant, decoration),
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        style: style,
        validator: validator,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        textCapitalization: textCapitalization,
        autofocus: autofocus,
        readOnly: readOnly,
        showCursor: showCursor,
        obscureText: obscureText,
        autocorrect: autocorrect,
        maxLengthEnforced: maxLengthEnforced,
        maxLines: maxLines,
        minLines: minLines,
        expands: expands,
        maxLength: maxLength,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        onFieldSubmitted: onFieldSubmitted,
        inputFormatters: inputFormatters,
        enabled: enabled,
        cursorWidth: cursorWidth,
        cursorRadius: cursorRadius,
        cursorColor: cursorColor,
        scrollPadding: scrollPadding,
        keyboardAppearance: keyboardAppearance,
        enableInteractiveSelection: enableInteractiveSelection,
        buildCounter: buildCounter,
      ),
    );
  }
}
