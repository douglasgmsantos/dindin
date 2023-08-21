import 'package:dindin/src/pages/base/controller/navigation_controller.dart';
import 'package:dindin/src/pages/home/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final navigationController = Get.find<NavigationController>();

    return Scaffold(
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            backgroundColor: colorScheme.surface,
            selectedItemColor: colorScheme.onSurface,
            unselectedItemColor: colorScheme.onSurface.withAlpha(100),
            type: BottomNavigationBarType.fixed,
            currentIndex: navigationController.currentIndex,
            onTap: (index) => navigationController.navigatePageView(index),
            items: [
              const BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(
                    Icons.home,
                  )),
              const BottomNavigationBarItem(
                  label: "Carteira",
                  icon: Icon(
                    Icons.wallet,
                  )),
              BottomNavigationBarItem(
                  label: "",
                  icon: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withAlpha(255),
                      border: Border.all(
                        color: colorScheme.primary.withAlpha(255),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    child: const Icon(
                      color: Colors.black,
                      Icons.add,
                    ),
                  )),
              const BottomNavigationBarItem(
                  label: "Categorias",
                  icon: Icon(
                    Icons.interests,
                  )),
              const BottomNavigationBarItem(
                  label: "Perfil",
                  icon: Icon(
                    Icons.settings,
                  ))
            ],
          )),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: navigationController.pageController,
        children: [
          const HomePage(),
          Container(
            color: Colors.amber,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
