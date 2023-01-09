import 'dart:developer';

import 'package:flutter/material.dart';

class RequestProvider with ChangeNotifier {
  Map<String, dynamic> _requestData = {};

  Map<String, dynamic> get reqData => _requestData;

  void setItem(Map<String, dynamic> relayData) {
    log('Received request data => $relayData');
    _requestData = relayData;
    notifyListeners();
  }
}
