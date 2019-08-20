import 'package:flutter/material.dart';
import 'package:provider_boilerplate/components/form_field.dart';

class DecorDropDown<T> extends StatelessWidget {
  DecorDropDown({
    Key key,
    this.value,
    this.items,
    this.itemCount,
    this.itemBuilder,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.hint,
    this.variant,
    this.cardEffect = false,
    this.elevation = 1.0,
    this.decoration = const InputDecoration(),
  }) : super(key: key);
  final T value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T> onChanged;
  final InputDecoration decoration;
  final FormFieldSetter<T> onSaved;
  final FormFieldValidator<T> validator;
  final FormFieldVariant variant;
  final Widget hint;
  final bool cardEffect;
  final double elevation;
  final DropdownMenuItem<T> Function(int) itemBuilder;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: cardEffect ? elevation : 0,
      child: DropdownButtonFormField(
        key: key,
        onSaved: onSaved,
        value: value,
        validator: validator,
        items:
            itemBuilder == null ? items : List.generate(itemCount, itemBuilder),
        decoration: getDecoration(variant, decoration),
        hint: hint,
        onChanged: onChanged,
      ),
    );
  }
}
