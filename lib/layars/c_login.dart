import 'package:flutter/material.dart';
import 'package:packagesendiri/warna_berkah.dart';
import 'package:packagesendiri/xpackagesendiri.dart';
import 'package:sales_calculator/layars/xlayars.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPasw = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    controllerEmail;
    controllerPasw;
    super.initState();
  }

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPasw.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sales Calculator', style: styleAppBar)),
      bottomNavigationBar: const HakPaten(),
      body: Stack(
        children: [
          const SizedBox(height: double.infinity, width: double.infinity),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: LogoBB(
                        imageUrl: 'images/EngMindset.jpg',
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Divider(
                          thickness: 2.5,
                          color: Colors.grey,
                          indent: 25.0,
                          endIndent: 25.0),
                    ),
                    KotakIsian(
                        controller: controllerEmail,
                        label: 'email',
                        textInputType: TextInputType.emailAddress),
                    KotakIsian(
                        controller: controllerPasw,
                        label: 'password',
                        textAcak: true,
                        textInputType: TextInputType.visiblePassword),
                    Tombol(
                      press: () {
                        if (_formKey.currentState!.validate()) {}
                        print('name:' + controllerEmail.text);
                        print('pasw:' + controllerPasw.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PilihChannel()));
                      },
                      nama: 'Masuk',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
