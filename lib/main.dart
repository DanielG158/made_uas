import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // menggunakan ChangeNotifierProvider untuk menyediakan counter
    return ChangeNotifierProvider<Counter>(
      // buat instance dari Counter
      create: (_) => Counter(),
      child: MaterialApp(
        title: 'State Management',
        home: CounterScreen(),
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // consumer widget untuk mengakses counter
            Consumer<Counter>(
              // menyediakan counter yang dibutuhkan widget
              builder: (context, counter, _) => Text(
                'Count: ${counter.count}',
                style: TextStyle(fontSize: 48),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // mengakses counter dan memanggil method increment
                Provider.of<Counter>(context, listen: false).increment();
              },
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}

class Counter extends ChangeNotifier {
  // untuk menghold jumlah count
  int _count = 0;

  // untuk mengetahui jumlah count
  int get count => _count;

  // untuk menambah jumlah count dan memberitahu widget yang menggunakan counter
  void increment() {
    _count++;
    // memberitahu widget yang menggunakan counter
    notifyListeners();
  }
}

