import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';

class ConnectivityHelper{
  factory ConnectivityHelper(){
    _this ??= ConnectivityHelper._();
    return _this!;
  }
  static ConnectivityHelper? _this;
  ConnectivityHelper._();

  bool lastConnection = true;

  StreamSubscription? _subscription;
  addListener(Function()? function) async{
    _subscription?.cancel();
    _subscription = Connectivity().onConnectivityChanged.listen((result)async{
      bool result = await _checkConnection(null);
      if(result && function!=null) function();
    });
    bool result = await _checkConnection(null);
    if(result && function!=null) function();
  }

  final StreamController<bool> _connectionChangeController = StreamController.broadcast();
  Stream<bool> get connectionChange => _connectionChangeController.stream;

  void initialize(){
    Connectivity().onConnectivityChanged.listen(_checkConnection);
    _checkConnection(null);
  }

  Future<bool> _checkConnection(ConnectivityResult? result) async {
    bool hasConnection = false;
    result ??= await Connectivity().checkConnectivity();
    if(result == ConnectivityResult.none){
      _connectionChangeController.add(hasConnection);
      lastConnection = hasConnection;
    }else{
      hasConnection = await DataConnectionChecker().hasConnection;
      _connectionChangeController.add(hasConnection);
      lastConnection = hasConnection;
    }
    return hasConnection;
  }

  void dispose() {
    _connectionChangeController.close();
  }
}