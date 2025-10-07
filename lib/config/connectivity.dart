import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsivity/components/toast.dart';

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
      showToast(
        "No Internet Connection",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } else if (isConnected && !_wasConnected) {
      // Connection restored
      showToast(
        "Internet Connection Restored",
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
    }

    _wasConnected = isConnected;
  }

  void dispose() {
    _connectivitySubscription?.cancel();
  }
}
