import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Models/offer_items.dart';

class ReservationsController extends ControllerMVC {
  // singleton
  factory ReservationsController(){
    _this ??= ReservationsController._();
    return _this!;
  }

  static ReservationsController? _this;

  ReservationsController._();

  bool loading = false;

int index = 0;

}