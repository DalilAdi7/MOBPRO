import 'package:flutter/material.dart';

class FreeFireScreen extends StatelessWidget {
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
        title: const Text('Top-Up Free Fire'),
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
                          'assets/ff.png',
                          height: 100,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Top-Up Free Fire',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Diamond Free Fire cepat, aman, dan terpercaya',
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
                      _buildNominalCard(context, '5 Diamonds', 1000),
                      _buildNominalCard(context, '12 Diamonds', 2000),
                      _buildNominalCard(context, '50 Diamonds', 7500),
                      _buildNominalCard(context, '70 Diamonds', 9000),
                      _buildNominalCard(context, '140 Diamonds', 18000),
                      _buildNominalCard(context, '355 Diamonds', 45000),
                      _buildNominalCard(context, '720 Diamonds', 90000),
                      _buildNominalCard(context, '1450 Diamonds', 180000),
                      _buildNominalCard(context, '2180 Diamonds', 270000),
                      _buildNominalCard(context, '3640 Diamonds', 450000),
                      _buildNominalCard(context, '7290 Diamonds', 900000),
                      _buildNominalCard(context, '36500 Diamonds', 4500000),
                      _buildNominalCard(context, '73100 Diamonds', 9000000),
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
