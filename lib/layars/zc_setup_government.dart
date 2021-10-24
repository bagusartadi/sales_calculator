import 'package:flutter/material.dart';
import 'package:packagesendiri/tombol.dart';
import 'package:packagesendiri/warna_berkah.dart';
import 'package:sales_calculator/datas.dart';
import 'package:sales_calculator/moduls/c_goverment.dart';

class SetUpGovernmentLayar extends StatefulWidget {
  const SetUpGovernmentLayar({Key? key}) : super(key: key);

  @override
  State<SetUpGovernmentLayar> createState() => _SetUpGovernmentLayarState();
}

class _SetUpGovernmentLayarState extends State<SetUpGovernmentLayar> {
  TextEditingController controllerTax = TextEditingController();
  TextEditingController controllerServ = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    controllerTax;
    controllerServ;
    super.initState();
  }

  @override
  void dispose() {
    controllerTax.dispose();
    controllerServ.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Government', style: styleAppBar)),
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: const EdgeInsets.all(8.0),
                      width: 100,
                      child: const Text('Tax: ',
                          style: TextStyle(color: Colors.white, fontSize: 25))),
                  Container(
                      margin: const EdgeInsets.all(8),
                      width: 70,
                      child: TextField(
                          controller: controllerTax,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 25, color: Colors.white),
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder()))),
                  const Text('%',
                      style: TextStyle(color: Colors.white, fontSize: 25)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: const EdgeInsets.all(8.0),
                      width: 100,
                      child: const Text('Service: ',
                          style: TextStyle(color: Colors.white, fontSize: 25))),
                  Container(
                      margin: const EdgeInsets.all(8),
                      width: 70,
                      child: TextField(
                          controller: controllerServ,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 25, color: Colors.white),
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder()))),
                  const Text('%',
                      style: TextStyle(color: Colors.white, fontSize: 25)),
                ],
              ),
              Tombol(
                  press: () {
                    if (_formKey.currentState!.validate()) {
                      pemerintah.add(Government(
                          tax: double.tryParse(controllerTax.text),
                          service: double.tryParse(controllerServ.text)));
                    }
                  },
                  nama: 'Submit'),
            ],
          ),
        ),
      ),
    );
  }
}
