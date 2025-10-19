import 'package:flutter/material.dart';
import 'package:my_app1/notification/notification_service.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
          onPressed: () {
            final amount =
                NotificationService().amountNotificationNotifier.value;
            NotificationService().amountNotificationNotifier.value = amount - 1;
          },
          icon: Icon(Icons.remove)),
      appBar: AppBar(
        title: Text('Notification'),
      ),
      body: Center(
        child: Text("Notification"),
      ),
    );
  }
}
