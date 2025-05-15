class Manga {
  final String title;
  final String coverImage;
  final List<String> genres;
  final String synopsis; // Added synopsis property
  int likes;
  bool isLiked;

  Manga({
    required this.title,
    required this.coverImage,
    required this.genres,
    required this.synopsis, // Added to constructor
    this.likes = 0,
    this.isLiked = false,
  });

  factory Manga.fromJson(Map<String, dynamic> json) {
    return Manga(
      title: json['title'],
      coverImage: json['coverImage'],
      genres: List<String>.from(json['genres']),
      synopsis: json['synopsis'] ?? 'No synopsis available.', // Added to factory
      likes: json['likes'] ?? 0,
      isLiked: json['isLiked'] ?? false,
    );
  }

  String get formattedLikes {
    if (likes >= 1000000) {
      return '${(likes / 1000000).toStringAsFixed(1)} jt';
    } else if (likes >= 1000) {
      return '${(likes / 1000).toStringAsFixed(1)} rb';
    }
    return likes.toString();
  }

  void toggleLike() {
    isLiked = !isLiked;
    likes += isLiked ? 1 : -1;
  }
}

List<Manga> dummyMangas = [
  Manga(
    title: "One Piece",
    coverImage: "assets/action/cover2.jpg",
    genres: ["Action", "Fantasy", "Adventure"],
    synopsis: "Monkey D. Luffy refuses to let anyone or anything stand in the way of his quest to become the king of all pirates. With a course charted for the treacherous waters of the Grand Line and beyond, this is the story of a young man who defied all odds to follow his dreams.",
    likes: 12500000,
    isLiked: false,
  ),
  Manga(
    title: "Naruto",
    coverImage: "assets/action/cover1.jpg",
    genres: ["Action", "Fantasy", "Ninja"],
    synopsis: "Naruto Uzumaki, a mischievous adolescent ninja, struggles as he searches for recognition and dreams of becoming the Hokage, the village's leader and strongest ninja.",
    likes: 9800000,
    isLiked: false,
  ),
  Manga(
    title: "Dragon Ball Z",
    coverImage: "assets/action/cover3.jpg",
    genres: ["Action", "Fantasy", "Martial Arts"],
    synopsis: "Following the adventures of Son Goku, who, along with his companions, defends the Earth against an assortment of villains. While the original Dragon Ball anime followed Goku from childhood into adulthood, Dragon Ball Z continues the story of his adult life and his son Gohan.",
    likes: 8700000,
    isLiked: false,
  ),
  Manga(
    title: "Jujutsu Kaisen",
    coverImage: "assets/action/cover6.jpg",
    genres: ["Action", "Fantasy", "Horor"],
    synopsis: "Yuji Itadori, a high schooler who joins his school's Occult Club, unwittingly becomes host to Sukuna, a powerful Curse spirit, and finds himself dragged into the world of Curses.",
    likes: 10500000,
    isLiked: false,
  ),
  Manga(
    title: "Black Clover",
    coverImage: "assets/action/cover4.jpg",
    genres: ["Action", "Fantasy", "Magic"],
    synopsis: "In a world where magic is everything, Asta, a boy born without any magic in a world where magic is everything, hopes to become the Wizard King. Despite his disadvantage, Asta possesses rare anti-magic swords and joins the Black Bulls.",
    likes: 7500000,
    isLiked: false,
  ),
  Manga(
    title: "YU-GI-OH",
    coverImage: "assets/action/cover5.jpg",
    genres: ["Action", "Fantasy", "Card"],
    synopsis: "The story follows Yugi Mutou, a high school student who possesses an ancient Egyptian artifact known as the Millennium Puzzle, which contains the spirit of an ancient pharaoh. When challenged to a game, Yugi transforms into the King of Games.",
    likes: 6800000,
    isLiked: false,
  ),
  Manga(
    title: "One Punch Man",
    coverImage: "assets/action/cover6.jpg",
    genres: ["Action", "Comedy", "Superhero"],
    synopsis: "The story follows Saitama, a superhero who can defeat any opponent with a single punch but seeks to find a worthy opponent after growing bored by a lack of challenge due to his overwhelming strength.",
    likes: 9200000,
    isLiked: false,
  ),
  Manga(
    title: "Kimetsu No Yaiba",
    coverImage: "assets/action/cover8.jpg",
    genres: ["Action", "Fantasy", "Adventure"],
    synopsis: "A young boy named Tanjiro Kamado who becomes a demon slayer after his family is slaughtered and his younger sister Nezuko is turned into a demon.",
    likes: 11500000,
    isLiked: false,
  ),
  Manga(
    title: "Dr. Stone",
    coverImage: "assets/action/cover9.jpg",
    genres: ["Action", "Fantasy", "Science"],
    synopsis: "Follows teenage scientific genius Senku Ishigami, who plans to rebuild civilization after humanity was mysteriously petrified for 3,700 years.",
    likes: 7900000,
    isLiked: false,
  ),
  Manga(
    title: "Mashle",
    coverImage: "assets/action/cover10.jpg",
    genres: ["Action", "Fantasy", "Comedy"],
    synopsis: "In a world where magic is everything, Mash Burnedead has none. Instead, he trained his body to physical perfection, and now attends a prestigious magic school where he uses his raw strength to solve magical problems.",
    likes: 6500000,
    isLiked: false,
  ),
  Manga(
    title: "Hunter X Hunter",
    coverImage: "assets/action/cover11.jpg",
    genres: ["Action", "Fantasy", "Adventure"],
    synopsis: "The story focuses on a young boy named Gon Freecss who discovers that his father, who left him at a young age, is actually a world-renowned Hunter, a licensed professional who specializes in fantastical pursuits.",
    likes: 10200000,
    isLiked: false,
  ),
  Manga(
    title: "Yakusoku No Neverland",
    coverImage: "assets/action/cover12.jpg",
    genres: ["Action", "Fantasy", "Adventure"],
    synopsis: "Set in the year 2045, Emma is an 11-year-old orphan living in Grace Field House, a self-contained orphanage housing her and 37 other orphans. They discover the truth about their existence and must escape.",
    likes: 8800000,
    isLiked: false,
  ),

  Manga(
    title: "Bunny Girl",
    coverImage: "assets/romance/cover1.jpg",
    genres: ["Romance", "School", "Thriller"],
    synopsis: "Revolves around various teenagers who encounter a strange phenomenon known as 'Adolescence Syndrome', which manifests as physical ailments born from psychological disorders.",
    likes: 7200000,
    isLiked: false,
  ),
  Manga(
    title: "Horimiya",
    coverImage: "assets/romance/cover2.jpg",
    genres: ["Romance", "Drama", "School"],
    synopsis: "The story follows the daily life of Kyoko Hori, an intelligent and popular high school girl who hides her home life, and Izumi Miyamura, a quiet boy who has a completely different appearance outside of school.",
    likes: 8100000,
    isLiked: false,
  ),
  Manga(
    title: "Hyouka",
    coverImage: "assets/romance/cover3.jpg",
    genres: ["Romance", "Mystery", "School"],
    synopsis: "Follows high school student Houtarou Oreki, who joins the Classic Literature Club to stop it from being abolished. There, he meets a girl named Eru Chitanda who constantly involves him in various mysteries.",
    likes: 6900000,
    isLiked: false,
  ),
  Manga(
    title: "Kaoru Hana wa Rin to Saku",
    coverImage: "assets/romance/cover4.jpg",
    genres: ["Romance", "School"],
    synopsis: "A story about a delinquent high school boy who falls in love with a kind-hearted girl who sees past his rough exterior.",
    likes: 7400000,
    isLiked: false,
  ),
  Manga(
    title: "Oshi no Ko",
    coverImage: "assets/romance/cover5.jpg",
    genres: ["Romance", "Drama", "Idol"],
    synopsis: "The story follows a doctor who is reincarnated as the child of his favorite idol after being murdered. However, his new life is far from the glamorous world of show business that he imagined.",
    likes: 9500000,
    isLiked: false,
  ),
  Manga(
    title: "Wotakoi",
    coverImage: "assets/romance/cover6.jpg",
    genres: ["Romance", "Comedy", "Office"],
    synopsis: "The story follows the office romance between Narumi, a fujoshi who tries to hide her otaku lifestyle, and Hirotaka, a gaming otaku who is more open about his hobbies.",
    likes: 7800000,
    isLiked: false,
  ),
  Manga(
    title: "Takagi - san",
    coverImage: "assets/romance/cover7.jpg",
    genres: ["Romance", "Comedy", "School"],
    synopsis: "Middle school student Nishikata is constantly being teased by his seatmate Takagi. He tries to get back at her, but she's always one step ahead. As their back-and-forth continues, Nishikata's feelings for Takagi grow.",
    likes: 7100000,
    isLiked: false,
  ),
  Manga(
    title: "Komi - san",
    coverImage: "assets/romance/cover8.jpg",
    genres: ["Romance", "Drama", "School"],
    synopsis: "Follows Shouko Komi, a high school girl who has a severe communication disorder despite her popularity. With the help of Hitohito Tadano, she aims to make 100 friends.",
    likes: 8300000,
    isLiked: false,
  ),
  Manga(
    title: "My Dress-Up Darling",
    coverImage: "assets/romance/cover9.jpg",
    genres: ["Romance", "Comedy", "Hoby"],
    synopsis: "Follows the story of high school student Wakana Gojo, who wants to become a traditional Japanese doll craftsman, and popular girl Marin Kitagawa, who introduces him to the world of cosplay.",
    likes: 8900000,
    isLiked: false,
  ),
];