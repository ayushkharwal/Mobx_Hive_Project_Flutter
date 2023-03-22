// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PersonStore on _PersonStore, Store {
  late final _$addPersonAsyncAction =
      AsyncAction('_PersonStore.addPerson', context: context);

  @override
  Future<void> addPerson(Person person) {
    return _$addPersonAsyncAction.run(() => super.addPerson(person));
  }

  late final _$getPersonsAsyncAction =
      AsyncAction('_PersonStore.getPersons', context: context);

  @override
  Future<void> getPersons() {
    return _$getPersonsAsyncAction.run(() => super.getPersons());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
