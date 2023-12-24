import 'package:flutter/material.dart';

class HomeController {
  final walletSelectedState = ValueNotifier<String>("Principal");

  void changeWallet(String newWallet) {
    walletSelectedState.value = newWallet;
  }
}
