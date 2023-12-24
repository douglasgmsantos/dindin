import 'package:dindin/constants/constants.dart';
import 'package:dindin/src/core/dependency_injection/dependency_injection.dart';
import 'package:dindin/src/pages/home/controller/home_controller.dart';
import 'package:dindin/src/pages/home/view/widgets/container_price_with_type_widget.dart';
import 'package:dindin/src/pages/home/view/widgets/list_transaction_by_category_widget.dart';
import 'package:dindin/src/pages/home/view/widgets/list_transactions_recents_widgets.dart';
import 'package:dindin/src/pages/home/view/widgets/list_wallets_widget.dart';
import 'package:dindin/src/shared/controller/user_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController homeController = HomeController();

  final userController = DindinInjector.I.get<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.only(left: 16),
          child: Row(
            children: [
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(50),
                child: Ink(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    Constants.uriLogoElementWithoutBackground,
                  ),
                ),
              ),
              Text(userController.getUser()!.name)
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(Constants.paddingPageDefault),
            sliver: SliverCrossAxisGroup(
              slivers: [
                SliverMainAxisGroup(
                  slivers: [
                    SliverToBoxAdapter(
                      child: ValueListenableBuilder(
                        valueListenable: homeController.walletSelectedState,
                        builder: (context, value, child) {
                          return Column(
                            children: [
                              ListWalletsWidget(
                                onChanged: homeController.changeWallet,
                                typeSelected:
                                    homeController.walletSelectedState.value,
                              ),
                              ContainerPriceWithTypeWidget(
                                description:
                                    homeController.walletSelectedState.value,
                                value: 898,
                              ),
                              const ListTransactionByCategory(),
                            ],
                          );
                        },
                      ),
                    ),
                    const ListTransactionsRecents()
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
