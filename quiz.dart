import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: HalamanQuiz(),
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
      ('images/vokasi.jpg'),
    ),
    Pertanyaan(
      'Di kota mana Unesa berada?',
      ['A. Surabaya', 'B. Mojokerto', 'C. Malang', 'D. Sidoarjo'],
      'A. Surabaya',
      ('images/kampus.png'),
    ),
    Pertanyaan(
      'Manajemen Informatika berada di Fakultas',
      ['A. Teknik', 'B. Vokasi', 'C. Bahasa', 'D. Sidoarjo'],
      'B. Vokasi',
      ('images/himti.jpg'),
    ),
    Pertanyaan(
      'Berapa Jumlah Fakultas yang berada di Kampus Lidah Wetan?',
      ['A. Sembilan', 'B. Dua', 'C. Tiga', 'D. Empat'],
      'C. Tiga',
      ('images/futsal.jpg'),
    ),
    Pertanyaan(
      'Dimana Kampus Cabang Unesa?',
      ['A. Jombang', 'B. Singapura', 'C. Hongkong', 'D. Magetan'],
      'D. Magetan',
      ('images/magetan.jpeg'),
    ),
    Pertanyaan(
      'Berapa Lama 1 Jam Kuliah saat bulan puasa?',
      ['A. 50 menit', 'B. 40 menit', 'C. 30 menit', 'D. 60 menit'],
      'B. 40 menit',
      ('images/ramadhan.png'),
    ),
    Pertanyaan(
      'Berapa total sks D4 MI 2022?',
      ['A. 144', 'B. 120', 'C. 150', 'D. 18'],
      'A. 144',
      ('images/manajemeninformatika.png'),
    ),
    Pertanyaan(
      'Gedung mana yang sering digunakan praktik mengajar untuk mahasiswa Manajemen informatika 2022?',
      ['A. K2', 'B. K10', 'C. A10', 'D. K4'],
      'A. K2',
      ('images/gedung.png'),
    ),
    Pertanyaan(
      'Dimana lokasi Fakultas Ilmu Pendidikan?',
      ['A. Lidah Wetan', 'B. Surabaya', 'C. Ketintang', 'D. Ngagel'],
      'C. Ketintang',
      ('images/fip.jpg'),
    ),
    Pertanyaan(
      'Bapak Dosen I Gde Agung Sri Sidhimantra, S.Kom., M.Kom. mengampu mata kuliah apa?',
      ['A. Kewarganegaraan', 'B. Basis Data', 'C. ALPRO', 'D. PemGame'],
      'A. PemWeb',
      ('images/dosen.jpg'),
    ),
  ];
  int nomorPertanyaan = 0;
  int skor = 0;

  void pilihJawaban(String jawaban) {
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
        Flexible(
          child: Padding(
            padding: EdgeInsets.all(25.0),
            child: Container(
              color: Colors.white, // Warna latar belakang putih
              padding: EdgeInsets.all(25.0), // Padding di sekitar teks pertanyaan
              child: Column(
                children: [
                  Flexible(
                    child: Text(
                      bankSoal[nomorPertanyaan].pertanyaan,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  Image.asset(
                    bankSoal[nomorPertanyaan].gambar,
                    width: 150, // Sesuaikan ukuran gambar di sini
                    height: 150, // Sesuaikan ukuran gambar di sini
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: bankSoal[nomorPertanyaan].jawaban.map((jawaban) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: ElevatedButton(
                  onPressed: () {
                    pilihJawaban(jawaban);
                  },
                  child: Text(
                    jawaban,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        // Bagian lain dari kode tidak perlu dimodifikasi
      ],
    );
  }
}

class Pertanyaan {
  String pertanyaan;
  List<String> jawaban;
  String kunciJawaban;
  String gambar;

  Pertanyaan(this.pertanyaan, this.jawaban, this.kunciJawaban,this.gambar);
}
