import 'package:flutter/material.dart';
import 'package:poc/person.dart';
import 'package:poc/person_store.dart';

class PersonForm extends StatefulWidget {
  final PersonStore store;

  const PersonForm({
    super.key,
    required this.store,
  });

  @override
  State<PersonForm> createState() => _PersonFormState();
}

class _PersonFormState extends State<PersonForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              // Name TextFormField
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter your name';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Age TextField
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(
                  labelText: 'Age',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter your age.';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number.';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Button
        SizedBox(
          width: 200,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final name = _nameController.text;
                final age = int.parse(_ageController.text);
                final person = Person(name: name, age: age);
                widget.store.addPerson(person);
                _nameController.clear();
                _ageController.clear();
              }
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            child: const Text(
              'Add Person',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
