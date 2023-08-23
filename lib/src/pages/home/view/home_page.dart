import 'package:dindin/constants/constants.dart';
import 'package:dindin/src/pages/home/controller/home_controller.dart';
import 'package:dindin/src/pages/home/view/widgets/container_price_with_type_widget.dart';
import 'package:dindin/src/pages/home/view/widgets/list_transaction_by_category_widget.dart';
import 'package:dindin/src/pages/home/view/widgets/list_transactions_recents_widgets.dart';
import 'package:dindin/src/pages/home/view/widgets/list_wallets_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.only(left: 16),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(50),
            child: Ink(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                Constants.uriLogoElementWithoutBackground,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          padding: const EdgeInsets.all(Constants.paddingPageDefault),
          child: GetBuilder<HomeController>(
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListWalletsWidget(
                    onChanged: controller.changeWallet,
                    typeSelected: controller.walletSelected,
                  ),
                  ContainerPriceWithTypeWidget(
                    description: controller.walletSelected,
                    value: 898,
                  ),
                  const ListTransactionByCategory(),
                  const Expanded(child: ListTransactionsRecents())
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
