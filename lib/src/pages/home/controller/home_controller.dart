import 'package:dindin/src/pages/home/view/widgets/button_action_widget.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late Rx<ButtonActionType> _buttonActionType;

  ButtonActionType get buttonActionType => _buttonActionType.value;

  @override
  void onInit() {
    super.onInit();

    _initHome(buttonActionType: ButtonActionType.balance);
  }

  void _initHome({
    required ButtonActionType buttonActionType,
  }) {
    _buttonActionType = buttonActionType.obs;
  }

  void changeButtonAction(ButtonActionType newButtonActionType) {
    _buttonActionType.value = newButtonActionType;
    update();
  }
}
