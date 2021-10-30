import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:packagesendiri/xpackagesendiri.dart';
import 'package:sales_calculator/datas.dart';
import 'package:sales_calculator/moduls/xmoduls.dart';

class SetUpElementPerRoom extends StatefulWidget {
  const SetUpElementPerRoom({Key? key}) : super(key: key);

  @override
  _SetUpElementPerRoomState createState() => _SetUpElementPerRoomState();
}

class _SetUpElementPerRoomState extends State<SetUpElementPerRoom> {
  final TextEditingController _controllername = TextEditingController();
  final TextEditingController _controllerharga = TextEditingController();
  // List<Item> items = [];
  bool sort = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _controllerharga;
    _controllername;
    super.initState();
  }

  @override
  void dispose() {
    _controllername.dispose();
    _controllerharga.dispose();
    super.dispose();
  }

  List<DataRow> getDataRows(List<Item> itemperroom) => itemperroom
      .map((e) => DataRow(cells: [
            DataCell(Text(e.itemName!,
                style: const TextStyle(color: Colors.white, fontSize: 20.0))),
            DataCell(Text(
                e.itemHarga == null
                    ? "harus angka"
                    : NumberFormat.currency(
                            locale: 'id', symbol: "Rp", decimalDigits: 0)
                        .format(e.itemHarga),
                style: const TextStyle(color: Colors.white, fontSize: 20.0))),
          ]))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Price per Room", style: styleAppBar),
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
        body: Stack(
          children: [
            const SizedBox.expand(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      KotakIsian(
                          controller: _controllername,
                          label: 'Item',
                          hint: "element name",
                          textInputType: TextInputType.text),
                      Row(
                        children: [
                          Expanded(
                            child: KotakIsian(
                                label: "harga",
                                hint: "angka",
                                textInputType: TextInputType.number,
                                controller: _controllerharga),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      primary: WarnaBerkah.warnaDasar),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      itemperpax.add(Item(
                                          itemName: _controllername.text,
                                          itemHarga: int.tryParse(
                                              _controllerharga.text)));
                                      setState(() {
                                        _controllername.clear();
                                        _controllerharga.clear();
                                      });
                                    }
                                  },
                                  child: const Icon(
                                      Icons.subdirectory_arrow_left,
                                      color: Colors.black,
                                      size: 50))),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: DataTable(
                          sortColumnIndex: 0,
                          sortAscending: sort,
                          decoration:
                              BoxDecoration(color: WarnaBerkah.warnaDasar2),
                          columns: [
                            DataColumn(
                              label: const Text("Description",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0)),
                              onSort: (int index, bool ascending) {
                                if (ascending) {
                                  itemperroom.sort((a, b) =>
                                      a.itemName!.compareTo(b.itemName!));
                                } else {
                                  itemperroom.sort((a, b) =>
                                      b.itemName!.compareTo(a.itemName!));
                                }
                                setState(() {
                                  sort = ascending;
                                });
                              },
                            ),
                            const DataColumn(
                                label: Text("Harga ++",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0))),
                          ],
                          rows: getDataRows(itemperroom),
                        ),
                      ),
                      // buildDataTable(context),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
