import 'package:flutter/material.dart';
import 'package:packagesendiri/copyrights.dart';
import 'package:packagesendiri/tombol.dart';
import 'package:packagesendiri/warna_berkah.dart';

class PilihCurrency extends StatelessWidget {
  const PilihCurrency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sales Calculator', style: styleAppBar)),
      bottomNavigationBar: const HakPaten(),
      body: Container(
        margin: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Tombol(press: () {}, nama: 'RUPIAH'),
            Tombol(press: () {}, nama: 'USD', warna: Colors.green[800]),
          ],
        ),
      ),
    );
  }
}
