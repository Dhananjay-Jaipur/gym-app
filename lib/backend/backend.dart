import 'package:flutter/material.dart';
import 'package:gym/pages/user/feature/profile.dart';
import 'package:gym/pages/user/feature/workout.dart';

class Backend with ChangeNotifier {
  //+++++++++++++++++++++++++++ home +++++++++++++++++++++++++++++++++++

  int currentIndex = 0;

  List<Widget> pages = [const Workout(), const Profile()];

  void togglePage(int index) {
    currentIndex = index;
    notifyListeners();
  }

  //+++++++++++++++++++++++++++ workout ++++++++++++++++++++++++++++++++++

  DateTime focusedDay = DateTime.now();
  DateTime selctedDay = DateTime.now();

  void updateDay(selected, focused) {
    selctedDay = selected;
    focusedDay = focused;
    notifyListeners();
  }

  List datsUserCame = [
    DateTime(2024, 11, 24),
    DateTime(2024, 11, 25),
    DateTime(2024, 11, 26),
    DateTime(2024, 11, 28),
  ];

  List todayRutine = [
    ["chest", "assets/chest.png"],
    ["tricep", "assets/triceps.png"],
  ];

  void setRotine(day) {
    if (day == "Mon") {
      todayRutine[0][0] = "chest";
      todayRutine[0][1] = "assets/chest.png";

      todayRutine[1][0] = "tricep";
      todayRutine[1][1] = "assets/triceps.png";
    }
    notifyListeners();
  }

  //+++++++++++++++++++++++++++ profile ++++++++++++++++++++++++++++++++++

  int page = 1;

  void updatePage(val) {
    page = val;
    notifyListeners();
  }

  List<String> iconPath = [
    "assets/volume.png",
    "assets/clock.png",
    "assets/excersise.png",
    "assets/weight.png",
    "assets/profile.png",
  ];

  List<String> iconName = [
    '34,896 kg',
    '432 hr',
    '670 kacl',
    '67 kg',
    'Kabir',
  ];

  List<String> discription = [
    "workout volume",
    "time spend",
    "calares burn this week",
    "current weight",
    "edit profile",
  ];

  //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
}
