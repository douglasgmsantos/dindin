import 'package:dindin/src/core/state_management/dindin_value_listenable_builder.dart';
import 'package:dindin/src/pages/sign_in/controller/sign_in_controller.dart';
import 'package:dindin/src/pages/sign_in/state/user_state.dart';
import 'package:dindin/src/routes/routes.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final SignInController controller = SignInController();

  authenticate() {
    controller.authenticate(
      email: "douglas@gmail.com",
      password: "123456",
    );
  }

  onRedirectHome(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.of(context).pushNamed(AppPages.baseRouter.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DindinValueListenableBuilder<UserSuccessState, UserErrorState>(
              valueListenable: controller.userState,
              onInit: (context, value, child) {
                return TextButton(
                  onPressed: authenticate,
                  child: const Text("Logar"),
                );
              },
              onSuccess: (context, profileState, _) {
                onRedirectHome(context);
                return Container();
              },
              onLoading: (context, value, child) {
                return Container(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.sizeOf(context).height * 0.90),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
              onError: (context, value, child) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: authenticate,
                        child: const Text("Logar"),
                      ),
                      Text(value.message),
                    ],
                  ),
                );
              },
            ),
            TextButton(
              child: const Text("Crie seu perfil"),
              onPressed: () {
                Navigator.of(context).pushNamed(AppPages.signUpRouter.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
