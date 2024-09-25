import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Task App',
      home: TaskScreen(),
    );
  }
}

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  int _counter = 0;  // Counter value
  bool _isFirstImage = true;  // Track which image is currently displayed

  // Function to increment the counter
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // Function to toggle the image
  void _toggleImage() {
    setState(() {
      _isFirstImage = !_isFirstImage;
    });
  }

  // Function to reset counter and image
  void _reset() {
    setState(() {
      _counter = 0; // Reset counter
      _isFirstImage = true; // Reset to initial image
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Task App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Task 1: Counter Display
            Text(
              'Counter: $_counter',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            // Increment Button
            ElevatedButton(
              onPressed: _incrementCounter,
              child: Text('Increment'),
            ),
            SizedBox(height: 40),
            // Task 2: Display Image
            Image.asset(
              _isFirstImage ? 'assets/images/smile.png' : 'assets/images/smile1.jpeg',
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20),
            // Toggle Image Button
            ElevatedButton(
              onPressed: _toggleImage,
              child: Text('Toggle Image'),
            ),
            SizedBox(height: 40),
            // Reset Button (For Graduate Students)
            ElevatedButton(
              onPressed: _reset,
              child: Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
