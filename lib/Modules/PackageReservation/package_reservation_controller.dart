import 'package:mvc_pattern/mvc_pattern.dart';


class PackageReservationController extends ControllerMVC {
  // singleton
  factory PackageReservationController(){
    _this ??= PackageReservationController._();
    return _this!;
  }

  static PackageReservationController? _this;

  PackageReservationController._();

  bool loading = false;

  int indexNationality = 0;
  int indexHour = 0;
}