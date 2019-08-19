import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FillButton extends RaisedButton {

  /// Create a filled button.
  ///
  /// The [elevation], [highlightElevation], [disabledElevation], and
  /// [clipBehavior] arguments must not be null. Additionally,  [elevation],
  /// [highlightElevation], and [disabledElevation] must be non-negative.
  const FillButton({
    this.fullWidth = false,
    this.borderSide,
    this.type,
    this.variant = ButtonVariant.raised,
    Key key,
    @required VoidCallback onPressed,
    ValueChanged<bool> onHighlightChanged,
    ButtonTextTheme textTheme,
    Color textColor,
    Color disabledTextColor,
    Color color,
    Color disabledColor,
    Color focusColor,
    Color hoverColor,
    Color highlightColor,
    Color splashColor,
    Brightness colorBrightness,
    double elevation,
    double focusElevation,
    double hoverElevation,
    double highlightElevation,
    double disabledElevation,
    EdgeInsetsGeometry padding,
    ShapeBorder shape,
    Clip clipBehavior,
    FocusNode focusNode,
    MaterialTapTargetSize materialTapTargetSize,
    Duration animationDuration,
    Widget child,
  })  : assert(elevation == null || elevation >= 0.0),
        assert(focusElevation == null || focusElevation >= 0.0),
        assert(hoverElevation == null || hoverElevation >= 0.0),
        assert(highlightElevation == null || highlightElevation >= 0.0),
        assert(disabledElevation == null || disabledElevation >= 0.0),
        super(
          key: key,
          onPressed: onPressed,
          onHighlightChanged: onHighlightChanged,
          textTheme: textTheme,
          textColor: textColor,
          disabledTextColor: disabledTextColor,
          color: color,
          disabledColor: disabledColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          colorBrightness: colorBrightness,
          elevation: elevation,
          focusElevation: focusElevation,
          hoverElevation: hoverElevation,
          highlightElevation: highlightElevation,
          disabledElevation: disabledElevation,
          padding: padding,
          shape: shape,
          clipBehavior: clipBehavior,
          focusNode: focusNode,
          materialTapTargetSize: materialTapTargetSize,
          animationDuration: animationDuration,
          child: child,
        );
  final ButtonType type;
  final ButtonVariant variant;
  final bool fullWidth;
  final BorderSide borderSide;

  @override
  Widget build(BuildContext context) {
    switch (variant) {
      case ButtonVariant.outlined:
        return buildOutlineButton(context);
      case ButtonVariant.flat:
        return buildFlatButton(context);
      default:
        return buildRawMaterialButton(context);
    }
  }

  Widget buildFlatButton(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final ButtonThemeData buttonTheme = ButtonTheme.of(context).copyWith(
        minWidth: this.fullWidth ? double.maxFinite : null,
        buttonColor: Colors.transparent);
    return RawMaterialButton(
      onPressed: onPressed,
      onHighlightChanged: onHighlightChanged,
      fillColor: getFillColor(this, buttonTheme),
      textStyle:
          theme.textTheme.button.copyWith(color: buttonColors(context, type)),
      focusColor: buttonTheme.getFocusColor(this),
      hoverColor: buttonTheme.getHoverColor(this),
      highlightColor: buttonTheme.getHighlightColor(this),
      splashColor: buttonTheme.getSplashColor(this),
      elevation: buttonTheme.getElevation(this),
      focusElevation: buttonTheme.getFocusElevation(this),
      hoverElevation: buttonTheme.getHoverElevation(this),
      highlightElevation: buttonTheme.getHighlightElevation(this),
      disabledElevation: buttonTheme.getDisabledElevation(this),
      padding: buttonTheme.getPadding(this),
      constraints: buttonTheme.getConstraints(this),
      shape: buttonTheme.getShape(this),
      clipBehavior: clipBehavior ?? Clip.none,
      focusNode: focusNode,
      materialTapTargetSize: buttonTheme.getMaterialTapTargetSize(this),
      animationDuration: buttonTheme.getAnimationDuration(this),
      child: child,
    );
  }

  RawMaterialButton buildRawMaterialButton(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ButtonThemeData buttonTheme = ButtonTheme.of(context).copyWith(
      buttonColor: buttonColors(context, type),
      colorScheme: ButtonTheme.of(context)
          .colorScheme
          .copyWith(brightness: buttonTextColor(type)),
      minWidth: this.fullWidth ? double.maxFinite : null,
    );
    return RawMaterialButton(
      onPressed: onPressed,
      onHighlightChanged: onHighlightChanged,
      clipBehavior: clipBehavior ?? Clip.none,
      fillColor: getFillColor(this, buttonTheme),
      textStyle: theme.textTheme.button
          .copyWith(color: buttonTheme.getTextColor(this)),
      focusColor: buttonTheme.getFocusColor(this),
      hoverColor: buttonTheme.getHoverColor(this),
      highlightColor: buttonTheme.getHighlightColor(this),
      splashColor: buttonTheme.getSplashColor(this),
      elevation: buttonTheme.getElevation(this),
      focusElevation: buttonTheme.getFocusElevation(this),
      hoverElevation: buttonTheme.getHoverElevation(this),
      highlightElevation: buttonTheme.getHighlightElevation(this),
      disabledElevation: buttonTheme.getDisabledElevation(this),
      padding: buttonTheme.getPadding(this),
      constraints: buttonTheme.getConstraints(this),
      shape: variant == ButtonVariant.raised
          ? buttonTheme.getShape(this)
          : createShape(context),
      focusNode: focusNode,
      animationDuration: buttonTheme.getAnimationDuration(this),
      materialTapTargetSize: buttonTheme.getMaterialTapTargetSize(this),
      child: child,
    );
  }

  Widget buildOutlineButton(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ButtonThemeData buttonTheme = ButtonTheme.of(context).copyWith(
      minWidth: this.fullWidth ? double.maxFinite : null,
    );

    Color color = buttonColors(context, type);
    return ButtonTheme.fromButtonThemeData(
      data: buttonTheme,
      child: OutlineButton(
        onPressed: onPressed,
        borderSide: color == null ? borderSide : BorderSide(color: color),
        textColor: buttonColors(context, type),
        clipBehavior: clipBehavior ?? Clip.none,
        focusColor: buttonTheme.getFocusColor(this),
        hoverColor: buttonTheme.getHoverColor(this),
        highlightColor: buttonTheme.getHighlightColor(this),
        splashColor: buttonTheme.getSplashColor(this),
        highlightElevation: buttonTheme.getHighlightElevation(this),
        padding: buttonTheme.getPadding(this),
        shape: variant == ButtonVariant.outlined ? shape : createShape(context),
        focusNode: focusNode,
        child: child,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<double>('elevation', elevation,
        defaultValue: null));
    properties.add(DiagnosticsProperty<double>('focusElevation', focusElevation,
        defaultValue: null));
    properties.add(DiagnosticsProperty<double>('hoverElevation', hoverElevation,
        defaultValue: null));
    properties.add(DiagnosticsProperty<double>(
        'highlightElevation', highlightElevation,
        defaultValue: null));
    properties.add(DiagnosticsProperty<double>(
        'disabledElevation', disabledElevation,
        defaultValue: null));
  }

  Color getFillColor(MaterialButton button, ButtonThemeData buttonTheme) {
    final Color fillColor =
        button.enabled ? button.color : button.disabledColor;
    if (fillColor != null)
      return fillColor;
    else if (variant == ButtonVariant.flat)
      return null;
    else
      return buttonTheme.getFillColor(button);
  }

  ShapeBorder createShape(BuildContext context) {
    switch (this.variant) {
      case ButtonVariant.rectFill:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)),
        );
      case ButtonVariant.outlined:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)),
        );
      default:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10000)),
        );
    }
  }
}

