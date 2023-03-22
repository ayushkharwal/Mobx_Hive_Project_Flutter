import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'person.dart';
import 'package:hive/hive.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

part 'person_store.g.dart';

class PersonStore = _PersonStore with _$PersonStore;

abstract class _PersonStore with Store {
  @observable
  ObservableList<Person> persons = ObservableList<Person>();

  @action
  Future<void> addPerson(Person person) async {
    final box = Hive.box<Person>('persons');
    await box.add(person);
    persons.add(person);
  }

  @action
  Future<void> getPersons() async {
    final box = Hive.box<Person>('persons');
    persons = ObservableList<Person>.of(box.values.toList());
  }
}
