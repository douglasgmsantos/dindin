import 'package:dindin/src/pages/base/view/base_page.dart';
import 'package:dindin/src/routes/model/page_router_model.dart';

class BaseRouter {
  static PageRouterModel pageRouter = PageRouterModel(
    id: "base",
    route: "/base",
    widget: const BasePage(),
  );
}