enum ButtonType {
  normal,
  primary,
  accent,
  danger,
  warning,
  success,
}
enum ButtonVariant {
  flat,
  raised,
  circular,
  rectFill,
  outlined,
}

Color buttonColors(BuildContext context, ButtonType type) {
  switch (type) {
    case ButtonType.primary:
      return Theme.of(context).primaryColor;
    case ButtonType.accent:
      return Theme.of(context).accentColor;
    case ButtonType.danger:
      return Theme.of(context).errorColor;
    case ButtonType.warning:
      return Color.fromRGBO(255, 193, 7, 1);
    case ButtonType.success:
      return Colors.green;
    default:
      return null;
  }
}

Brightness buttonTextColor(ButtonType type) {
  switch (type) {
    case ButtonType.primary:
    case ButtonType.accent:
    case ButtonType.danger:
    case ButtonType.success:
      return Brightness.dark;
    case ButtonType.warning:
      return Brightness.light;
    default:
      return null;
  }
}

ButtonTextTheme buttonTextTheme(ButtonType type) {
  switch (type) {
    case ButtonType.primary:
    case ButtonType.accent:
    case ButtonType.danger:
    case ButtonType.success:
      return ButtonTextTheme.primary;
    case ButtonType.warning:
      return ButtonTextTheme.normal;
    default:
      return null;
  }
}
