import 'package:flutter/material.dart';

void main() {
  runApp(
    QuizMaba(),
  );
}

class QuizMaba extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade400,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: HalamanQuiz(),
          ),
        ),
      ),
    );
  }
}

class HalamanQuiz extends StatefulWidget {
  @override
  State<HalamanQuiz> createState() => _HalamanQuizState();
}

class _HalamanQuizState extends State<HalamanQuiz> {
  List<Widget> skorMaba = [];
  List<Pertanyaan> bankSoal = [
    Pertanyaan(
      'Berapa jumlah prodi di fakultas vokasi?',
      ['A. 10', 'B. 20', 'C. 30', 'D. 40'],
      'A. 10',
      AssetImage('images/vokasi.jpg'),
    ),
    Pertanyaan(
      'Di kota mana Unesa berada?',
      ['A. Surabaya', 'B. Mojokerto', 'C. Malang', 'D. Sidoarjo'],
      'A. Surabaya',
      AssetImage('images/kampus.png'),
    ),
    Pertanyaan(
      'Manajemen Informatika berada di Fakultas',
      ['A. Teknik', 'B. Vokasi', 'C. Bahasa', 'D. Sidoarjo'],
      'B. Vokasi',
      AssetImage('images/himti.jpg'),
    ),
    Pertanyaan(
      'Berapa Jumlah Fakultas yang berada di Kampus Lidah Wetan?',
      ['A. Sembilan', 'B. Dua', 'C. Tiga', 'D. Empat'],
      'C. Tiga',
      AssetImage('images/futsal.jpg'),
    ),
    Pertanyaan(
      'Dimana Kampus Cabang Unesa?',
      ['A. Jombang', 'B. Singapura', 'C. Hongkong', 'D. Magetan'],
      'D. Magetan',
      AssetImage('images/magetan.jpeg'),
    ),
    Pertanyaan(
      'Berapa Lama 1 Jam Kuliah saat bulan puasa?',
      ['A. 50 menit', 'B. 40 menit', 'C. 30 menit', 'D. 60 menit'],
      'B. 40 menit',
      AssetImage('images/ramadhan.png'),
    ),
    Pertanyaan(
      'Berapa total sks D4 MI 2022?',
      ['A. 144', 'B. 120', 'C. 150', 'D. 18'],
      'A. 144',
      AssetImage('images/manajemeninformatika.png'),
    ),
    Pertanyaan(
      'Gedung mana yang sering digunakan praktik mengajar untuk mahasiswa Manajemen informatika 2022?',
      ['A. K2', 'B. K10', 'C. A10', 'D. K4'],
      'A. K2',
      AssetImage('images/gedung.png'),
    ),
    Pertanyaan(
      'Dimana lokasi Fakultas Ilmu Pendidikan?',
      ['A. Lidah Wetan', 'B. Surabaya', 'C. Ketintang', 'D. Ngagel'],
      'C. Ketintang',
      AssetImage('images/fip.jpg'),
    ),
    Pertanyaan(
      'Bapak Dosen I Gde Agung Sri Sidhimantra, S.Kom., M.Kom. mengampu mata kuliah apa?',
      ['A. Kewarganegaraan', 'B. Basis Data', 'C. ALPRO', 'D. PemGame'],
      'A. PemWeb',
      AssetImage('images/dosen.jpg'),
    ),
  ];
  int nomorPertanyaan = 0;
  int skor = 0;

  void _pilihJawaban(String jawaban) {
    setState(() {
      if (jawaban == bankSoal[nomorPertanyaan].kunciJawaban) {
        skorMaba.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
        skor += 10;
      } else {
        skorMaba.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }

      nomorPertanyaan++;
      if (nomorPertanyaan < bankSoal.length) {
        // Jika masih ada pertanyaan selanjutnya, lanjut ke pertanyaan berikutnya
      } else {
        // Jika sudah menjawab semua pertanyaan, tampilkan skor
        _tampilkanSkor();
      }
    });
  }

  void _tampilkanSkor() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Skor Akhir'),
          content: Text('Skor Anda: $skor'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  nomorPertanyaan = 0;
                  skor = 0;
                  skorMaba.clear();
                });
                Navigator.of(context).pop();
              },
              child: Text('Ulangi'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  bankSoal[nomorPertanyaan].pertanyaan,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 6),
                Image(
                  image: bankSoal[nomorPertanyaan].gambar,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2, // Menentukan jumlah kolom
            childAspectRatio: 3.0, // Mengatur rasio aspek setiap item
            children: bankSoal[nomorPertanyaan].jawaban.map((jawaban) {
              return Padding(
                padding: EdgeInsets.all(15.0),
                child: ElevatedButton(
                  onPressed: () {
                    _pilihJawaban(jawaban);
                  },
                  child: Text(
                    jawaban,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        Row(
          children: skorMaba,
        )
      ],
    );
  }
}

class Pertanyaan {
  String pertanyaan;
  List<String> jawaban;
  String kunciJawaban;
  AssetImage gambar;

  Pertanyaan(this.pertanyaan, this.jawaban, this.kunciJawaban, this.gambar);
}