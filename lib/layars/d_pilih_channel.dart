import 'package:flutter/material.dart';
import 'package:packagesendiri/xpackagesendiri.dart';
import 'package:sales_calculator/layars/xlayars.dart';

class PilihChannel extends StatelessWidget {
  const PilihChannel({Key? key}) : super(key: key);

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
            Tombol(
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BuatPackPlus()));
                },
                nama: 'DIRECT ++'),
            Tombol(
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BuatPackNett()));
                },
                nama: 'AGENT NETT',
                warna: Colors.green[800]),
            const SizedBox(height: 100.0),
            Tombol(
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PilihElement()));
                },
                nama: "Set-Up Elements",
                warna: WarnaBerkah.warnaDasar),
          ],
        ),
      ),
    );
  }
}
