import 'package:flutter/material.dart';
import 'movie_card.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MoviePage(),
    );
  }
}

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  // =========================
  // DARK MODE STATE
  // =========================
  bool isDarkMode = true;

  // =========================
  // DATA FILM
  // =========================
  List<Map<String, dynamic>> movies = [
  {
    "title": "Avengers: Endgame",
    "poster":
        "assets/img/avangersendgame.png",
    "rating": 4.8,
    "watched": false,
    "synopsis": "Setelah dampak jentikan jari Thanos yang memusnahkan setengah populasi alam semesta, para Avengers yang tersisa bekerja sama untuk mencari cara mengembalikan semuanya. Mereka melakukan perjalanan waktu demi mengumpulkan Infinity Stones dan menghadapi pertarungan terbesar mereka.",
  },
  {
    "title": "Spider-Man: No Way Home",
    "poster":
        "assets/img/SpidermanNoWayHome.jpg",
    "rating": 4.7,
    "watched": false,
    "synopsis": "Identitas Peter Parker sebagai Spider-Man terbongkar, membuat hidupnya kacau balau. Untuk memperbaiki keadaan, ia meminta bantuan Doctor Strange, tetapi mantra yang gagal justru membuka multiverse dan membawa para musuh dari dunia berbeda ke realitas mereka.",
  },
  {
    "title": "Interstellar",
    "poster":
        "assets/img/interstelar.png",
    "rating": 4.9,
    "watched": false,
    "synopsis": "Ketika bumi mulai mengalami krisis pangan, sekelompok astronot melakukan perjalanan melalui wormhole untuk mencari planet baru yang layak huni. Cooper harus memilih antara menyelamatkan umat manusia atau keluarga yang ia tinggalkan di bumi.",
  },
  {
    "title": "Pirates of the Caribbean",
    "poster":
        "assets/img/piratesofthecaribean.jpg",
    "rating": 4.7,
    "watched": false,
    "synopsis": "Kapten Jack Sparrow, seorang bajak laut eksentrik, terlibat dalam pencarian harta karun, kutukan, dan petualangan laut yang berbahaya. Dengan humor khasnya, Jack harus menghadapi musuh, makhluk mistis, dan kerajaan yang mengejarnya.",
  },
  {
    "title": "Lord of The Rings",
    "poster":
        "assets/img/thelordoftherings.jpg",
    "rating": 4.9,
    "watched": false,
    "synopsis": "Frodo Baggins, seorang hobbit, diberi tugas berat untuk menghancurkan cincin paling berbahaya yang pernah dibuat. Bersama kelompok Fellowship, ia harus melawan kegelapan yang dipimpin Sauron dan menyelamatkan Middle-earth dari kehancuran.",
  },
  {
    "title": "Harry Potter",
    "poster":
        "assets/img/harrypotter.jpg",
    "rating": 4.8,
    "watched": false,
    "synopsis": "Harry Potter, seorang anak penyihir yang selamat dari serangan penyihir jahat Voldemort, memasuki Hogwarts dan belajar tentang dunia sihir. Bersama teman-temannya, ia menghadapi misteri, bahaya, dan takdir yang membawanya kembali menghadapi Voldemort.",
  },
  {
    "title": "The Godfather",
    "poster":
        "assets/img/thegodfather.jpeg",
    "rating": 4.9,
    "watched": false,
    "synopsis": "Keluarga mafia Corleone yang dipimpin oleh Don Vito Corleone menghadapi persaingan antar keluarga kriminal. Ketika terjadi pengkhianatan, putra Don, Michael Corleone, terpaksa masuk ke dalam dunia kejam mafia dan perlahan menjadi pemimpin baru keluarga.",
  },
  {
    "title": "La La Land",
    "poster":
        "assets/img/lalaland.jpg",
    "rating": 4.6,
    "watched": false,
    "synopsis": "Sebastian, seorang pianis jazz, dan Mia, seorang aktris muda, mengejar impian mereka di Los Angeles. Cinta mereka tumbuh di tengah perjuangan meraih karier, namun mereka harus memilih antara cinta atau mimpi terbesar mereka.",
  },
  {
    "title": "Mission: Impossible",
    "poster":
        "assets/img/missionimposible.jpg",
    "rating": 4.4,
    "watched": false,
    "synopsis": "Ethan Hunt dan tim IMF menjalankan misi-misi berbahaya yang penuh aksi, teknologi canggih, dan penyamaran ekstrem. Mereka harus menyelamatkan dunia dari ancaman teroris, pengkhianatan, dan rencana mematikan.",
  },
  {
    "title": "Top Gun: Maverick",
    "poster":
        "assets/img/topgun.jpg",
    "rating": 4.8,
    "watched": false,
    "synopsis": "Pete 'Maverick' Mitchell kembali sebagai instruktur penerbang untuk melatih generasi baru pilot tempur. Ia menghadapi masa lalu, tantangan baru, dan misi berbahaya yang membutuhkan keberanian serta kemampuan terbaiknya sebagai legenda angkatan udara.",
  },
];


  // =========================
  // SEARCH STATE
  // =========================
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final filteredMovies = movies
        .where(
          (movie) =>
              movie["title"].toLowerCase().contains(searchQuery.toLowerCase()),
        )
        .toList();

    return Scaffold(
      // APPBAR
      appBar: AppBar(
      backgroundColor: isDarkMode ? const Color(0xFF2E3047) : Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Text( "Movie List", style: TextStyle(color: isDarkMode ? Colors.white : Colors.black87), ),

      // === ICONS ACTIONS ===
      actions: [
        // Sorting
        PopupMenuButton<String>(
          icon: Icon(
            Icons.sort,
            color: isDarkMode ? Colors.white : Colors.black87,
          ),
          color: isDarkMode ? const Color(0xFF2E3047) : Colors.white,
          onSelected: (value) {
            setState(() {
              if (value == "az") {
                movies.sort((a, b) => a["title"].compareTo(b["title"]));
              } else if (value == "za") {
                movies.sort((a, b) => b["title"].compareTo(a["title"]));
              } else if (value == "rating") {
                movies.sort((a, b) => b["rating"].compareTo(a["rating"]));
              }
            });
          },
          itemBuilder: (_) => [
            PopupMenuItem(
              value: "az",
              child: Text(
                "A → Z",
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black87,
                ),
              ),
            ),
            PopupMenuItem(
              value: "za",
              child: Text(
                "Z → A",
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black87,
                ),
              ),
            ),
            PopupMenuItem(
              value: "rating",
              child: Text(
                "Rating Tertinggi",
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black87,
                ),
              ),
            ),
          ],
        ),

        // Dark Mode Toggle
        IconButton(
          icon: Icon(
            isDarkMode ? Icons.light_mode : Icons.dark_mode,
            color: isDarkMode ? Colors.white : Colors.black87,
          ),
          onPressed: () {
            setState(() {
              isDarkMode = !isDarkMode;
            });
          },
        ),
      ],
    ),


      // BODY
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDarkMode
                ? const [
                    Color(0xFF2E3047),
                    Color(0xFF7F8CAA),
                    Color(0xFFB7D3D0),
                  ]
                : const [
                    Color(0xFFD3E8E4),
                    Color(0xFFF0F5F4),
                    Color(0xFFFFFFFF),
                  ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Column(
          children: [
            // =========================
            // SEARCH BAR
            // =========================
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black87,
                ),
                decoration: InputDecoration(
                  hintText: "Search movie...",
                  hintStyle: TextStyle(
                    color: isDarkMode ? Colors.white70 : Colors.black54,
                  ),
                  filled: true,
                  fillColor: isDarkMode
                      ? const Color(0xFF7F8CAA)
                      : Colors.white,
                  prefixIcon: Icon(
                    Icons.search,
                    color: isDarkMode ? Colors.white : Colors.black54,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // =========================
            // MOVIE LIST
            // =========================
            Expanded(
              child: ListView.builder(
                itemCount: filteredMovies.length,
                itemBuilder: (context, index) {
                  final movie = filteredMovies[index];

                  return MovieCard(
                    title: movie["title"],
                    posterUrl: movie["poster"],
                    rating: movie["rating"],
                    watched: movie["watched"],

                    // toggle watched
                    onToggleWatched: () {
                      setState(() {
                        movie["watched"] = !movie["watched"];
                      });
                    },

                    // detail page
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              DetailPage(movie: movie, isDarkMode: isDarkMode),
                        ),
                      );
                    },

                    // dark mode pass
                    isDark: isDarkMode,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =========================
// DETAIL PAGE
// =========================
class DetailPage extends StatelessWidget {
  final Map<String, dynamic> movie;
  final bool isDarkMode;

  const DetailPage({super.key, required this.movie, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? const Color(0xFF2E3047) : Colors.white,
      appBar: AppBar(
        backgroundColor: isDarkMode ? const Color(0xFF2E3047) : Colors.white,
        elevation: 0,
        title: Text(
          movie["title"],
          style: TextStyle(color: isDarkMode ? Colors.white : Colors.black87),
        ),
      ),

      // ⬇⬇ Revisi di bagian body
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Poster Film
            Hero(
              tag: movie["poster"],
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  movie["poster"],
                  height: 380,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Sinopsis Film
            Text(
              movie["synopsis"] ?? "No synopsis available.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: isDarkMode ? Colors.white70 : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

