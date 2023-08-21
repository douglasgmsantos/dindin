import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PageRouterModel {
  final String route;
  final Widget widget;
  final List<Bindings>? bindings;

  PageRouterModel({required this.route, required this.widget, this.bindings});

  GetPage getPage() =>
      GetPage(name: route, page: () => widget, bindings: bindings ?? []);
}
