import 'package:flutter/material.dart';

extension ContextExtentions on BuildContext {
  Color get primaryColor => Theme.of(this).primaryColor;

  Color get scaffoldColor => Theme.of(this).scaffoldBackgroundColor;

  bool get canPop => Navigator.canPop(this);

  void pop({Object? result}) => Navigator.pop(this, result);

  Future pushNamed(String routeName, {Object? arguments}) async {
    return Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  Future pushNamedAndRemoveUntil(
    String routeName,
    RoutePredicate predicate, {
    Object? arguments,
  }) async {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  // context.pushNamedAndRemoveAll(loginRoute);
  // Navigator.of(context).pushNamedAndRemoveAll(loginRoute,(route) => false);
  void pushNamedAndRemoveAll(String routeName, {Object? arguments}) {
    pushNamedAndRemoveUntil(routeName, (route) => false, arguments: arguments);
  }

  // bool get  => Navigator.canPop(this);

  Object? get args => ModalRoute.of(this)!.settings.arguments;

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  double get aspectRatio => MediaQuery.of(this).size.aspectRatio;

  void requestFocus([FocusNode? node]) =>
      FocusScope.of(this).requestFocus(node);
}
