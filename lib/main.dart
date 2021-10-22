import 'package:flutter/material.dart';
import 'package:packagesendiri/xpackagesendiri.dart';
import 'package:sales_calculator/layars/xlayars.dart';

void main() {
  runApp(const MyCal());
}

class MyCal extends StatelessWidget {
  const MyCal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotel Sales Calculator',
      theme: ThemeData(
          visualDensity: VisualDensity.comfortable,
          primaryColor: WarnaBerkah.warnaDasar,
          scaffoldBackgroundColor: WarnaBerkah.warnaDasar,
          backgroundColor: WarnaBerkah.warnaDasar,
          dialogBackgroundColor: WarnaBerkah.warnaDasar2,
          appBarTheme: appBarBB,
          splashColor: Colors.white60,
          bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white)),
      home: const LoginPage(),
    );
  }
}
