import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:packagesendiri/xpackagesendiri.dart';
import 'xlayars.dart';

class LayarUtama extends StatelessWidget {
  const LayarUtama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sales Calculator', style: styleAppBar)),
      bottomNavigationBar: const Tab(
          child: Text('copyright @2021 balibanjar Inc.\n All Rights Reserved',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey))),
      body: Stack(
        children: [
          const SizedBox(width: double.infinity, height: double.infinity),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Image.asset('images/EngMindset.jpg')),
                Tombol(
                  nama: 'Login',
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 5.0),
                  child: RichText(
                      text: const TextSpan(
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                              fontStyle: FontStyle.italic),
                          children: [
                        TextSpan(text: 'klik tombol '),
                        TextSpan(
                            text: ' DAFTAR ',
                            style: TextStyle(color: Colors.red)),
                        TextSpan(
                          text: ' jika belum ada LOGIN ID',
                        ),
                      ])),
                ),
                const SizedBox(height: 10.0),
                Tombol(
                  nama: 'Daftar',
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DaftarPage()));
                  },
                ),
                const SizedBox(
                  width: double.infinity,
                  height: 275.0,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '\nMobile Aplikasi ini akan sangat membantu sales person dalam berkomunikasi dengan travel agent dalam menentukan harga terbaik.\n\nKecepatan dan ketepatan dalam menghitung harga kamar terbaik buat kedua belah pihak adalah kelebihan utama aplikasi ini',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
