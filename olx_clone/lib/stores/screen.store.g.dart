// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ScreenStore on _ScreenStoreBase, Store {
  final _$pageAtom = Atom(name: '_ScreenStoreBase.page');

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$_ScreenStoreBaseActionController =
      ActionController(name: '_ScreenStoreBase');

  @override
  void setScreen(int value) {
    final _$actionInfo = _$_ScreenStoreBaseActionController.startAction(
        name: '_ScreenStoreBase.setScreen');
    try {
      return super.setScreen(value);
    } finally {
      _$_ScreenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
page: ${page}
    ''';
  }
}
