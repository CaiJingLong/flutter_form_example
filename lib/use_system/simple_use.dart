import 'package:flutter/material.dart';

class SimpleUseAutoComponent extends StatefulWidget {
  @override
  _SimpleUseAutoComponentState createState() => _SimpleUseAutoComponentState();
}

class _SimpleUseAutoComponentState extends State<SimpleUseAutoComponent> {
  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: () {
        print("form change");
      },
      child: Column(
        children: <Widget>[
          TextFormField(
            initialValue: "你好",
            validator: (value) {
              if (value.isEmpty) return "不能为空";
              return null;
            },
            autovalidate: true,
          ),
        ],
      ),
    );
  }
}

class SimpleUseClickComponent extends StatefulWidget {
  @override
  _SimpleUseClickComponentState createState() =>
      _SimpleUseClickComponentState();
}

class _SimpleUseClickComponentState extends State<SimpleUseClickComponent> {
  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: () {
        print("form change");
      },
      child: Column(
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value.isEmpty) return "不能为空";
              return null;
            },
          ),
          Builder(
            builder: (ctx) => RaisedButton(
              child: Text('check'),
              onPressed: () {
                final formState = Form.of(ctx);
                formState.validate();
                formState.reset();
                formState.save();
              },
            ),
          ),
        ],
      ),
    );
  }
}
