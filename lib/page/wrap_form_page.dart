import 'package:flutter/material.dart';
import 'package:flutter_form_example/wrap_form/form_provider.dart';
import 'package:flutter_form_example/wrap_form/model_slider_form_field.dart';

class WrapFormPage extends StatefulWidget {
  @override
  _WrapFormPageState createState() => _WrapFormPageState();
}

class _WrapFormPageState extends State<WrapFormPage> {
  final key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var student = Student()..age = 1;
    return FormProvider<Student>(
      key: key,
      onChange: (model) {
        print("student = $student");
      },
      model: student,
      child: Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: <Widget>[
            ModelSliderFormField(),
          ],
        ),
        floatingActionButton: Button(),
      ),
    );
  }

  abc(BuildContext ctx) {
    print(ctx);
    print(ctx.inheritFromWidgetOfExactType(FormProvider));
//    final user = FormProvider.of<User>(ctx);
//    print(user);
//    FormProvider provider = key.currentWidget;
//    print(provider.model);
  }
}

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        print(FormProvider.of(context).model);
      },
    );
  }
}

class User {
  User({
    this.username,
    this.password,
  });

  String username;
  String password;

  @override
  String toString() {
    return 'User{username: $username, password: $password}';
  }
}
