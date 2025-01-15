import 'package:flutter/material.dart';
import 'mobile_legends_screen.dart';
import 'pubg_screen.dart';
import 'free_fire_screen.dart';
import 'genshin_screen.dart';

class HomeScreen extends StatelessWidget {
  void _logout(BuildContext context) async {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> games = [
      {
        'name': 'Mobile Legends',
        'image': 'assets/ml.png',
        'screen': MobileLegendsScreen(),
      },
      {
        'name': 'Free Fire',
        'image': 'assets/ff.png',
        'screen': FreeFireScreen(),
      },
      {
        'name': 'PUBG Mobile',
        'image': 'assets/pubg.png',
        'screen': PubgScreen(),
      },
      {
        'name': 'Genshin Impact',
        'image': 'assets/genshin.png',
        'screen': GenshinScreen(),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade700,
        title: const Text('Top-Up Game'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purpleAccent, Colors.deepPurple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          children: [
            // Bagian logo dan teks judul
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
              child: Column(
                children: [
                  Image.asset(
                    'assets/logo.png', // Pastikan logo Anda ada di folder assets.
                    height: 100,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Pilih Game untuk Top-Up',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black38,
                          blurRadius: 4,
                          offset: Offset(1, 2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Grid game
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: games.length,
                itemBuilder: (context, index) {
                  final game = games[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => game['screen']),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 6,
                      color: Colors.white.withOpacity(0.9),
                      shadowColor: Colors.purple.shade300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Image.asset(
                              game['image'],
                              height: 100,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            game['name'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple.shade800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Kelebihan layanan
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kenapa Harus Top-Up di Sini?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Icon(Icons.check, color: Colors.green),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Proses cepat dan aman.',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Icon(Icons.check, color: Colors.green),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Harga terbaik dengan promo menarik.',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Icon(Icons.check, color: Colors.green),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Mudah digunakan kapan saja.',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
