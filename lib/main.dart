import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:poc/person.dart';
import 'package:poc/person_form.dart';
import 'package:poc/person_list.dart';
import 'package:poc/person_store.dart';

void main() async {
  // Initializing Hive
  await Hive.initFlutter();

  // Registering Hive model adapter
  Hive.registerAdapter<Person>(PersonAdapter());

  // Opening a box
  await Hive.openBox<Person>('persons');

  final personStore = PersonStore();
  await personStore.getPersons();

  runApp(MyApp(store: personStore));
}

class MyApp extends StatelessWidget {
  final PersonStore store;

  const MyApp({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'POC',
      home: Scaffold(
        // AppBar
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            'MObx Hive POC',
            style: TextStyle(color: Colors.black),
          ),
        ),

        // Body
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Person Detail Form
              PersonForm(store: store),
              const SizedBox(height: 16),

              // People Text
              const Text(
                'People',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              // List of People
              Expanded(
                child: PersonList(store: store),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
