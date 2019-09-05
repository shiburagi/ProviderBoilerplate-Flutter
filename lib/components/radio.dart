import 'package:flutter/material.dart';
import 'package:provider_boilerplate/components/form_field.dart';

class DecorRadioGroup<T> extends FormField<T> {
  DecorRadioGroup({
    @required this.items,
    this.vertical = false,
    this.onChanged,
    this.value,
    this.formFieldColor,
    this.itemCount,
    this.itemBuilder,
    this.onSaved,
    double gap,
    EdgeInsets padding,
    this.validator,
    this.hint,
    this.cardEffect = false,
    this.elevation = 1.0,
    this.decoration = const BoxDecoration(),
    Key key,
  })  : this.gap = gap ?? (vertical ? 0.0 : 16.0),
        this.padding = padding ??
            (cardEffect
                ? EdgeInsets.symmetric(vertical: 8, horizontal: 16)
                : EdgeInsets.all(0)),
        super(
            key: key,
            validator: validator,
            builder: (FormFieldState<T> field) {
              double _gap = gap ?? (vertical ? 0.0 : 16.0);
              int i = 0;
              List<Widget> children = items
                  .map((RadioItem item) => InkWell(
                        onTap: () {
                          field.didChange(item.value);
                        },
                        child: Container(
                          margin: i++ == items.length - 1
                              ? null
                              : vertical
                                  ? EdgeInsets.fromLTRB(0, 0, 0, _gap)
                                  : EdgeInsets.fromLTRB(0, 0, _gap, 0),
                          child: Row(
                            children: <Widget>[
                              Radio<T>(
                                activeColor:
                                    formFieldColor == FormFieldColor.primary
                                        ? Theme.of(field.context).primaryColor
                                        : Theme.of(field.context).accentColor,
                                groupValue: field.value,
                                value: item.value,
                                onChanged: field.didChange,
                              ),
                              item.child
                            ],
                          ),
                        ),
                      ))
                  .toList();
              Widget child = Container(
                padding: padding,
                child: vertical
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: children,
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: children,
                      ),
              );
              return InputDecorator(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      color: Colors.transparent,
                    ),
                  ),
                ),
                child: cardEffect
                    ? Card(
                        child: child,
                      )
                    : child,
              );
            });

  final EdgeInsets padding;
  final bool vertical;
  final T value;
  final double gap;
  final List<RadioItem<T>> items;
  final ValueChanged<T> onChanged;
  final BoxDecoration decoration;
  final FormFieldSetter<T> onSaved;
  final FormFieldValidator<T> validator;
  final FormFieldColor formFieldColor;

  final Widget hint;
  final bool cardEffect;
  final double elevation;
  final DropdownMenuItem<T> Function(int) itemBuilder;
  final int itemCount;

  @override
  _RadioFormFieldState<T> createState() {
    return _RadioFormFieldState<T>();
  }
}

class _RadioFormFieldState<T> extends FormFieldState<T> {
  @override
  DecorRadioGroup<T> get widget => super.widget;

  @override
  void didChange(T value) {
    super.didChange(value);
    if (widget.onChanged != null) widget.onChanged(value);
  }
}

class RadioItem<T> {
  RadioItem({
    this.child,
    this.value,
    this.key,
  })  : assert(child != null),
        super();
  final Widget child;
  final T value;
  final Key key;
}
