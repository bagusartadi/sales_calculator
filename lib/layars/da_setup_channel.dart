import 'package:flutter/material.dart';
import 'package:packagesendiri/xpackagesendiri.dart';
import 'package:sales_calculator/layars/xlayars.dart';
import 'package:sales_calculator/layars/za_setup_rmtype.dart';

class PilihElement extends StatelessWidget {
  const PilihElement({Key? key}) : super(key: key);

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
                          builder: (context) => const SetUpRoomTypeLayar()));
                },
                nama: 'Room Type Set-Up'),
            Tombol(
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SetUpOthersLayar()));
                },
                nama: 'FB & Others Set-Up',
                warna: Colors.green[800]),
          ],
        ),
      ),
    );
  }
}
