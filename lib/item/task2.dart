import 'package:flutter/material.dart';

class TaskTwo extends StatefulWidget {
  const TaskTwo({
    Key? key,
    required this.title,
    required this.color,
    required this.time,
    required this.decoration,
    required this.fontWeight,
  }) : super(key: key);
  final String title;
  final String time;
  final Color color;
  final TextDecoration? decoration;
  final FontWeight? fontWeight;

  @override
  State<TaskTwo> createState() => _TaskTwoState();
}

class _TaskTwoState extends State<TaskTwo> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        minLeadingWidth: 1,
        leading: const Padding(
          padding: EdgeInsets.only(left: 8, top: 10),
          child: Icon(
            Icons.circle,
            size: 15,
          ),
        ),
        title: Transform.translate(
            offset: const Offset(-8, 0),
            child: Text(
              widget.title,
              maxLines: 2,
              style: TextStyle(
                  fontWeight: widget.fontWeight,
                  color: widget.color,
                  fontSize: 13.5,
                  decoration: widget.decoration),
            )),
        subtitle: Transform.translate(
            offset: const Offset(-10, 3), child: Text(widget.time)));
  }
}
