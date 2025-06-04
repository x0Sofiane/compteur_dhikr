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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compteur de Dhikr'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color:Colors.teal,
              ),
              child: Text(
                'Choisir un dhikr',
                 style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ...adhkar.asMap().entries.map((entry){
              final index = entry.key;
              final dhikr = entry.value;

              return ListTile (
                title: Text(
                  dhikr,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(fontSize: 24),
                ),
                onTap: (){
                  setState(() {
                    currentIndex = index;
                    count = 0; // remet à 0 quand l'invocation change
                  });
                  Navigator.pop(context); //ferme le drawer après selection
                }
              );
            }
            )
          ],
        ),
      ),
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Le dhikr affiché en grand au-dessus
          Text(
            adhkar[currentIndex],
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w600,
              height: 2,
            ),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 40),
          
          // Le bouton rond avec compteur
          ElevatedButton(
            onPressed: increment,
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(40),
              backgroundColor: Colors.teal,
            ),
            child: Text(
              '$count',
              style: const TextStyle(fontSize: 28, color: Colors.white),
            ),
          ),
        ],
      ),
    ),
    );
  }
}
