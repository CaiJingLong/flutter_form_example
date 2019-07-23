import 'package:flutter/material.dart';

typedef void ValueChange<M>(M model);

/// 封装以关联 Model 和 FormField, 建议配合IDE的代码模板使用
class FormProvider<M> extends StatefulWidget {
  final M model;
  final Widget child;
  final ValueChange<M> onChange;
  final ValueChange<M> onSave;

  final bool autovalidate;

  const FormProvider({
    Key key,
    @required this.model,
    @required this.child,
    this.onChange,
    this.onSave,
    this.autovalidate = false,
  }) : super(key: key);

  @override
  _FormProviderState<M> createState() => _FormProviderState();

  static FormProvider<M> of<M>(BuildContext context) {
    _FormProviderScope scope =
        context.inheritFromWidgetOfExactType(_FormProviderScope);
    return scope?.state?.widget;
  }

  static _FormProviderState ofState(BuildContext context) {
    _FormProviderScope scope =
        context.inheritFromWidgetOfExactType(_FormProviderScope);
    return scope?.state;
  }
}

class _FormProviderState<M> extends State<FormProvider<M>> {
  @override
  Widget build(BuildContext context) {
    return _FormProviderScope(
      child: Form(
        child: widget.child,
        onChanged: onChanged,
        autovalidate: widget.autovalidate,
      ),
      state: this,
    );
  }

  void onChanged() {
    if (widget.onChange != null) {
      print("on changed");
      widget.onChange(widget.model);
    }
//    print("widget.onChange = ${widget.onChange}");
//    widget.onChange?.call(widget.model);
  }

  void onSaved() {
    widget.onSave?.call(widget.model);
  }
}

abstract class ModelFormField<T, Model> extends FormField<T> {
  final FormFieldBuilder<T> builder;

  ModelFormField({
    @required FormFieldBuilder<T> builder,
    @required T initialValue,
  })  : this.builder = builder,
        super(
          builder: builder,
          initialValue: initialValue,
        );

  @override
  ModelFormFieldState<T, Model> createState();
}

abstract class ModelFormFieldState<T, Model> extends FormFieldState<T> {
  @override
  void didChange(value) {
    var state = FormProvider.ofState(context);
    onChange(state.widget.model, this.value);
    state.onChanged();
    super.didChange(value);
  }

  void onChange(Model model, T value);

  @override
  void save() {
    super.save();
    var state = FormProvider.ofState(context);
    state.onSaved();
  }
}

class _FormProviderScope extends InheritedWidget {
  final Widget child;

  final _FormProviderState state;

  _FormProviderScope({Key key, this.child, this.state})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(_FormProviderScope _old) => state != _old.state;
}
