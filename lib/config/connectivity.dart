import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ConnectivityService {
  static final ConnectivityService _instance = ConnectivityService._internal();
  factory ConnectivityService() => _instance;
  ConnectivityService._internal();

  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;
  bool _wasConnected = true;

  void initialize() {
    // Check initial connectivity
    _connectivity.checkConnectivity().then((result) {
      _wasConnected = !result.contains(ConnectivityResult.none);
    });

    // Listen to connectivity changes
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) {
      _handleConnectivityChange(results);
    });
  }

  void _handleConnectivityChange(List<ConnectivityResult> results) {
    bool isConnected = !results.contains(ConnectivityResult.none);

    if (!isConnected && _wasConnected) {
      // Connection lost
      _showToast(
        "No Internet Connection",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        icon: Icons.wifi_off,
      );
    } else if (isConnected && !_wasConnected) {
      // Connection restored
      _showToast(
        "Internet Connection Restored",
        backgroundColor: Colors.green,
        textColor: Colors.white,
        icon: Icons.wifi,
      );
    }

    _wasConnected = isConnected;
  }

  void _showToast(
    String message, {
    required Color backgroundColor,
    required Color textColor,
    required IconData icon,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 3,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16.0,
    );
  }

  void dispose() {
    _connectivitySubscription?.cancel();
  }
}
