import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Compteur de Dhikr',
      home: const DhirkCounter(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DhirkCounter extends StatefulWidget {
  const DhirkCounter({super.key});

  @override
  State<DhirkCounter> createState() => _DhirkCounterState();
}

class _DhirkCounterState extends State<DhirkCounter> {
  int count = 0;
  int currentIndex = 0;

  final List<String> adhkar = [
    'سُبْحَانَ ٱللَّٰهِ',
    'ٱلْحَمْدُ لِلَّٰهِ',
    'لَا إِلَٰهَ إِلَّا ٱللَّٰهُ',
    'ٱللَّٰهُ أَكْبَرُ',
  ];

  void increment() {
    setState(() {
      count++;
      currentIndex = (currentIndex + 1) % adhkar.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Compteur de Dhikr'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              adhkar[currentIndex],
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w600, height: 2),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: increment,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
              child: Text('$count', style: const TextStyle(fontSize: 28, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
