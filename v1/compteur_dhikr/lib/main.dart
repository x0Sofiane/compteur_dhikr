import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Compteur de Dhikr',
      home: const DhirkCounter(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DhirkCounter extends StatefulWidget{
  const DhirkCounter({super.key});
  
  @override
  State<DhirkCounter> createState() => _DhirkCounterState();
}

class _DhirkCounterState extends State<DhirkCounter> {
  int count = 0;

  void increment(){
    setState((){
      count++;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar : AppBar(
        title: const Text('Compteur de Dhikr'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$count',
              style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: increment,
              child: const Text('Incrémenter'),
            ),
          ],
        ),
      ),
    );
  }

}