import 'package:flutter/material.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  final _formKey = GlobalKey<FormState>();
  double _riskTolerance = 3.0;
  double _ideaSupport = 3.0;
  bool _hasRewardSystem = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Survei Persepsi Karyawan'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const Text(
              'Pengumpulan Data Budaya Organisasi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('Data ini digunakan untuk mengukur dampak budaya terhadap kreativitas.'),
            const Divider(height: 30),

            // Pertanyaan 1
            const Text('1. Seberapa besar perusahaan mentolerir kegagalan dalam eksperimen ide baru?', style: TextStyle(fontWeight: FontWeight.w500)),
            Slider(
              value: _riskTolerance,
              min: 1,
              max: 5,
              divisions: 4,
              label: _riskTolerance.round().toString(),
              onChanged: (value) {
                setState(() {
                  _riskTolerance = value;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Text('Sangat Kaku'), Text('Sangat Toleran')],
            ),
            const SizedBox(height: 20),

            // Pertanyaan 2
            const Text('2. Apakah atasan langsung mendukung ide-ide "out of the box"?', style: TextStyle(fontWeight: FontWeight.w500)),
            Slider(
              value: _ideaSupport,
              min: 1,
              max: 5,
              divisions: 4,
              label: _ideaSupport.round().toString(),
              onChanged: (value) {
                setState(() {
                  _ideaSupport = value;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Text('Tidak Mendukung'), Text('Sangat Mendukung')],
            ),
            const SizedBox(height: 20),

            // Pertanyaan 3
            SwitchListTile(
              title: const Text('Apakah ada sistem penghargaan (reward) khusus untuk inovasi?'),
              subtitle: const Text('Bonus, promosi, atau pengakuan publik.'),
              value: _hasRewardSystem,
              onChanged: (bool value) {
                setState(() {
                  _hasRewardSystem = value;
                });
              },
            ),

            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Kendala Utama Berinovasi',
                border: OutlineInputBorder(),
                hintText: 'Misal: Birokrasi berbelit, kurang dana...',
              ),
              maxLines: 3,
            ),

            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Data survei berhasil disimpan untuk analisis.')),
                  );
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Simpan Data'),
            ),
          ],
        ),
      ),
    );
  }
}
