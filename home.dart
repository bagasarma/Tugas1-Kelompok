import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu, color: Colors.white),
        title: Text(
          'Comic-Reader',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Recommended',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7, 
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                final List<Map<String, String>> items = [
                  {'image': 'assets/cover1.jpg', 'title': 'Naruto'},
                  {'image': 'assets/cover2.jpg', 'title': 'One Piece'},
                  {'image': 'assets/cover3.jpg', 'title': 'Dragon Ball'},
                  {'image': 'assets/cover4.jpg', 'title': 'Black Clover'},
                  {'image': 'assets/cover5.jpg', 'title': 'YU-GI-OH'},
                  {'image': 'assets/cover6.jpg', 'title': 'One Punch Man'},
                ];

                return Container(
                  width: 120,
                  height: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(items[index]['image']!),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      items[index]['title']!,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [Shadow(color: Colors.black, blurRadius: 2)],
                      ),
                    ),
                  ),
                );
              },
            ),
            
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'New Releases',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                final List<Map<String, String>> items = [
                  {'image': 'assets/cover7.jpg', 'title': 'Jujutsu Kaisen'},
                  {'image': 'assets/cover8.jpg', 'title': 'Kimetsu No Yaiba'},
                  {'image': 'assets/cover9.jpg', 'title': 'Dr.Stone'},
                  {'image': 'assets/cover10.jpg', 'title': 'Mashle'},
                  {'image': 'assets/cover11.jpg', 'title': 'Hunter X Hunter'},
                  {'image': 'assets/cover12.jpg', 'title': 'Yakusoku No Neverland'},
                ];

                return Container(
                  width: 120,
                  height: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(items[index]['image']!),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      items[index]['title']!,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [Shadow(color: Colors.black, blurRadius: 2)],
                      ),
                    ),
                  ),
                );
              },
            ),
            
          ),
        ],
      ),
    );
  }
}
