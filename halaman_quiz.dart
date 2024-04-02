import 'package:flutter/material.dart';
import 'pertanyaan.dart';

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
    // Tambahkan pertanyaan lainnya di sini
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
            crossAxisCount: 2,
            childAspectRatio: 3.0,
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
                      fontSize: 20.0,
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
