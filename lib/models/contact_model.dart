import 'dart:io';

// contact model
class ContactModel {
  File? image;
  String name;
  String email;
  String phoneNumber;
  List<ContactModel>? contactList;

  ContactModel({
    required this.image,
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.contactList,
  });
}

// counter model
class CounterModel {
  int counter;

  CounterModel({
    required this.counter,
  });
}

// stepper model
class StepperModel {
  int stepperIndex;

  StepperModel({
    required this.stepperIndex,
  });
}

// theme model
class ThemeModel {
  bool isTheme;

  ThemeModel({
    required this.isTheme,
  });
}
