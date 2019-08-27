import 'package:flutter/material.dart';

getDecoration(FormFieldVariant borderType, InputDecoration decoration) {
  InputBorder border;
  switch (borderType) {
    case FormFieldVariant.outlined:
      border = OutlineInputBorder();
      break;
    case FormFieldVariant.rectOutlined:
      border = OutlineInputBorder(borderRadius: BorderRadius.circular(0));
      break;
    case FormFieldVariant.filled:
      decoration = decoration.copyWith(
        contentPadding: EdgeInsets.fromLTRB(12, 16, 12, 16),
        filled: true,
      );
      break;
    case FormFieldVariant.blurred:
      border = UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent));

      decoration = decoration.copyWith(
        filled: true,
        enabledBorder: border,
        focusedBorder: border,
        focusedErrorBorder: border,
      );
      break;
    case FormFieldVariant.blurred_circular:
      border = UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10000));

      decoration = decoration.copyWith(
        filled: true,
        enabledBorder: border,
        focusedBorder: border,
        focusedErrorBorder: border,
      );
      break;
    case FormFieldVariant.transparent:
      border = UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent));

      decoration = decoration.copyWith(
        filled: true,
        fillColor: Colors.transparent,
        enabledBorder: border,
        focusedBorder: border,
        focusedErrorBorder: border,
      );
      break;
    default:
      return decoration;
  }
  return decoration.copyWith(
    border: border,
  );
}

enum FormFieldVariant {
  normal,
  outlined,
  filled,
  blurred,
  rectOutlined,
  transparent,
  blurred_circular,
}

enum FormFieldColor {
  primary,
  accent,
}
