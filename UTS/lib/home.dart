import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:comic/main.dart';
import 'package:comic/provider/provider.dart';
import 'package:comic/model/manga.dart';
import 'package:comic/botnav/kategori.dart';
import 'package:comic/botnav/profile.dart';
import 'package:comic/botnav/bookmark.dart';
import 'package:comic/detail.dart';
import 'package:comic/about.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  
  final List<Widget> _pages = [
    HomeContent(),
    Kategori(),
    Profile(),
  ];
  
  String _selectedCategory = 'Fantasy';

  @override
  void initState() {
    super.initState();
    Provider.of<MangaProvider>(context, listen: false).loadMangas();
    Provider.of<MangaProvider>(context, listen: false).setGenre(_selectedCategory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
  leading: PopupMenuButton<String>(
    icon: Icon(Icons.menu, color: Colors.white),
    onSelected: (String result) {
      if (result == 'About') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AboutPage()),
        );
      }
    },
    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
      const PopupMenuItem<String>(
        value: 'About',
        child: Text('About'),
      ),
      const PopupMenuItem<String>(
        value: 'Setting',
        child: Text('Setting'),
      ),
    ],
  ),
  title: Text(
    'Comic-Reader',
    style: TextStyle(fontSize: 25, color: Colors.white),
  ),
  backgroundColor: Colors.blue[300],
  actions: [
    IconButton(
      icon: Icon(Icons.person, size: 30, color: Colors.white),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      },
    ),
  ],
),


      body: _currentIndex == 0 ? _buildHomeContent() : _pages[_currentIndex],
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Bookmark()),
          );
        },
        backgroundColor: Colors.blue[300],
        child: Icon(Icons.bookmark, color: Colors.white),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Discovery',
            icon: Icon(Icons.explore),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person,),
          ),
        ],
      ),
    );
  }

  Widget _buildMangaItem(Manga manga) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage(manga: manga)),
        );
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(manga.coverImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: Icon(
                      manga.isLiked ? Icons.favorite : Icons.favorite_border,
                      color: manga.isLiked ? Colors.red : Colors.white,
                      size: 24,
                    ),
                    onPressed: () {
                      setState(() {
                        manga.toggleLike();
                      });
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                manga.title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                manga.genres.join(', '),
                style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Row(
                children: [
                  const Icon(Icons.favorite, color: Colors.red, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    manga.formattedLikes,
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHorizontalMangaList(List<Manga> mangas) {
    return SizedBox(
      height: 320,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mangas.length,
        itemBuilder: (context, index) => _buildMangaItem(mangas[index]),
      ),
    );
  }

  Widget _buildHomeContent() {
    final mangaProvider = Provider.of<MangaProvider>(context);
    final recommendedMangas = dummyMangas.sublist(0, 6);
    final newReleases = dummyMangas.sublist(6, 12);
    
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                final List<Map<String, String>> items = [
                  {'image': 'assets/rekom/rekom1.jpg'},
                  {'image': 'assets/rekom/rekom2.jpg'},
                  {'image': 'assets/rekom/rekom3.jpg'},
                ];

                return Container(
                  width: 500,
                  margin: const EdgeInsets.symmetric(horizontal: 0),
                  
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(items[index]['image']!),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(8.0),
                      
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Text("")),
                Container(
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
                Expanded(child: Text("")),
              ],
            ),

          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Recommended',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          _buildHorizontalMangaList(recommendedMangas),
          
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'New Releases',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          _buildHorizontalMangaList(newReleases),
          
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'By Category',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ChoiceChip(
                  label: Text(
                    'Fantasy',
                    style: TextStyle(
                      color:
                          _selectedCategory == 'Fantasy'
                              ? Colors.white
                              : Colors.black,
                    ),
                  ),
                  selected: _selectedCategory == 'Fantasy',
                  selectedColor: Colors.black,
                  backgroundColor: Colors.white,
                  showCheckmark: false,
                  onSelected: (selected) {
                    setState(() {
                      _selectedCategory = 'Fantasy';
                      mangaProvider.setGenre(_selectedCategory);
                    });
                  },
                ),
                SizedBox(width: 10,),
                ChoiceChip(
                  label: Text(
                    'Adventure',
                    style: TextStyle(
                      color:
                          _selectedCategory == 'Adventure'
                              ? Colors.white
                              : Colors.black,
                    ),
                  ),
                  selected: _selectedCategory == 'Adventure',
                  selectedColor: Colors.black,
                  backgroundColor: Colors.white,
                  showCheckmark: false,
                  onSelected: (selected) {
                    setState(() {
                      _selectedCategory = 'Adventure';
                      mangaProvider.setGenre(_selectedCategory);
                    });
                  },
                ),
                SizedBox(width: 10,),
                ChoiceChip(
                  label: Text(
                    'Comedy',
                    style: TextStyle(
                      color:
                          _selectedCategory == 'Comedy'
                              ? Colors.white
                              : Colors.black,
                    ),
                  ),
                  selected: _selectedCategory == 'Comedy',
                  selectedColor: Colors.black,
                  backgroundColor: Colors.white,
                  showCheckmark: false,
                  onSelected: (selected) {
                    setState(() {
                      _selectedCategory = 'Comedy';
                      mangaProvider.setGenre(_selectedCategory);
                    });
                  },
                ),
                SizedBox(width: 10,),
                ChoiceChip(
                  label: Text(
                    'Action',
                    style: TextStyle(
                      color:
                          _selectedCategory == 'Action'
                              ? Colors.white
                              : Colors.black,
                    ),
                  ),
                  selected: _selectedCategory == 'Action',
                  selectedColor: Colors.black,
                  backgroundColor: Colors.white,
                  showCheckmark: false,
                  onSelected: (selected) {
                    setState(() {
                      _selectedCategory = 'Action';
                      mangaProvider.setGenre(_selectedCategory);
                    });
                  },
                ),
                SizedBox(width: 10,),
                ChoiceChip(
                  label: Text(
                    'Romance',
                    style: TextStyle(
                      color:
                          _selectedCategory == 'Romance'
                              ? Colors.white
                              : Colors.black,
                    ),
                  ),
                  selected: _selectedCategory == 'Romance',
                  selectedColor: Colors.black,
                  backgroundColor: Colors.white,
                  showCheckmark: false,
                  onSelected: (selected) {
                    setState(() {
                      _selectedCategory = 'Romance';
                      mangaProvider.setGenre(_selectedCategory);
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Consumer<MangaProvider>(
            builder: (context, provider, child) {
              final filteredMangas = provider.filteredMangas;
              if (filteredMangas.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'No manga found in this category',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                );
              }
              return _buildHorizontalMangaList(filteredMangas);
            },
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Content'),
    );
  }
}