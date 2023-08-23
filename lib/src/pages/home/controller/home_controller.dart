import 'package:get/get.dart';

class HomeController extends GetxController {
  late Rx<String> _walletSelected;

  String get walletSelected => _walletSelected.value;

  @override
  void onInit() {
    super.onInit();

    _initHome(walletSelected: "Principal");
  }

  void _initHome({
    required String walletSelected,
  }) {
    _walletSelected = walletSelected.obs;
  }

  void changeWallet(String newWallet) {
    _walletSelected.value = newWallet;
    update();
  }
}
