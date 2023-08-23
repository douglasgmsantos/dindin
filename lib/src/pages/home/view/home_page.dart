import 'package:dindin/constants/constants.dart';
import 'package:dindin/src/pages/home/controller/home_controller.dart';
import 'package:dindin/src/pages/home/view/widgets/container_price_with_type_widget.dart';
import 'package:dindin/src/pages/home/view/widgets/list_wallets_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(50),
          child: Ink(
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              Constants.uriLogoElementWithoutBackground,
              width: 35,
              height: 35,
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(Constants.paddingPageDefault),
        child: GetBuilder<HomeController>(
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListWalletsWidget(
                  onChanged: controller.changeButtonAction,
                  typeSelected: controller.buttonActionType,
                ),
                ContainerPriceWithTypeWidget(
                  description: controller.buttonActionType.description,
                  value: 898,
                  buttonActionType: controller.buttonActionType,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
