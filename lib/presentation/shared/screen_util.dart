import 'package:flutter/material.dart';

class Config {
  Config._();

  static final Config _singleton = Config._();

  factory Config() => _singleton;

  static const figmaDesignSize = Size(393, 804);
}