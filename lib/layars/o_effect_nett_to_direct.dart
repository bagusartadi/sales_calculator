import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:packagesendiri/xpackagesendiri.dart';
import 'package:sales_calculator/datas.dart';
import 'package:sales_calculator/layars/d_pilih_channel.dart';
import 'package:sales_calculator/moduls/xmoduls.dart';
import 'package:sales_calculator/widgets/xwidgets.dart';

class EffectRateAgentToDirect extends StatefulWidget {
  const EffectRateAgentToDirect({Key? key}) : super(key: key);

  @override
  _EffectRateAgentToDirectState createState() =>
      _EffectRateAgentToDirectState();
}

class _EffectRateAgentToDirectState extends State<EffectRateAgentToDirect> {
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
          mobile:
              _MobEffectRateDirToAgent(controller: _trackingScrollController!),
        ),
      ),
    );
  }
}

class _MobEffectRateDirToAgent extends StatefulWidget {
  final TrackingScrollController? controller;
  const _MobEffectRateDirToAgent({Key? key, this.controller}) : super(key: key);

  @override
  State<_MobEffectRateDirToAgent> createState() =>
      _MobEffectRateDirToAgentState();
}

class _MobEffectRateDirToAgentState extends State<_MobEffectRateDirToAgent> {
  String? angkaPaidNight;
  String? angkaComNight;
  String? angkaMarkUpPlus;
  String? angkaMarkUpNet = '0.0';

  final RoomType? roomType;

  _MobEffectRateDirToAgentState({this.roomType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollView(
        controller: widget.controller,
        slivers: [
          const SliverAppBar(
            pinned: true,
            title: Text('Sales Calculator',
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
          const SliverToBoxAdapter(
              child: Text('Rate to Agent',
                  style: TextStyle(fontSize: 25, color: Colors.lightBlue),
                  textAlign: TextAlign.center)),
          SliverToBoxAdapter(
            child: MarkUp(
              label1: 'EXClude\ntax&serv',
              child1: DropdownButton(
                dropdownColor: WarnaBerkah.warnaDasar2,
                borderRadius: BorderRadius.circular(8.0),
                style: const TextStyle(color: Colors.white, fontSize: 25.0),
                items: markUpx
                    .map((e) => DropdownMenuItem(child: Text(e), value: e))
                    .toList(),
                value:
                    angkaMarkUpPlus, //kalau include tax terisi otomatis ini null, angkanya ikuti page sblm nya
                onChanged: (value) {
                  setState(() {
                    angkaMarkUpPlus = value as String;
                  });
                },
              ),
              label2: 'INClude\ntax&serv',
              child2: DropdownButton(
                dropdownColor: WarnaBerkah.warnaDasar2,
                borderRadius: BorderRadius.circular(8.0),
                style: const TextStyle(color: Colors.white, fontSize: 25.0),
                items: markUpx
                    .map((e) => DropdownMenuItem(child: Text(e), value: e))
                    .toList(),
                value: markUpx[0], //kalau Exclude tax terisi otomatis ini null
                // onChanged: (value) {
                //   setState(() {
                //     angkaMarkUpNet = value as String;
                //   });
                // },
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Divider(
                color: Colors.grey, thickness: 2.0, indent: 5, endIndent: 5),
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
            child: DaftarHeader(label: 'Effective Rate'),
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
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    size: 30.0,
                  ),
                )),
          ),
          // SliverToBoxAdapter(
          //   child: ListTile(
          //     title: const Text(
          //       'Extra Adult (12years old and above)',
          //       style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontStyle: FontStyle.italic,
          //           fontSize: 19.0,
          //           color: Colors.blueAccent,
          //           letterSpacing: 1.5),
          //     ),
          //     trailing: IconButton(
          //       onPressed: () {},
          //       icon: const Icon(
          //         Icons.arrow_drop_down_circle_outlined,
          //         size: 30.0,
          //       ),
          //     ),
          //   ),
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
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    size: 30.0,
                  ),
                )),
          ),
          SliverToBoxAdapter(child: Tombol(press: () {}, nama: 'Email')),
          SliverToBoxAdapter(
              child: Tombol(
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PilihChannel()));
                  },
                  nama: 'Home')),
        ],
      ),
    );
  }
}
