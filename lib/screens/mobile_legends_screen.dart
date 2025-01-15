import 'package:flutter/material.dart';

class MobileLegendsScreen extends StatelessWidget {
  final TextEditingController idController = TextEditingController();

  void _showConfirmationDialog(BuildContext context, int nominal) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Konfirmasi Top-Up',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(
            'ID Akun: ${idController.text}\nNominal: Rp$nominal\n\nApakah Anda yakin ingin melanjutkan?',
            style: const TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Batal',
                style: TextStyle(color: Colors.red),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Tutup dialog
                _processTopUp(context, nominal); // Lanjutkan top-up
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('Konfirmasi'),
            ),
          ],
        );
      },
    );
  }

  void _processTopUp(BuildContext context, int nominal) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Top-Up Rp$nominal untuk ID ${idController.text} berhasil!'),
      ),
    );

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context); // Kembali ke halaman utama
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        title: const Text('Top-Up Mobile Legends'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF7B1FA2), Color(0xFF512DA8)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Ornamen Lingkaran
          Positioned(
            top: -50,
            left: -50,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.purple[400]?.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            right: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.purple[300]?.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Konten Utama
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/ml.png',
                          height: 100,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Top-Up Mobile Legends',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Diamond cepat, aman, dan terpercaya',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Masukkan ID Akun',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: idController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Masukkan ID Akun Anda',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(Icons.account_circle),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Pilih Nominal Top-Up',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 3,
                    ),
                    children: [
                      _buildNominalCard(context, '3 Diamonds', 1200),
                      _buildNominalCard(context, '5 Diamonds', 1500),
                      _buildNominalCard(context, '12 Diamonds', 3500),
                      _buildNominalCard(context, '19 Diamonds', 5500),
                      _buildNominalCard(context, '28 Diamonds', 7600),
                      _buildNominalCard(context, '44 Diamonds', 11400),
                      _buildNominalCard(context, '59 Diamonds', 15200),
                      _buildNominalCard(context, '85 Diamonds', 22000),
                      _buildNominalCard(context, '170 Diamonds', 44000),
                      _buildNominalCard(context, '240 Diamonds', 62000),
                      _buildNominalCard(context, '296 Diamonds', 76000),
                      _buildNominalCard(context, '408 Diamonds', 105000),
                      _buildNominalCard(context, '568 Diamonds', 142500),
                      _buildNominalCard(context, '875 Diamonds', 218500),
                      _buildNominalCard(context, '2010 Diamonds', 475000),
                      _buildNominalCard(context, '4830 Diamonds', 1140000),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNominalCard(BuildContext context, String title, int nominal) {
    return InkWell(
      onTap: () {
        if (idController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Harap masukkan ID akun terlebih dahulu!')),
          );
          return;
        }
        _showConfirmationDialog(context, nominal);
      },
      child: Card(
        color: Colors.purple[100],
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
        ),
      ),
    );
  }
}
