import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:packagesendiri/copyrights.dart';
import 'package:packagesendiri/logobb_wid.dart';
import 'package:packagesendiri/warna_berkah.dart';
import 'package:sales_calculator/layars/c_login.dart';

class DaftarPage2 extends StatefulWidget {
  const DaftarPage2({Key? key}) : super(key: key);

  @override
  State<DaftarPage2> createState() => _DaftarPage2State();
}

class _DaftarPage2State extends State<DaftarPage2> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isClick = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sales Calculator', style: styleAppBar)),
      bottomNavigationBar: const HakPaten(),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: LogoBB(imageUrl: 'images/EngMindset.jpg'),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: CupertinoFormSection.insetGrouped(
                  backgroundColor: WarnaBerkah.warnaDasar,
                  children: [
                    CupertinoTextFormFieldRow(
                      textInputAction: TextInputAction.next,
                      placeholder: 'Enter Name',
                      prefix: const Icon(Icons.drive_file_rename_outline),
                    ),
                    CupertinoTextFormFieldRow(
                      textInputAction: TextInputAction.next,
                      placeholder: 'Enter email',
                      prefix: const Icon(Icons.email_outlined),
                      validator: (email) =>
                          email != null && !EmailValidator.validate(email)
                              ? 'Enter valid email'
                              : null,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    CupertinoTextFormFieldRow(
                      placeholder: 'Enter password',
                      obscureText: true,
                      prefix: const Icon(Icons.security),
                      validator: (password) {
                        if (password == null || password.isEmpty) {
                          return 'Enter a valid password';
                        } else if (password.length < 6) {
                          return 'Must be at least 6 characters long';
                        } else {
                          return null;
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: CupertinoButton.filled(
                  child: const Text('Submit'),
                  onPressed: () {
                    final form = formKey.currentState!;
                    if (form.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
