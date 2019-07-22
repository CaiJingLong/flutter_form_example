import 'package:flutter/material.dart';

import 'custom_field.dart';

class FormComponent extends StatefulWidget {
  @override
  _FormComponentState createState() => _FormComponentState();
}

class _FormComponentState extends State<FormComponent> {
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      onChanged: () {
        print("on change");
      },
      child: ListView(
        children: <Widget>[
          CheckboxFormField(),
          SliderFormField(),
          RaisedButton(
            onPressed: () {
              formKey.currentState.reset();
            },
            child: Text("reset"),
          ),
        ],
      ),
    );
  }
}
