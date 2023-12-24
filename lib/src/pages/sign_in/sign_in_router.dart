import 'package:dindin/src/pages/sign_in/view/sign_in_page.dart';
import 'package:dindin/src/routes/model/page_router_model.dart';

class SignInRouter {
  static PageRouterModel pageRouter = PageRouterModel(
    route: "/sign-in",
    widget: SignInPage(),
    bindings: [],
  );
}
