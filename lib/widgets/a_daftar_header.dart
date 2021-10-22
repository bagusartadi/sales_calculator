import 'package:flutter/material.dart';

class DaftarHeader extends StatelessWidget {
  final String? label;
  const DaftarHeader({
    Key? key,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 2.0),
      child: Row(
        children: [
          Container(
            width: 45,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white60),
                borderRadius: BorderRadius.circular(5.0)),
            child: const Text('Pax',
                style: TextStyle(color: Colors.white, fontSize: 19.0)),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 2.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white60),
                  borderRadius: BorderRadius.circular(5.0)),
              child: const Text(
                'Room Types',
                style: TextStyle(color: Colors.white, fontSize: 19.0),
              ),
            ),
          ),
          Container(
            width: 150.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white60),
                borderRadius: BorderRadius.circular(5.0)),
            child: Text(label!,
                style: const TextStyle(color: Colors.white, fontSize: 19.0)),
          ),
        ],
      ),
    );
  }
}
