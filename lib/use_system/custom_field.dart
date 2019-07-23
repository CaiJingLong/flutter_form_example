import 'package:flutter/material.dart';

class CheckboxFormField extends FormField<bool> {
  CheckboxFormField({
    bool initValue = true,
  }) : super(
          builder: CheckboxFormField.buildWidget,
          initialValue: initValue,
        );

  static Widget buildWidget(FormFieldState<bool> field) {
    return Checkbox(
      onChanged: (bool value) {
        field.didChange(value);
      },
      value: field.value,
    );
  }
}

class SliderFormField extends FormField<double> {
  SliderFormField()
      : super(
          builder: SliderFormField.buildWidget,
          initialValue: 50,
        );

  static Widget buildWidget(FormFieldState<double> field) {
    return Slider(
      onChanged: (double value) {
        field.didChange(value);
      },
      value: field.value,
      min: 0,
      max: 100,
      divisions: 100,
    );
  }
}
