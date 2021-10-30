import 'package:flutter/material.dart';
import 'package:packagesendiri/xpackagesendiri.dart';
import 'package:sales_calculator/layars/xlayars.dart';
import 'package:sales_calculator/layars/z_setup_rmtype.dart';

class PilihElement extends StatelessWidget {
  const PilihElement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SET UP PAGE', style: styleAppBar)),
      bottomNavigationBar: const HakPaten(),
      body: Container(
        margin: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Tombol(
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SetUpRoomTypeLayar()));
                },
                nama: 'Room Type'),
            Tombol(
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SetUpElementPerPax()));
                },
                nama: 'Package element\n per pax',
                warna: Colors.brown[800],
                height: 80.0),
            Tombol(
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SetUpElementPerRoom()));
                },
                nama: 'Package element\n per room',
                warna: Colors.brown[800],
                height: 80.0),
            Tombol(
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SetUpGovernmentLayar()));
                },
                nama: 'Tax & Service',
                warna: Colors.blueGrey),
            Tombol(
                press: () {}, nama: 'Currency SetUp', warna: Colors.blueGrey),
            Tombol(press: () {}, nama: 'RESET ALL', warna: Colors.red),
          ],
        ),
      ),
    );
  }
}
