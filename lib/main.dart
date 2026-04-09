import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _incrementCounterByTwo() {
    setState(() {
      _counter = _counter + 2;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _decrementCounterByTwo() {
    setState(() {
      _counter = _counter - 2;
    });
  }

  void _squareCounter() {
    setState(() {
      _counter = _counter * _counter;
    });
  }

  void _randomizeCounter() {
    setState(() {
      bool rnd = Random().nextBool();
      int factor = Random().nextInt(10) + 1;
      _counter = _counter + factor;
      if (rnd) {
        _counter = _counter * factor;
      } else {
        _counter = (_counter / factor).floor();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: .spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: .center,
            children:
                [
                      ElevatedButton.icon(
                        onPressed: _incrementCounter,
                        label: Icon(Icons.exposure_plus_1),
                      ),
                      ElevatedButton.icon(
                        onPressed: _incrementCounterByTwo,
                        label: Icon(Icons.exposure_plus_2),
                      ),
                      ElevatedButton.icon(
                        onPressed: _decrementCounter,
                        label: Icon(Icons.exposure_minus_1),
                      ),
                      ElevatedButton.icon(
                        onPressed: _decrementCounterByTwo,
                        label: Icon(Icons.exposure_minus_2),
                      ),
                      ElevatedButton.icon(
                        onPressed: _squareCounter,
                        label: Icon(Icons.superscript),
                      ),
                      ElevatedButton.icon(
                        onPressed: _randomizeCounter,
                        label: Icon(Icons.question_mark),
                      ),
                    ]
                    .map(
                      (widget) => Padding(
                        padding: const EdgeInsets.all(16),
                        child: widget,
                      ),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }
}
