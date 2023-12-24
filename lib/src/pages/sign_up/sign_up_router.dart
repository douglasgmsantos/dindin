import 'package:dindin/src/pages/sign_up/view/sign_up_page.dart';
import 'package:dindin/src/routes/model/page_router_model.dart';

class SignUpRouter {
  static PageRouterModel pageRouter = PageRouterModel(
    id: "sign-up",
    route: "/sign-up",
    widget: SignUpPage(),
  );
}
