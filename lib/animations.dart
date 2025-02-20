import 'package:flutter/material.dart';

class Animations {
  String key;
  String name;

  Animations({required this.key, required this.name});

  static List<Animations> animationData = [
    Animations(name: "Walk", key: "F_Walk_003"),
    Animations(name: "Run", key: "F_Run_001"),
  ];
}
