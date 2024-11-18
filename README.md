# faq_demo_flutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimerPickerFormField extends FormField<Duration> {
  TimerPickerFormField({
    Key? key,
    Duration initialValue = const Duration(),
    FormFieldSetter<Duration>? onSaved,
    FormFieldValidator<Duration>? validator,
  }) : super(
          key: key,
          initialValue: initialValue,
          onSaved: onSaved,
          validator: validator,
          builder: (FormFieldState<Duration> state) {
            return GestureDetector(
              onTap: () async {
                Duration? pickedDuration = await showModalBottomSheet<Duration>(
                  context: state.context,
                  builder: (BuildContext context) {
                    Duration tempDuration = state.value ?? Duration();
                    return SizedBox(
                      height: 250,
                      child: CupertinoTimerPicker(
                        mode: CupertinoTimerPickerMode.hm,
                        initialTimerDuration: tempDuration,
                        onTimerDurationChanged: (Duration newDuration) {
                          tempDuration = newDuration;
                        },
                      ),
                    );
                  },
                );

                if (pickedDuration != null) {
                  state.didChange(pickedDuration);
                }
              },
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Select Time',
                  border: OutlineInputBorder(),
                  errorText: state.hasError ? state.errorText : null,
                ),
                child: Text(
                  state.value != null
                      ? state.value!.toString().split('.').first
                      : 'Select a time',
                ),
              ),
            );
          },
        );
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cupertino Time Picker Form'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: TimerPickerForm(),
        ),
      ),
    );
  }
}

class TimerPickerForm extends StatefulWidget {
  @override
  _TimerPickerFormState createState() => _TimerPickerFormState();
}

class _TimerPickerFormState extends State<TimerPickerForm> {
  final _formKey = GlobalKey<FormState>();
  Duration _selectedDuration = Duration();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TimerPickerFormField(
            initialValue: _selectedDuration,
            onSaved: (value) {
              if (value != null) _selectedDuration = value;
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Selected time: $_selectedDuration')),
                );
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
