import 'package:connectivity_service/enum/connectivity_status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NetworkSensitive extends StatelessWidget {
  final Widget child;
  const NetworkSensitive({required this.child});

  @override
  Widget build(BuildContext context) {
    var connectionStatus = Provider.of<ConnectivitySatus>(context);
    if (connectionStatus == ConnectivitySatus.celluler) {
      return child;
    }
    if (connectionStatus == ConnectivitySatus.wifi) {
      return child;
    } else if (connectionStatus == ConnectivitySatus.offline) {
      //You can design anything you want here.
      return const Center(
        child: Text(
          'No Internet!',
          style: TextStyle(color: Colors.red, fontSize: 20),
        ),
      );
    }

    return child;
  }
}
