import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:packagesendiri/xpackagesendiri.dart';
import 'package:sales_calculator/datas.dart';
import 'package:sales_calculator/moduls/d_daftar_inclusion.dart';

class DaftarInclusion extends StatefulWidget {
  final Inclusion? inclusion;
  const DaftarInclusion({Key? key, this.inclusion}) : super(key: key);

  @override
  State<DaftarInclusion> createState() => _DaftarInclusionState();
}

class _DaftarInclusionState extends State<DaftarInclusion> {
  String? kaliPilihan;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 70.0,
          alignment: Alignment.center,
          child: Text('${widget.inclusion!.namaOutlet}',
              softWrap: true,
              style: const TextStyle(color: Colors.white, fontSize: 20.0)),
        ),
        Expanded(
          child: Container(
              width: 100,
              alignment: Alignment.center,
              child: Text('${widget.inclusion!.element}',
                  style: const TextStyle(color: Colors.white, fontSize: 20.0))),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 2.5, vertical: 1.0),
          width: 90,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white60),
              borderRadius: BorderRadius.circular(7.0)),
          child: DropdownButton(
            alignment: AlignmentDirectional.center,
            style: const TextStyle(color: Colors.white, fontSize: 20.0),
            dropdownColor: WarnaBerkah.warnaDasar2,
            borderRadius: BorderRadius.circular(8.0),
            items: pilihKali
                .map((e) => DropdownMenuItem(child: Text(e), value: e))
                .toList(),
            value: kaliPilihan,
            onChanged: (value) {
              setState(() {
                kaliPilihan = value as String;
              });
            },
          ),
        ),
      ],
    );
  }
}
