
import 'package:flutter/material.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() {
    return _instance;
  }
  NotificationService._internal();
  final ValueNotifier<int> amountNotificationNotifier = ValueNotifier(0);
}

