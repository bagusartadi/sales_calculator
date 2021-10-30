import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:packagesendiri/xpackagesendiri.dart';
import 'package:sales_calculator/datas.dart';
import 'package:sales_calculator/layars/h_effect_rate_direct.dart';
import 'package:sales_calculator/moduls/xmoduls.dart';
import 'package:sales_calculator/widgets/xwidgets.dart';

class BuatPackPlus extends StatefulWidget {
  const BuatPackPlus({Key? key}) : super(key: key);

  @override
  _BuatPackPlusState createState() => _BuatPackPlusState();
}

class _BuatPackPlusState extends State<BuatPackPlus> {
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
          mobile: _MobileBuatPackPlus(controller: _trackingScrollController!),
        ),
      ),
    );
  }
}

class _MobileBuatPackPlus extends StatefulWidget {
  final TrackingScrollController? controller;
  const _MobileBuatPackPlus({Key? key, this.controller}) : super(key: key);

  @override
  State<_MobileBuatPackPlus> createState() => _MobileBuatPackPlusState();
}

class _MobileBuatPackPlusState extends State<_MobileBuatPackPlus> {
  String? angkaPaidNight;
  String? angkaComNight;
  bool isVisible = false;
  bool isVisible2 = false;
  bool isVisible3 = false;

  final RoomType? roomType;

  _MobileBuatPackPlusState({this.roomType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollView(
        controller: widget.controller,
        slivers: [
          const SliverAppBar(
            pinned: true,
            title: Text('Sales Calculator ++',
                style: styleAppBar, textAlign: TextAlign.center),
            actions: [
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
                        hint: 'Rp ++',
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
                  onPressed: () {
                    isVisible = !isVisible;
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    size: 30.0,
                  ),
                )),
          ),
          SliverVisibility(
            visible: isVisible,
            maintainState: true,
            sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) =>
                        DaftarInclusion(inclusion: inclusionx[index]),
                    childCount: inclusionx.length)),
          ),
          // SliverToBoxAdapter(
          //     child: ListTile(
          //   title: const Text(
          //     'Extra Adult (12years old and above)',
          //     style: TextStyle(
          //         fontWeight: FontWeight.bold,
          //         fontStyle: FontStyle.italic,
          //         fontSize: 19.0,
          //         color: Colors.blueAccent,
          //         letterSpacing: 1.5),
          //   ),
          //   trailing: IconButton(
          //     onPressed: () {
          //       setState(() {
          //         isVisible2 = !isVisible2;
          //       });
          //     },
          //     icon: const Icon(
          //       Icons.arrow_drop_down_circle_outlined,
          //       size: 30.0,
          //     ),
          //   ),
          // )),
          // SliverVisibility(
          //   visible: isVisible2,
          //   maintainState: true,
          //   sliver: SliverList(
          //       delegate: SliverChildBuilderDelegate(
          //           (context, index) => DaftarInclusion(
          //                 inclusion: extraAdultx[index],
          //               ),
          //           childCount: extraAdultx.length)),
          // ),
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
                  onPressed: () {
                    setState(() {
                      isVisible3 = !isVisible3;
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    size: 30.0,
                  ),
                )),
          ),
          SliverVisibility(
            visible: isVisible3,
            maintainState: true,
            sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) =>
                        DaftarInclusion(inclusion: extraChildx[index]),
                    childCount: extraAdultx.length)),
          ),
          SliverToBoxAdapter(
              child: Tombol(
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EffectiveRateDirect()));
                  },
                  nama: 'Effective rate')),
        ],
      ),
    );
  }
}
