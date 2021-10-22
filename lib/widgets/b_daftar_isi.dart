import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sales_calculator/moduls/b_room_type.dart';

class DaftarIsi extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  final RoomType? roomType;
  final String? hint;
  DaftarIsi({
    Key? key,
    this.roomType,
    this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        children: [
          Container(
            width: 45,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white60),
                borderRadius: BorderRadius.circular(5.0)),
            child: Text('${roomType!.pax}',
                style: const TextStyle(color: Colors.white, fontSize: 23.0)),
          ),
          Expanded(
              child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  alignment: Alignment.centerRight,
                  child: Text('${roomType!.tipeKamar}',
                      style: const TextStyle(
                          fontSize: 23.0, color: Colors.white)))),
          Container(
              width: 150.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white60),
                  borderRadius: BorderRadius.circular(5.0)),
              child: TextField(
                controller: _textEditingController,
                style: const TextStyle(color: Colors.white, fontSize: 23.0),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: hint!,
                  hintStyle: const TextStyle(color: Colors.grey),
                  focusColor: Colors.white,
                  fillColor: Colors.white,
                ),
              ))
        ],
      ),
    );
  }
}
