import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Analisis Budaya'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ringkasan Dampak',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Analisis korelasi antara budaya organisasi yang terbuka dengan tingkat inovasi karyawan.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            
            // Kartu Metrik Utama
            Row(
              children: [
                Expanded(child: _buildMetricCard(context, 'Skor Budaya', '8.5/10', Colors.blue)),
                const SizedBox(width: 10),
                Expanded(child: _buildMetricCard(context, 'Indeks Inovasi', '7.2/10', Colors.green)),
              ],
            ),
            const SizedBox(height: 20),

            const Text(
              'Faktor Kunci',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildFactorTile(
              'Kebebasan Berpendapat', 
              'Tinggi', 
              'Karyawan merasa aman untuk menyampaikan ide gila tanpa takut dihakimi.',
              Icons.chat_bubble_outline
            ),
            _buildFactorTile(
              'Toleransi Risiko', 
              'Sedang', 
              'Perusahaan mulai menerima kegagalan sebagai bagian dari proses belajar.',
              Icons.warning_amber_rounded
            ),
            _buildFactorTile(
              'Dukungan Kepemimpinan', 
              'Sangat Tinggi', 
              'Manajemen aktif menyediakan sumber daya untuk proyek eksperimental.',
              Icons.supervisor_account
            ),

            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/survey');
                },
                icon: const Icon(Icons.add_chart),
                label: const Text('Input Data Survei Baru'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricCard(BuildContext context, String title, String value, Color color) {
    return Card(
      elevation: 4,
      color: color.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(title, style: TextStyle(fontSize: 16, color: color.withOpacity(0.8), fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(value, style: TextStyle(fontSize: 28, color: color, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildFactorTile(String title, String status, String description, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.indigo.shade50,
          child: Icon(icon, color: Colors.indigo),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Status: $status', style: const TextStyle(color: Colors.indigo, fontWeight: FontWeight.w500)),
            Text(description, maxLines: 2, overflow: TextOverflow.ellipsis),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
}
