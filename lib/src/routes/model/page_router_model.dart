import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PageRouterModel {
  String route;
  Widget widget;

  PageRouterModel({
    required this.route,
    required this.widget,
  });

  GetPage getPage() => GetPage(name: route, page: () => widget);
}
