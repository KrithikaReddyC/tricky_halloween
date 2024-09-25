import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enhanced Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;
  int _customIncrement = 1;
  final int _maxCounter = 100;
  List<int> _history = [];

  void _incrementCounter() {
    setState(() {
      if (_counter + _customIncrement <= _maxCounter) {
        _history.add(_counter);
        _counter += _customIncrement;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _history.add(_counter);
        _counter -= 1;
      }
    });
  }

  void _resetCounter() {
    setState(() {
      _history.add(_counter);
      _counter = 0;
    });
  }

  void _undoCounter() {
    setState(() {
      if (_history.isNotEmpty) {
        _counter = _history.removeLast();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enhanced Counter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              color: _counter == 0
                  ? Colors.red
                  : (_counter > 50 ? Colors.green : Colors.blue),
              child: Text(
                '$_counter',
                style: TextStyle(fontSize: 50.0),
              ),
            ),
          ),
          Slider(
            min: 0,
            max: _maxCounter.toDouble(),
            value: _counter.toDouble(),
            onChanged: (double value) {
              setState(() {
                _counter = value.toInt();
              });
            },
            activeColor: Colors.blue,
            inactiveColor: Colors.red,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: Text('Increment'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: Text('Decrement'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _resetCounter,
                  child: Text('Reset'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _undoCounter,
                  child: Text('Undo'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Custom Increment',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _customIncrement = int.tryParse(value) ?? 1;
                });
              },
            ),
          ),
          if (_counter >= _maxCounter)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Maximum limit reached!',
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
            ),
          if (_counter == _maxCounter)
            AlertDialog(
              title: Text('Success!'),
              content: Text('You have reached the target of 100!'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          Expanded(
            child: ListView.builder(
              itemCount: _history.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Previous value: ${_history[index]}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
