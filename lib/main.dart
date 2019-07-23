import 'package:flutter/material.dart';
import 'package:flutter_form_example/use_system/form_page.dart';
import 'package:oktoast/oktoast.dart';

import 'page/wrap_form_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FormComponent(),
      // body: SimpleUseAutoComponent(),
      // body: SimpleUseClickComponent(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => WrapFormPage())),
      ),
    );
  }
}
