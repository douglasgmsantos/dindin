import 'package:flutter/widgets.dart';

class PageRouterModel {
  final String id;
  final String route;
  final Widget widget;

  PageRouterModel({
    required this.id,
    required this.route,
    required this.widget,
  });
}
