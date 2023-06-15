// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  late final _$modelAtom =
      Atom(name: '_HomeViewModelBase.model', context: context);

  @override
  ForecastModel? get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(ForecastModel? value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$predictionsAsyncAction =
      AsyncAction('_HomeViewModelBase.predictions', context: context);

  @override
  Future<ForecastModel?> predictions() {
    return _$predictionsAsyncAction.run(() => super.predictions());
  }

  @override
  String toString() {
    return '''
model: ${model}
    ''';
  }
}
