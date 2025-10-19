import 'package:flutter/material.dart';
import 'package:my_app1/notification/notification_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
          onPressed: () {
            final amount =
                NotificationService().amountNotificationNotifier.value;
            NotificationService().amountNotificationNotifier.value = amount + 1;
          },
          icon: Icon(Icons.add)),
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Home Screen make it dirty '),
      ),
    );
  }
}