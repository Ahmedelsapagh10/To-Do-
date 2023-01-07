import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeServices {
  final GetStorage _box = GetStorage(); //to store and read value
  final _key = 'isDarkMode';
  //key used to store value that we can read or write on it by Box
  _saveThemeValue(bool mode) => _box.write(_key, mode);

  bool _loadThemeValue() => _box.read<bool>(_key) ?? false; //get value of _key

  ThemeMode get theme => _loadThemeValue() ? ThemeMode.dark : ThemeMode.light;
  //Function to switch and save
  void SwitchMode() {
    //if load true >> light
    Get.changeThemeMode(_loadThemeValue() ? ThemeMode.dark : ThemeMode.light);
    _saveThemeValue(!_loadThemeValue());
  }
}
