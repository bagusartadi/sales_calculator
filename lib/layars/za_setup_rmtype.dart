import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:packagesendiri/xpackagesendiri.dart';
import 'package:sales_calculator/datas.dart';
import 'package:sales_calculator/moduls/b_room_type.dart';

class SetUpRoomTypeLayar extends StatefulWidget {
  const SetUpRoomTypeLayar({Key? key}) : super(key: key);

  @override
  _SetUpRoomTypeLayarState createState() => _SetUpRoomTypeLayarState();
}

class _SetUpRoomTypeLayarState extends State<SetUpRoomTypeLayar> {
  final TextEditingController controllerRmType = TextEditingController();
  final TextEditingController controllerBAR = TextEditingController();
  final TextEditingController controllerPax = TextEditingController();
  final TextEditingController controllerJumlah = TextEditingController();
  final TextEditingController controllerSpcRate = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool sort = false;
  // List<RoomType> roomtypes = [];

  List<DataRow> _getRoomTypeRow(List<RoomType> roomtypes) => roomtypes
      .map((e) => DataRow(
            // selected: true,
            // onSelectChanged: (ascending) {
            //   roomtypes.removeAt(0);
            //   setState(() {});
            // },
            cells: [
              DataCell(Text(e.jumlah.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 20.0))),
              DataCell(Text(e.pax.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 20.0))),
              DataCell(Text(e.tipeKamar!,
                  style: const TextStyle(color: Colors.white, fontSize: 20.0))),
              DataCell(Text(
                  e.bar == null
                      ? "angka"
                      : NumberFormat.currency(
                              locale: "id", symbol: "Rp", decimalDigits: 0)
                          .format(e.bar),
                  style: const TextStyle(color: Colors.white, fontSize: 20.0))),
            ],
          ))
      .toList();

  @override
  void initState() {
    controllerRmType;
    controllerBAR;
    controllerPax;
    controllerJumlah;
    controllerSpcRate;
    super.initState();
  }

  @override
  void dispose() {
    controllerRmType.dispose();
    controllerBAR.dispose();
    controllerPax.dispose();
    controllerJumlah.dispose();
    controllerSpcRate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Room Type List", style: styleAppBar),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
                backgroundColor: Colors.white,
                maxRadius: 25,
                child: Text('Rp',
                    //nanti diganti DropDownButton [list currency]
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold))),
          )
        ],
      ),
      bottomNavigationBar: const HakPaten(),
      body: Container(
        margin: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  KotakIsian(
                      label: "Room Type",
                      textInputType: TextInputType.text,
                      controller: controllerRmType),
                  Row(children: [
                    Expanded(
                        child: KotakIsian(
                            label: "Pax",
                            textInputType: TextInputType.number,
                            controller: controllerPax)),
                    const SizedBox(width: 2.5),
                    Expanded(
                        child: KotakIsian(
                            label: "Jumlah",
                            textInputType: TextInputType.number,
                            controller: controllerJumlah)),
                  ]),
                  KotakIsian(
                      label: "Best Available Rate",
                      textInputType: TextInputType.number,
                      controller: controllerBAR),
                  Tombol(
                      press: () {
                        if (_formKey.currentState!.validate()) {
                          roomtypes.add(RoomType(
                              tipeKamar: controllerRmType.text,
                              bar: int.tryParse(controllerBAR.text),
                              pax: int.tryParse(controllerPax.text),
                              jumlah: int.tryParse(controllerJumlah.text)));
                        }
                        setState(() {
                          controllerRmType.clear();
                          controllerBAR.clear();
                          controllerPax.clear();
                          controllerJumlah.clear();
                        });
                      },
                      nama: "ENTER"),
                  SizedBox(
                    width: double.infinity,
                    child: DataTable(
                      sortColumnIndex: 3,
                      sortAscending: sort,
                      columnSpacing: 1.0,
                      decoration: BoxDecoration(color: WarnaBerkah.warnaDasar2),
                      columns: [
                        const DataColumn(
                            label: Text(
                          "Jum",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        )),
                        const DataColumn(
                            label: Text(
                          "Pax",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        )),
                        const DataColumn(
                          label: Text("Rm Type",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0)),
                        ),
                        DataColumn(
                            label: const Text(
                              "BAR",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                            onSort: (int index, bool ascending) {
                              if (ascending) {
                                roomtypes
                                    .sort((a, b) => a.bar!.compareTo(b.bar!));
                              } else {
                                roomtypes
                                    .sort((a, b) => b.bar!.compareTo(a.bar!));
                              }
                              setState(() {
                                sort = !sort;
                              });
                            }),
                      ],
                      rows: _getRoomTypeRow(roomtypes),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
