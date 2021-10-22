import 'package:flutter/material.dart';

class MarkUpCopy extends StatelessWidget {
  final String? label1;
  final Widget? child1;
  final String? label2;
  final Widget? child2;
  const MarkUpCopy(
      {Key? key, this.label1, this.child1, this.label2, this.child2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
                child: Text(label1!,
                    textAlign: TextAlign.center,
                    style:
                        const TextStyle(fontSize: 20.0, color: Colors.white))),
          ),
          const SizedBox(width: 8.0),
          Container(
              width: 85.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.lightBlue, width: 3.0),
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: child1!),
          const SizedBox(width: 1.5),
          const Text(
            '%',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          const SizedBox(width: 1.5),
          Container(
              width: 85.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.lightBlue, width: 3.0),
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: child2!),
          const SizedBox(width: 8.0),
          Expanded(
            child: SizedBox(
                child: Text(label2!,
                    textAlign: TextAlign.center,
                    style:
                        const TextStyle(fontSize: 20.0, color: Colors.white))),
          ),
        ],
      ),
    );
  }
}
