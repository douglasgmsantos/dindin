import 'package:dindin/src/routes/model/page_router_model.dart';
import 'package:dindin/src/pages/splash/view/splash_page.dart';

class SplashRouter {
  static PageRouterModel pageRouter = PageRouterModel(
    id: "splash",
    route: "/splash",
    widget: const SplashPage(),
  );
}
