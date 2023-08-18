import 'package:flutter/material.dart';

class HomeComponent extends StatefulWidget {
  const HomeComponent({super.key});

  @override
  State<HomeComponent> createState() => _HomeComponentState();
}

class _HomeComponentState extends State<HomeComponent> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    int currentIndex = 0;
    final pageController = PageController();

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: colorScheme.background,
        selectedItemColor: colorScheme.onBackground,
        unselectedItemColor: colorScheme.onBackground.withAlpha(100),
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == 2) return;
          setState(() {
            currentIndex = index;
            pageController.animateToPage(index,
                duration: const Duration(milliseconds: 700),
                curve: Curves.fastEaseInToSlowEaseOut);
          });
        },
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
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [],
      ),
    );
  }
}
