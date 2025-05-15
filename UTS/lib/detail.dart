import 'package:flutter/material.dart';
import 'package:comic/model/manga.dart';

class DetailPage extends StatefulWidget {
  final Manga manga;

  const DetailPage({Key? key, required this.manga}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isExpanded = false;
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          widget.manga.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        backgroundColor: Colors.blue[300],
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
             
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cover and Detail
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: Stack(
                    children: [
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: AssetImage(widget.manga.coverImage),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: IconButton(
                          icon: Icon(
                            widget.manga.isLiked ? Icons.favorite : Icons.favorite_border,
                            color: widget.manga.isLiked ? Colors.red : Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            setState(() {
                              widget.manga.toggleLike();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '📖 Synopsis',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () => setState(() => isExpanded = !isExpanded),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.manga.synopsis,
                              maxLines: isExpanded ? null : 6,
                              overflow: isExpanded ? null : TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 16, height: 1.5),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              isExpanded ? 'Show less ▲' : 'Read more ▼',
                              style: const TextStyle(
                                color: Color.fromRGBO(100, 181, 246, 1),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        onPressed: () {
                          setState(() => isBookmarked = !isBookmarked);
                        },
                        icon: Icon(
                          isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                        ),
                        label: Text(isBookmarked ? 'Bookmarked' : 'Bookmark'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[300],
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Likes & Genres
            Row(
              children: [
                const Icon(Icons.favorite, color: Colors.red),
                const SizedBox(width: 8),
                Text('${widget.manga.formattedLikes} likes'),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: widget.manga.genres
                  .map((genre) => Chip(
                        label: Text(genre),
                        backgroundColor: Colors.blue[50],
                        labelStyle: const TextStyle(color: Colors.black),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 24),

            // Chapters
            const Text(
              '📚 Chapters',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      child: const Icon(Icons.menu_book, color: Colors.white),
                    ),
                    title: Text('Chapter ${index + 1}'),
                    subtitle: Text('Released: May ${index + 1}, 2025'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {

      //   },
      //   backgroundColor: Colors.blue[300],
      //   icon: const Icon(Icons.menu_book),
      //   label: const Text('Read'),
      // ),
    );
  }
}