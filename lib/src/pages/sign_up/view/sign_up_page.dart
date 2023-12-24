import 'package:dindin/constants/constants.dart';
import 'package:dindin/src/core/state_management/dindin_value_listenable_builder.dart';
import 'package:dindin/src/pages/sign_up/components/button_create_user.dart';
import 'package:dindin/src/pages/sign_up/controller/sign_up_controller.dart';
import 'package:dindin/src/pages/sign_up/state/create_user_state.dart';
import 'package:dindin/src/routes/routes.dart';
import 'package:dindin/src/shared/components/text_form_field_custom.dart';
import 'package:dindin/src/shared/mixins/validation_mixins.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget with ValidationMixin {
  SignUpPage({super.key});

  final controller = SignUpController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  onCreateUser() {
    if (_formKey.currentState!.validate()) {
      controller.createUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Cadastro de usuário"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Constants.paddingPageDefault),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 50),
                child: Image.asset(
                  Constants.uriLogoElementWithoutBackground,
                  height: 100,
                  width: 100,
                ),
              ),
              Column(
                children: [
                  TextFormFieldCustom(
                    label: "Informe seu nome",
                    controller: controller.nameState.value,
                    validator: (val) => combine(
                      [
                        () => isNotEmpty(val, "Este campo é obrigatório"),
                      ],
                    ),
                  ),
                  TextFormFieldCustom(
                    label: "Informe seu e-mail",
                    controller: controller.emailState.value,
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) => combine(
                      [
                        () => isNotEmpty(val, "Este campo é obrigatório"),
                        () => isEmailValid(val),
                      ],
                    ),
                  ),
                  TextFormFieldCustom(
                    label: "Informe sua senha",
                    controller: controller.passwordState.value,
                    isPassword: true,
                    validator: (val) => combine(
                      [
                        () => isNotEmpty(val, "Este campo é obrigatório"),
                      ],
                    ),
                    margin: null,
                  ),

                  //Salvar usuário
                  DindinValueListenableBuilder<CreateUserSuccessState,
                      CreateUserErrorState>(
                    valueListenable: controller.createUserState,
                    onInit: (context, value, child) {
                      return ButtonCreateUser(onPressed: onCreateUser);
                    },
                    onLoading: (context, value, child) {
                      return const ButtonCreateUser(
                        onPressed: null,
                        isLoading: true,
                      );
                    },
                    onSuccess: (context, value, child) {
                      Navigator.of(context).pushNamed(
                        AppPages.signInRouter.route,
                      );
                      return ButtonCreateUser(
                        onPressed: () {},
                        isLoading: true,
                      );
                    },
                    onError: (context, value, child) {
                      return Column(
                        children: [
                          ButtonCreateUser(onPressed: onCreateUser),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              value.message,
                              style: TextStyle(
                                color: Colors.red[200],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
