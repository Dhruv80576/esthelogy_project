import 'package:flutter/material.dart';

class UploadIndicator extends StatefulWidget {
  final int count;
  const UploadIndicator(this.count, {super.key});

  @override
  State<UploadIndicator> createState() => _UploadIndicatorState();
}

class _UploadIndicatorState extends State<UploadIndicator> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 100,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.blue,
          ),
        ),
        SizedBox(width: 10,),
        Container(
          width: 100,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.blue,
          ),
        ),
        SizedBox(width: 10,),
        Container(
          width: 100,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
