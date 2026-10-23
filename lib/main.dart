
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TravelJournal(),
    );
  }
}

class TravelJournal extends StatefulWidget {
  const TravelJournal({super.key});

  @override
  State<TravelJournal> createState() => _TravelJournalState();
}

class _TravelJournalState extends State<TravelJournal> {
  int imageIndex = 0;
  int clicks = 0;

  final List<String> images = [
    'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=800',
    'https://images.unsplash.com/photo-1516483638261-f4dbaf036963?w=800',
    'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=800',
  ];

  final List<String> places = [
    'Beautiful Nature',
    'Colorful Italian Coast',
    'Amazing Mountains',
  ];

  void changeImage() {
    setState(() {
      imageIndex = (imageIndex + 1) % images.length;
      clicks++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,

      appBar: AppBar(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        leading: const Icon(Icons.menu),
        title: const Text('My Travel Journal'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.travel_explore),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Welcome to Flutter!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Discover beautiful places around the world.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueGrey,
              ),
            ),

            const SizedBox(height: 20),

            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                images[imageIndex],
                height: 230,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 230,
                    color: Colors.grey.shade300,
                    alignment: Alignment.center,
                    child: const Text('Could not load image'),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            Text(
              places[imageIndex],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Every journey creates a new memory.',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: changeImage,
              icon: const Icon(Icons.image),
              label: const Text('Discover another place'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14,
                ),
              ),
            ),

            const SizedBox(height: 12),

            Text(
              'Button clicks: $clicks',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.teal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
