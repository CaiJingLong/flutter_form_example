import 'package:flutter/material.dart';

import 'form_provider.dart';

class ModelSliderFormField extends ModelFormField<int, Student> {
  ModelSliderFormField()
      : super(
          builder: ModelSliderFormField.buildWidget,
          initialValue: 0,
        );

  @override
  ModelFormFieldState<int, Student> createState() {
    return ModelSliderFormFieldState();
  }

  static Widget buildWidget(FormFieldState<int> field) {
    return Slider(
      value: field.value.toDouble(),
      onChanged: (double value) {
        field.didChange(value.toInt());
      },
      min: 0,
      max: 100,
      divisions: 100,
    );
  }
}

class ModelSliderFormFieldState extends ModelFormFieldState<int, Student> {
  @override
  void onChange(Student model, int value) {
    model.age = value;
  }
}

class Student {
  int age;

  @override
  String toString() {
    return 'Student{age: $age}';
  }
}
