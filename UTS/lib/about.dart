import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/pp/bagas.jpg',
    'assets/pp/dika.png',
    'assets/pp/gabriel.jpg',
    'assets/pp/rizki.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        elevation: 0,
        title: Text(
          'About',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      body: ListView(
  padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: imagePaths.map((path) {
        return ClipOval(
          child: Image.asset(
            path,
            fit: BoxFit.cover,
            width: 70,
            height: 70,
          ),
        );
      }).toList(),
    ),
    SizedBox(height: 30),
    Center(
      child: Text(
        'Comic-Reader App',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
    SizedBox(height: 16),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        'This application was developed to help you explore and enjoy various manga titles.',
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  ],
),

    );
  }
}
