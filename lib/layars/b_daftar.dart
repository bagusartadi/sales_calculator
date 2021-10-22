import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:packagesendiri/xpackagesendiri.dart';
import 'package:sales_calculator/datas.dart';
import 'package:sales_calculator/layars/xlayars.dart';
import 'package:sales_calculator/moduls/a_user.dart';

class DaftarPage extends StatefulWidget {
  const DaftarPage({Key? key}) : super(key: key);

  @override
  State<DaftarPage> createState() => _DaftarPageState();
}

class _DaftarPageState extends State<DaftarPage> {
  TextEditingController controlleremail = TextEditingController();
  TextEditingController controllerpasw = TextEditingController();
  TextEditingController controllerrepasw = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    controlleremail;
    controllerpasw;
    controllerrepasw;
    super.initState();
  }

  @override
  void dispose() {
    controlleremail.dispose();
    controllerpasw.dispose();
    controllerrepasw.dispose();
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
                        controller: controlleremail,
                        label: 'email',
                        textInputType: TextInputType.emailAddress),
                    KotakIsian(
                        controller: controllerpasw,
                        label: 'password',
                        textInputType: TextInputType.visiblePassword),
                    KotakIsian(
                        controller: controllerrepasw,
                        label: 're-type password',
                        textInputType: TextInputType.visiblePassword),
                    Tombol(
                      press: () {
                        if (_formKey.currentState!.validate()) {
                          onlineUsers.add(
                            UserCal(
                                email: controlleremail.text,
                                password: (controllerpasw.text ==
                                        controllerrepasw.text)
                                    ? controllerpasw.text
                                    : "pasw gak sama"),
                          );
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DaftarPage2()));
                      },
                      nama: 'Daftar',
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
