import 'package:flutter/material.dart';

class Kategori extends StatefulWidget {
  const Kategori({super.key});

  @override
  State<Kategori> createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  // List of comic categories
  final List<Map<String, dynamic>> categories = [
    {
      'name': 'Action',
      'icon': Icons.flash_on,
      'color': Colors.red,
    },
    {
      'name': 'Adventure',
      'icon': Icons.explore,
      'color': Colors.blue,
    },
    {
      'name': 'Comedy',
      'icon': Icons.sentiment_very_satisfied,
      'color': Colors.yellow.shade800,
    },
    {
      'name': 'Drama',
      'icon': Icons.theater_comedy,
      'color': Colors.purple,
    },
    {
      'name': 'Fantasy',
      'icon': Icons.auto_awesome,
      'color': Colors.teal,
    },
    {
      'name': 'Horror',
      'icon': Icons.sentiment_very_dissatisfied,
      'color': Colors.black87,
    },
    {
      'name': 'Mystery',
      'icon': Icons.search,
      'color': Colors.indigo,
    },
    {
      'name': 'Romance',
      'icon': Icons.favorite,
      'color': Colors.pink,
    },
    // {
    //   'name': 'Sci-Fi',
    //   'icon': Icons.rocket_launch,
    //   'color': Colors.deepPurple,
    // },
    // {
    //   'name': 'Slice of Life',
    //   'icon': Icons.home,
    //   'color': Colors.green,
    // },
    // {
    //   'name': 'Sports',
    //   'icon': Icons.sports_basketball,
    //   'color': Colors.orange,
    // },
    // {
    //   'name': 'Supernatural',
    //   'icon': Icons.whatshot,
    //   'color': Colors.deepOrange,
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'List Categories',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(
                    //     content: Text('${categories[index]['name']} selected'),
                    //     duration: Duration(seconds: 1),
                    //   ),
                    // );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: categories[index]['color'].withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: categories[index]['color'],
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          categories[index]['icon'],
                          size: 40,
                          color: categories[index]['color'],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          categories[index]['name'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: categories[index]['color'],
                          ),
                        ),
                      ],
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