import 'package:dindin/src/pages/base/binding/navigation_binding.dart';
import 'package:dindin/src/pages/base/view/base_page.dart';
import 'package:dindin/src/pages/home/binding/home_binding.dart';
import 'package:dindin/src/routes/model/page_router_model.dart';

class BaseRouter {
  static PageRouterModel pageRouter = PageRouterModel(
    route: "/base",
    widget: const BasePage(),
    bindings: [
      NavigationBinding(),
      HomeBinding(),
    ],
  );
}
