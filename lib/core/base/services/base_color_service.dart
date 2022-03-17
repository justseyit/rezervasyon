import 'package:flutter/material.dart';

import 'base_service.dart';

abstract class BaseColorService extends BaseService {
  BaseColorService() {
    _colors = {};
  }
  late final Map<String, Color> _colors;

  void addColor(String key, Color color) => _colors[key] = color;

  Color getColor(String colorName) => _colors[colorName] ?? Colors.transparent;
}
