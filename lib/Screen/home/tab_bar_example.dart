import 'package:flutter/material.dart';

class TabBarExample extends StatelessWidget {
  const TabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 
    3, child: Scaffold(
      appBar: AppBar(
        title: Text('Tabs Example'),
        bottom: TabBar(tabs: [
        Tab(icon: Icon(Icons.home),text: 'Home',),
        Tab(icon: Icon(Icons.star),text: 'Favorites',),
        Tab(icon: Icon(Icons.settings),text: 'Settings',)
        ]
        ),
      ),
      body: TabBarView(children: [
        Center(child: Text('Home Tab'),),
        Center(child: Text('Favorites'),),
        Center(child: Text('Settings Tab'),),
      ]),
    ));
  }
}