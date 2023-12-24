import 'package:dindin/src/pages/base/base_route.dart';
import 'package:dindin/src/pages/sign_in/sign_in_router.dart';
import 'package:dindin/src/pages/sign_up/sign_up_router.dart';
import 'package:dindin/src/pages/splash/splash_route.dart';
import 'package:flutter/material.dart';

import 'model/page_router_model.dart';

abstract class AppPages {
  static PageRouterModel splashRouter = SplashRouter.pageRouter;
  static PageRouterModel baseRouter = BaseRouter.pageRouter;
  static PageRouterModel signInRouter = SignInRouter.pageRouter;
  static PageRouterModel signUpRouter = SignUpRouter.pageRouter;

  static final pages = {
    splashRouter.id: splashRouter,
    baseRouter.id: baseRouter,
    signInRouter.id: signInRouter,
    signUpRouter.id: signUpRouter,
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    PageRouterModel? page = pages[settings.name] ?? signInRouter;
    return MaterialPageRoute(builder: (_) => page.widget);
  }
}
