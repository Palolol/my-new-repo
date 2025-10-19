import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp());
}

class CarouselExampleApp extends StatelessWidget {
  const CarouselExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.cast),
        title: const Text('Flutter TV'),
        actions: const <Widget> [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 16.0),
            child: CircleAvatar(child: Icon(Icons.account_circle),),
          ),
        ]
      ),
      body: const CarouselExampleApp(),
    );
  }
}
class CarouselExample extends StatefulWidget {
  const CarouselExample({super.key});

  @override
  State<CarouselExample> createState() => _CarouselExampleState();
}

class _CarouselExampleState extends State<CarouselExample> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}