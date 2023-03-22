import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:poc/person_store.dart';

class PersonList extends StatelessWidget {
  final PersonStore store;

  const PersonList({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final persons = store.persons;
        return ListView.builder(
          itemCount: persons.length,
          itemBuilder: (context, index) {
            final person = persons[index];
            return ListTile(
              title: Text(person.name),
              subtitle: Text(person.age.toString()),
            );
          },
        );
      },
    );
  }
}
