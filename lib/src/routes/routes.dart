import 'package:dindin/src/pages/base/base_route.dart';
import 'package:dindin/src/pages/splash/splash_route.dart';
import 'package:get/get.dart';

import 'model/page_router_model.dart';

abstract class AppPages {
  static PageRouterModel splashRouter = SplashRouter.pageRouter;
  static PageRouterModel homeRouter = HomeRouter.pageRouter;

  static final pages = <GetPage>[
    splashRouter.getPage(),
    homeRouter.getPage(),
  ];
}
