import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class UploadIndicator extends StatefulWidget {
  final int count;
  final int active;

  const UploadIndicator({super.key, required this.active, required this.count});

  @override
  State<UploadIndicator> createState() => _UploadIndicatorState();
}

class _UploadIndicatorState extends State<UploadIndicator> {
  @override
  Widget build(BuildContext context) {
    return
        // Container(
        //   width: 100,
        //   height: 10,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.all(Radius.circular(20)),
        //     color: Colors.blue,
        //   ),
        // );
        ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: 80,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: index+1<=widget.active?Colors.grey:Colors.blue,
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 10,
              );
            },
            itemCount: widget.count);
  }
}
