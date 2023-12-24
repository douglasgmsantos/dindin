import 'dart:async';

import 'package:get_it/get_it.dart';

class DindinInjector {
  static DindinInjector? _instance;

  DindinInjector._();

  static DindinInjector get instance {
    _instance ??= DindinInjector._();
    return _instance!;
  }

  static DindinInjector get I {
    _instance ??= DindinInjector._();
    return _instance!;
  }

  bool allowReassignment = false;

  void Function(bool pushed)? onScopeChanged;

  Future<void> allReady(
      {Duration? timeout, bool ignorePendingAsyncCreation = false}) async {
    await GetIt.instance.allReady(
        timeout: timeout,
        ignorePendingAsyncCreation: ignorePendingAsyncCreation);
  }

  bool allReadySync([bool ignorePendingAsyncCreation = false]) {
    return GetIt.instance.allReadySync(ignorePendingAsyncCreation);
  }

  T call<T extends Object>({String? instanceName, param1, param2, Type? type}) {
    return GetIt.instance.call<T>(
        instanceName: instanceName, param1: param1, param2: param2, type: type);
  }

  String? get currentScopeName => GetIt.instance.currentScopeName;

  Future<void> dropScope(String scopeName) {
    return GetIt.instance.dropScope(scopeName);
  }

  T retrive<T extends Object>() {
    return GetIt.instance.get<T>();
  }

  T get<T extends Object>({String? instanceName, param1, param2, Type? type}) {
    return GetIt.instance.get<T>(
        instanceName: instanceName, param1: param1, param2: param2, type: type);
  }

  Future<T> getAsync<T extends Object>(
      {String? instanceName, param1, param2, Type? type}) {
    return GetIt.instance.getAsync<T>(
        instanceName: instanceName, param1: param1, param2: param2, type: type);
  }

  Future<void> isReady<T extends Object>(
      {Object? instance,
      String? instanceName,
      Duration? timeout,
      Object? callee}) {
    return GetIt.instance.isReady<T>(
        instance: instance,
        instanceName: instanceName,
        timeout: timeout,
        callee: callee);
  }

  bool isReadySync<T extends Object>({Object? instance, String? instanceName}) {
    return GetIt.instance
        .isReadySync<T>(instance: instance, instanceName: instanceName);
  }

  bool isRegistered<T extends Object>(
      {Object? instance, String? instanceName}) {
    return GetIt.instance
        .isRegistered<T>(instance: instance, instanceName: instanceName);
  }

  Future<void> popScope() {
    return GetIt.instance.popScope();
  }

  Future<bool> popScopesTill(String name, {bool inclusive = true}) {
    return GetIt.instance.popScopesTill(name, inclusive: inclusive);
  }

  void pushNewScope(
      {void Function(GetIt getIt)? init,
      String? scopeName,
      ScopeDisposeFunc? dispose}) {
    return GetIt.instance
        .pushNewScope(init: init, scopeName: scopeName, dispose: dispose);
  }

  Future<void> pushNewScopeAsync(
      {Future<void> Function(GetIt getIt)? init,
      String? scopeName,
      ScopeDisposeFunc? dispose}) {
    return GetIt.instance
        .pushNewScopeAsync(init: init, scopeName: scopeName, dispose: dispose);
  }

  void registerFactory<T extends Object>(FactoryFunc<T> factoryFunc,
      {String? instanceName}) {
    return GetIt.instance
        .registerFactory<T>(factoryFunc, instanceName: instanceName);
  }

  void registerFactoryAsync<T extends Object>(FactoryFuncAsync<T> factoryFunc,
      {String? instanceName}) {
    return GetIt.instance
        .registerFactoryAsync<T>(factoryFunc, instanceName: instanceName);
  }

  void registerFactoryParam<T extends Object, P1, P2>(
      FactoryFuncParam<T, P1, P2> factoryFunc,
      {String? instanceName}) {
    return GetIt.instance.registerFactoryParam<T, P1, P2>(factoryFunc,
        instanceName: instanceName);
  }

  void registerFactoryParamAsync<T extends Object, P1, P2>(
      FactoryFuncParamAsync<T, P1?, P2?> factoryFunc,
      {String? instanceName}) {
    return GetIt.instance.registerFactoryParamAsync<T, P1, P2>(factoryFunc,
        instanceName: instanceName);
  }

  void registerLazySingleton<T extends Object>(FactoryFunc<T> factoryFunc,
      {String? instanceName, DisposingFunc<T>? dispose}) {
    return GetIt.instance.registerLazySingleton<T>(factoryFunc,
        instanceName: instanceName, dispose: dispose);
  }

  void registerLazySingletonAsync<T extends Object>(
      FactoryFuncAsync<T> factoryFunc,
      {String? instanceName,
      DisposingFunc<T>? dispose}) {
    return GetIt.instance.registerLazySingletonAsync<T>(factoryFunc,
        instanceName: instanceName, dispose: dispose);
  }

  T registerSingleton<T extends Object>(T instance,
      {String? instanceName, bool? signalsReady, DisposingFunc<T>? dispose}) {
    return GetIt.instance.registerSingleton<T>(instance,
        instanceName: instanceName,
        signalsReady: signalsReady,
        dispose: dispose);
  }

  void registerSingletonAsync<T extends Object>(FactoryFuncAsync<T> factoryFunc,
      {String? instanceName,
      Iterable<Type>? dependsOn,
      bool? signalsReady,
      DisposingFunc<T>? dispose}) {
    return GetIt.instance.registerSingletonAsync<T>(factoryFunc,
        instanceName: instanceName,
        dependsOn: dependsOn,
        signalsReady: signalsReady,
        dispose: dispose);
  }

  void registerSingletonWithDependencies<T extends Object>(
      FactoryFunc<T> factoryFunc,
      {String? instanceName,
      Iterable<Type>? dependsOn,
      bool? signalsReady,
      DisposingFunc<T>? dispose}) {
    return GetIt.instance.registerSingletonWithDependencies<T>(factoryFunc,
        instanceName: instanceName,
        dependsOn: dependsOn,
        signalsReady: signalsReady,
        dispose: dispose);
  }

  Future<void> reset({bool dispose = true}) {
    return GetIt.instance.reset(dispose: dispose);
  }

  FutureOr resetLazySingleton<T extends Object>(
      {T? instance,
      String? instanceName,
      FutureOr Function(T p1)? disposingFunction}) {
    return GetIt.instance.resetLazySingleton<T>(
        instance: instance,
        instanceName: instanceName,
        disposingFunction: disposingFunction);
  }

  Future<void> resetScope({bool dispose = true}) {
    return GetIt.instance.resetScope(dispose: dispose);
  }

  void signalReady(Object? instance) {
    return GetIt.instance.signalReady(instance);
  }

  FutureOr unregister<T extends Object>(
      {Object? instance,
      String? instanceName,
      FutureOr Function(T p1)? disposingFunction}) {
    return GetIt.instance.unregister<T>(
        instance: instance,
        instanceName: instanceName,
        disposingFunction: disposingFunction);
  }
}
