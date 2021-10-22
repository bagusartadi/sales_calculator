import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:packagesendiri/xpackagesendiri.dart';
import 'package:sales_calculator/datas.dart';
import 'package:sales_calculator/layars/xlayars.dart';
import 'package:sales_calculator/moduls/xmoduls.dart';
import 'package:sales_calculator/widgets/xwidgets.dart';

class BuatPackNett extends StatefulWidget {
  const BuatPackNett({Key? key}) : super(key: key);

  @override
  _BuatPackNettState createState() => _BuatPackNettState();
}

class _BuatPackNettState extends State<BuatPackNett> {
  final TrackingScrollController? _trackingScrollController =
      TrackingScrollController();

  @override
  void dispose() {
    _trackingScrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        bottomNavigationBar: const HakPaten(),
        body: Responsive(
          mobile: _MobileBuatPackNet(controller: _trackingScrollController!),
        ),
      ),
    );
  }
}

class _MobileBuatPackNet extends StatefulWidget {
  final TrackingScrollController? controller;
  const _MobileBuatPackNet({Key? key, this.controller}) : super(key: key);

  @override
  State<_MobileBuatPackNet> createState() => _MobileBuatPackNetState();
}

class _MobileBuatPackNetState extends State<_MobileBuatPackNet> {
  String? angkaPaidNight;
  String? angkaComNight;

  final RoomType? roomType;

  _MobileBuatPackNetState({this.roomType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollView(
        controller: widget.controller,
        slivers: [
          const SliverAppBar(
            pinned: true,
            title: Text('Sales Calculator\n Agent Nett',
                style: styleAppBar, textAlign: TextAlign.center),
            actions: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 25,
                    child: Text('Rp',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold))),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: ListIsian(
              label1: 'Paid\nnight(s)',
              child1: DropdownButton(
                dropdownColor: WarnaBerkah.warnaDasar2,
                borderRadius: BorderRadius.circular(8.0),
                style: const TextStyle(color: Colors.white, fontSize: 25.0),
                items: pilihLos!
                    .map((e) => DropdownMenuItem(child: Text(e), value: e))
                    .toList(),
                value: angkaPaidNight,
                onChanged: (value) {
                  setState(() {
                    angkaPaidNight = value as String;
                  });
                },
              ),
              label2: 'Bonus\nnight(s)',
              child2: DropdownButton(
                dropdownColor: WarnaBerkah.warnaDasar2,
                borderRadius: BorderRadius.circular(8.0),
                style: const TextStyle(color: Colors.white, fontSize: 25.0),
                items: pilihLos!
                    .map((e) => DropdownMenuItem(child: Text(e), value: e))
                    .toList(),
                value: angkaComNight,
                onChanged: (value) {
                  setState(() {
                    angkaComNight = value as String;
                  });
                },
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: DaftarHeader(label: 'Selling Rate'),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => DaftarIsi(
                        hint: 'Rp nett',
                        roomType: roomtypes[index],
                      ),
                  childCount: roomtypes.length)),
          SliverToBoxAdapter(
            child: ListTile(
                title: const Text(
                  'Inclusion: ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 19.0,
                      color: Colors.blueAccent,
                      letterSpacing: 1.5),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    size: 30.0,
                  ),
                )),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) =>
                      DaftarInclusion(inclusion: inclusionx[index]),
                  childCount: inclusionx.length)),
          SliverToBoxAdapter(
            child: ListTile(
              title: const Text(
                'Extra Adult (12years old and above)',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 19.0,
                    color: Colors.blueAccent,
                    letterSpacing: 1.5),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_drop_down_circle_outlined,
                  size: 30.0,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ListTile(
                title: const Text(
                  'Extra Children (6-11years old)',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 19.0,
                      color: Colors.blueAccent,
                      letterSpacing: 1.5),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    size: 30.0,
                  ),
                )),
          ),
          SliverToBoxAdapter(
              child: Tombol(
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EffectiveRateAgent()));
                  },
                  nama: 'Effective rate')),
        ],
      ),
    );
  }
}
