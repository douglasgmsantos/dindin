import 'package:dindin/constants/constants.dart';
import 'package:dindin/src/core/dependency_injection/dependency_injection.dart';
import 'package:dindin/src/core/state_management/dindin_value_listenable_builder.dart';
import 'package:dindin/src/pages/home/controller/home_controller.dart';
import 'package:dindin/src/pages/home/states/wallets_state.dart';
import 'package:dindin/src/pages/home/view/widgets/container_price_with_type_widget.dart';
import 'package:dindin/src/pages/home/view/widgets/list_transaction_by_category_widget.dart';
import 'package:dindin/src/pages/home/view/widgets/list_transactions_recents_widgets.dart';
import 'package:dindin/src/pages/home/view/widgets/list_wallets_widget.dart';
import 'package:dindin/src/shared/transaction/states/transactions_state.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //DEP
  final homeController = DindinInjector.I.get<HomeController>();

  @override
  void initState() {
    homeController.init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 56 + Constants.paddingPageDefault,
        title: Text(
          style: const TextStyle(fontSize: 16),
          "Bem vindo(a), ${homeController.userController.getUser()!.name}",
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: Constants.paddingPageDefault),
          child: Row(
            children: [
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(50),
                child: Ink(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    Constants.uriLogoElementWithoutBackground,
                    height: 35,
                    width: 35,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await homeController.init();
        },
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(Constants.paddingPageDefault),
              sliver: SliverCrossAxisGroup(
                slivers: [
                  SliverMainAxisGroup(
                    slivers: [
                      SliverToBoxAdapter(
                        child: DindinValueListenableBuilder<WalletsSuccessState,
                            WalletsErrorState>(
                          valueListenable: homeController.walletsState,
                          onLoading: (context, value, child) {
                            return Center(
                              child: SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(
                                  color: colorScheme.primary,
                                ),
                              ),
                            );
                          },
                          onSuccess: (context, walletsValue, child) {
                            return ValueListenableBuilder(
                              valueListenable:
                                  homeController.walletSelectedState,
                              builder: (context, walletSelectedValue, child) {
                                return Column(
                                  children: [
                                    ListWalletsWidget(
                                      onChanged: homeController.changeWallet,
                                      wallets: walletsValue.wallets,
                                      walletSelected: walletSelectedValue!,
                                    ),
                                    ContainerPriceWithTypeWidget(
                                      walletSelected: walletSelectedValue,
                                    ),
                                    DindinValueListenableBuilder<
                                        TransactionSuccessState,
                                        TransactionErrorState>(
                                      valueListenable:
                                          homeController.transactionsState,
                                      onLoading: (context, value, child) {
                                        return Container(
                                          margin: const EdgeInsets.symmetric(
                                            vertical:
                                                Constants.paddingPageDefault,
                                          ),
                                          width: 30,
                                          height: 30,
                                          child: CircularProgressIndicator(
                                            color: colorScheme.primary,
                                          ),
                                        );
                                      },
                                      onSuccess:
                                          (context, transactionsValue, child) {
                                        if (transactionsValue
                                            .transactions.isEmpty) {
                                          return const Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical:
                                                  Constants.paddingPageDefault,
                                            ),
                                            child: Text(
                                              "Não há movimentações cadastradas",
                                            ),
                                          );
                                        }

                                        return ListTransactionByCategory(
                                          transactions:
                                              transactionsValue.transactions,
                                        );
                                      },
                                    )
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                      DindinValueListenableBuilder<TransactionSuccessState,
                          TransactionErrorState>(
                        valueListenable: homeController.transactionsState,
                        onLoading: (context, value, child) {
                          return const SliverToBoxAdapter();
                        },
                        onSuccess: (context, transactionsValue, child) {
                          if (transactionsValue.transactions.isEmpty) {
                            return const SliverToBoxAdapter();
                          }

                          return ListTransactionsRecents(
                            transactions: transactionsValue.transactions,
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
