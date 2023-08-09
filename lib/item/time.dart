import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({super.key});

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  DateTime dateTime = DateTime.now();
  String ampm = 'AM';
  bool click = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(children: [
          SizedBox(
            height: 50,
            width: 120,
            child: CupertinoDatePicker(
              backgroundColor: Colors.white,
              use24hFormat: true,
              initialDateTime: dateTime,
              mode: CupertinoDatePickerMode.time,
              onDateTimeChanged: (datetime) =>
                  setState(() => dateTime = dateTime),
            ),
          ),
          const Positioned(
              left: 60,
              top: 15,
              child: Text(
                ':',
                style: TextStyle(fontWeight: FontWeight.bold),
              ))
        ]),
        InkWell(
          onTap: () {
            if (ampm == 'AM') {
              ampm = 'PM';
              click = true;
            } else {
              ampm = 'AM';
              click = true;
            }
            setState(() {});
          },
          child: Container(
            height: 40,
            width: 60,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    spreadRadius: 5,
                    blurRadius: 5,
                    color: Color.fromARGB(255, 208, 204, 204),
                  ),
                ],
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                ampm,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
