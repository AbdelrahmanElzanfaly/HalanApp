import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Models/offer_items.dart';

class SettingController extends ControllerMVC {
  // singleton
  factory SettingController(){
    _this ??= SettingController._();
    return _this!;
  }

  static SettingController? _this;

  SettingController._();

  bool loading = false;

  int index = 0;

}