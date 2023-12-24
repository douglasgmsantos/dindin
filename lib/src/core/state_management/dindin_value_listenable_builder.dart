import 'package:dindin/src/core/state_management/state_management.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DindinValueListenableBuilder<SuccessStateType extends DindinSuccessState,
    ErrorStateType extends DindinErrorState> extends StatelessWidget {
  final ValueListenable valueListenable;

  final Widget Function(
      BuildContext context, DindinInitialState value, Widget? child)? onInit;
  final Widget Function(
      BuildContext context, DindinLoadingState value, Widget? child)? onLoading;
  final Widget Function(
      BuildContext context, SuccessStateType value, Widget? child) onSuccess;
  final Widget Function(
      BuildContext context, ErrorStateType value, Widget? child)? onError;

  const DindinValueListenableBuilder({
    super.key,
    required this.valueListenable,
    this.onInit,
    this.onLoading,
    required this.onSuccess,
    this.onError,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueListenable,
      builder: (context, value, _) {
        if (valueListenable.value is DindinInitialState) {
          if (onInit != null) {
            return onInit!(context, valueListenable.value, null);
          } else {
            return defaultOnInit();
          }
        } else if (valueListenable.value is DindinLoadingState) {
          if (onLoading != null) {
            return onLoading!(context, valueListenable.value, null);
          } else {
            return defaultOnLoading();
          }
        } else if (valueListenable.value is DindinSuccessState) {
          return onSuccess(context, valueListenable.value, null);
        } else if (valueListenable.value is DindinErrorState) {
          if (onError != null) {
            return onError!(context, valueListenable.value, null);
          } else {
            return defaultOnError();
          }
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget defaultOnError() {
    return const Text("Ocorreu um erro");
  }

  Widget defaultOnLoading() {
    return const CircularProgressIndicator();
  }

  Widget defaultOnInit() {
    return const SizedBox();
  }
}
