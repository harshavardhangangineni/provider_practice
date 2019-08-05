import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/locator.dart';

class BaseView<T extends BaseModel> extends StatelessWidget {
  final Widget Function(BuildContext context, T value, Widget child) builder;

  BaseView({this.builder});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      builder: (context) => locator<T>(),
      child: Consumer<T>(
        builder: builder,
      ),
    );
  }
}

class BaseModel extends ChangeNotifier {}
