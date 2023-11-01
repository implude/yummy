import 'package:flutter/material.dart';

extension DestructUtils<T> on ValueNotifier<T> {
  (T, void Function(T value)) get destructed => (value, (v) => value = v);
}
