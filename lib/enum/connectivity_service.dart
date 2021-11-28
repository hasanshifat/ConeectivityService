import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:connectivity_service/enum/connectivity_status.dart';

class ConeectivityService {
  StreamController<ConnectivitySatus> connectionStatusController =
      StreamController<ConnectivitySatus>();

  ConeectivityService() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      var connectionStatus = _getStatusFromResult(result);
      connectionStatusController.add(connectionStatus);
    });
  }

  ConnectivitySatus _getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return ConnectivitySatus.celluler;
      case ConnectivityResult.wifi:
        return ConnectivitySatus.wifi;
      case ConnectivityResult.none:
        return ConnectivitySatus.offline;
      default:
        return ConnectivitySatus.offline;
    }
  }
}
