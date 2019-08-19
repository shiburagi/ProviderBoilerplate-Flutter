import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DecorTextField extends TextFormField {
  DecorTextField({
    this.variant = TextFieldVariant.normal,
    Key key,
    TextEditingController controller,
    String initialValue,
    FocusNode focusNode,
    this.decoration = const InputDecoration(),
    TextInputType keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction textInputAction,
    TextStyle style,
    StrutStyle strutStyle,
    TextDirection textDirection,
    TextAlign textAlign = TextAlign.start,
    bool autofocus = false,
    bool readOnly = false,
    bool showCursor,
    bool obscureText = false,
    bool autocorrect = true,
    bool autovalidate = false,
    bool maxLengthEnforced = true,
    int maxLines = 1,
    int minLines,
    bool expands = false,
    int maxLength,
    ValueChanged<String> onChanged,
    VoidCallback onEditingComplete,
    ValueChanged<String> onFieldSubmitted,
    FormFieldSetter<String> onSaved,
    FormFieldValidator<String> validator,
    List<TextInputFormatter> inputFormatters,
    bool enabled = true,
    double cursorWidth = 2.0,
    Radius cursorRadius,
    Color cursorColor,
    Brightness keyboardAppearance,
    EdgeInsets scrollPadding = const EdgeInsets.all(20.0),
    bool enableInteractiveSelection = true,
    InputCounterWidgetBuilder buildCounter,
  }) : super(
          key: key,
          controller:controller,
          focusNode: focusNode,
          decoration: getDecoration(variant, decoration),
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          style: style,
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
        );
  final InputDecoration decoration;
  final TextFieldVariant variant;
  @override
  createState() {
    return super.createState();
  }

  static getDecoration(
      TextFieldVariant borderType, InputDecoration decoration) {
    InputBorder border;
    switch (borderType) {
      case TextFieldVariant.outline:
        border = OutlineInputBorder();
        break;
      case TextFieldVariant.filled:
        return decoration.copyWith(
          contentPadding: EdgeInsets.fromLTRB(12, 16, 12, 16),
          filled: true,
        );
      case TextFieldVariant.blurred:
        border = OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent));

        return decoration.copyWith(
          filled: true,
          border: border,
          enabledBorder: border,
          focusedBorder: border,
          focusedErrorBorder: border,
        );
      default:
        return decoration;
    }
    return decoration.copyWith(
      border: border,
    );
  }
}

enum TextFieldVariant {
  normal,
  outline,
  filled,
  blurred,
}
